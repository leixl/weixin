package org.easyframework.core.hibernate3;

import static org.hibernate.EntityMode.POJO;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.metadata.ClassMetadata;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.util.Assert;
/**
 * hibernate DAO基类
 * 
 * 提供hql分页查询，拷贝更新等一些常用功能。
 * 
 * @author leixl
 * 
 * @param <T>
 *            entity class
 * @param <ID>
 *            entity id
 */
public abstract class HibernateBaseDao<T, ID extends Serializable> extends
		HibernateSimpleDao {
	
	@Autowired
	private HibernateTemplate template;
	
	/*
	 * 
	 */
	protected Class<T> entityClass;
	
	/*
	 * 
	 */
	protected String className;

	
	@SuppressWarnings("unchecked")
	public HibernateBaseDao() {
		Class<?> entityClass = getClass();
		Type type = entityClass.getGenericSuperclass();
		if (type instanceof ParameterizedType) {
			Type[] parameterizedType = ((ParameterizedType) type)
					.getActualTypeArguments();
			this.entityClass = (Class<T>) parameterizedType[0];
		}

	}

	protected T saveOrUpdate(T entity) {
		template.saveOrUpdate(entity);
		return entity;
	}

	protected void delete(T entity) {
		template.delete(entity);

	}

	protected T getById(ID id) {
		return template.get(entityClass, id);
	}

	/**
	 * 按属性查找对象列表
	 */
	@SuppressWarnings("unchecked")
	protected List<T> findByProperty(String property, Object value) {
		Assert.hasText(property);
		return createCriteria(Restrictions.eq(property, value)).list();
	}

	/**
	 * 按属性查找唯一对象
	 */
	@SuppressWarnings("unchecked")
	protected T findUniqueByProperty(String property, Object value) {
		Assert.hasText(property);
		Assert.notNull(value);
		return (T) createCriteria(Restrictions.eq(property, value))
				.uniqueResult();
	}

	/**
	 * 按属性统计记录数
	 * 
	 * @param property
	 * @param value
	 * @return
	 */
	protected int countByProperty(String property, Object value) {
		Assert.hasText(property);
		Assert.notNull(value);
		return ((Number) (createCriteria(Restrictions.eq(property, value))
				.setProjection(Projections.rowCount()).uniqueResult()))
				.intValue();
	}

	/**
	 * 按Criterion查询列表数据.
	 * 
	 * @param criterion
	 *            数量可变的Criterion.
	 */
	@SuppressWarnings("unchecked")
	protected List findByCriteria(Criterion... criterion) {
		return createCriteria(criterion).list();
	}

	/**
	 * 通过Updater更新对象
	 * 
	 * @param updater
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public T updateByUpdater(Updater<T> updater) {
		ClassMetadata cm = sessionFactory.getClassMetadata(entityClass);
		T bean = updater.getBean();
		T po = (T) getSession().get(entityClass,
				cm.getIdentifier(bean, POJO));
		updaterCopyToPersistentObject(updater, po, cm);
		return po;
	}

	/**
	 * 将更新对象拷贝至实体对象，并处理many-to-one的更新。
	 * 
	 * @param updater
	 * @param po
	 */
	private void updaterCopyToPersistentObject(Updater<T> updater, T po,
			ClassMetadata cm) {
		String[] propNames = cm.getPropertyNames();
		String identifierName = cm.getIdentifierPropertyName();
		T bean = updater.getBean();
		Object value;
		for (String propName : propNames) {
			if (propName.equals(identifierName)) {
				continue;
			}
			try {
				value = MyBeanUtils.getSimpleProperty(bean, propName);
				if (!updater.isUpdate(propName, value)) {
					continue;
				}
				cm.setPropertyValue(po, propName, value, POJO);
			} catch (Exception e) {
				throw new RuntimeException(
						"copy property to persistent object failed: '"
								+ propName + "'", e);
			}
		}
	}

	/**
	 * 根据Criterion条件创建Criteria,后续可进行更多处理,辅助函数.
	 */
	protected Criteria createCriteria(Criterion... criterions) {
		Criteria criteria = getSession().createCriteria(entityClass);
		for (Criterion c : criterions) {
			criteria.add(c);
		}
		return criteria;
	}
}
