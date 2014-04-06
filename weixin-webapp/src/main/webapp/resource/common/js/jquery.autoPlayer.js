var Class={
	create:function(){
		return function(){
			this.initialize.apply(this,arguments);
		}
	}
}
var AutoPlayer=Class.create();
AutoPlayer.prototype={
	//播放的json数据
	data:null,
	//当前播放编号
	index:null,
	//导航栏显示条数
	navSize:null,
	//播放的时间间隔
	interval:null,
	//下面是页面相关
	//描述
	picDesc:null,
	//屏幕 显示图片的容器
	screen:null,
	//导航容器
	nav:null,
	//alt容器
	alt:null,
	defaultAlt:null,
	//播放按钮
	butPlay:null,
	//停止按钮
	butStop:null,
	//暂停按钮
	butPause:null,
	//上一页按钮(数组 会有多个)
	butPrev:null,
	//下一页按钮(数组 会有多个)
	butNext:null,
	//上一页 带连接的 seo相关
	butPrevLink:null,
	//下一页 带连接的 seo相关
	butNextLink:null,
	//上一组按钮
	butPrevGroup:null,
	//下一组按钮
	butNextGroup:null,
	//查看原图按钮
	butExamine:null,
	//速度组
	butSpeedGroup:null,
	//显示全部的容器(数组)
	showTotal:null,
	//显示当前的容器(数组)
	showIndex:null,
	//显示全部组
	showTotalGroup:null,
	//显示当前的组
	showGroup:null,
	//显示图片来源
	showSource:null,
	//显示图片来源的容器 用于隐藏用
	showSourceComposite:null,
	//显示播放状态
	playStatus:null,
	//pv计数器
	pvCounter:null,
	//是否因此和显示播放按钮
	hidePlayBut:null,
	//计时器,
	timmer:null,
	//播放标志
	playFlag:false,
	//暂停部分标志 用于鼠标悬屏幕时候用
	pauseFlag:false,
	//tag
	tag:null,
	//baseUrl
	baseUrl:null,
	curId:null,
	//分页数
	groupSize:null,
	groupNo:null,
	//切换时候外界函数
	turnFun:null,
	//默认时间间隔
	_defaultInterval:5,
	_cookiePrefix:"autoplayer_",
	//构造函数
	initialize:function(args){
		var self = this;
		self._debug("begin to init");
		var coolieInterval = jQuery.cookie(self._cookiePrefix+"interval");
		coolieInterval = ""!=coolieInterval?Number(coolieInterval):null;
		if(null!=coolieInterval){
			self._debug("get interval from cookie");
		}
		self.data = args.data || {};
		self.interval = args.interval || coolieInterval || self._defaultInterval;
		self.index = 0;
		self.navSize = args.navSize || 5;
		self.tag = args.tag || "";
		self.baseUrl = args.baseUrl || "/";
		//分页数
		self.groupSize = args.groupSize || 6;
		self.turnFun = args.turnFun || null;
		self.picDesc = jQuery("#"+args.picDescId);
		self.screen = jQuery("#"+args.screenId);
		//如果定义了过滤器 过滤图片
		if(self._isDefined(args.picFilter)){
			self._filter(args.picFilter);
		}
		//是否定义了导航id
		if(self._isDefined(args.navId)){
			self.nav = jQuery("#"+args.navId);
		}
		//是否定义了组显示
		if(self._isDefined(args.showGroupId)){
			self.showGroup = jQuery("#"+args.showGroupId);
		}
		if(self._isDefined(args.showTotalGroupId)){
			self.showTotalGroup = jQuery("#"+args.showTotalGroupId);
		}
		//是否定义了播放键
		if(self._isDefined(args.butPlayId)){
			self.butPlay = jQuery("#"+args.butPlayId);
		}
		if(self._isDefined(args.butPauseId)){
			self.butPause = jQuery("#"+args.butPauseId);
		}
		//是否定义了停止键
		if(self._isDefined(args.butStopId)){
			self.butStop = jQuery("#"+args.butStopId);
		}
		//是否定义了速度组
		if(self._isDefined(args.butSpeedGroupId)){
			self.butSpeedGroup = jQuery("#"+args.butSpeedGroupId);
		}
		//是否定义了上一页键
		if(self._isDefined(args.butPrevId)){
			self.butPrev = self._getElementsById(args.butPrevId);
		}
		//是否定义了下一页键
		if(self._isDefined(args.butNextId)){
			self.butNext = self._getElementsById(args.butNextId);
		}
		//是否定义了上一页连接
		if(self._isDefined(args.butPrevLinkId)){
			self.butPrevLink = self._getElementsById(args.butPrevLinkId);
		}
		//是否定义了下一页连接
		if(self._isDefined(args.butNextLinkId)){
			self.butNextLink = self._getElementsById(args.butNextLinkId);
		}
		//是否定义了上一组键
		if(self._isDefined(args.butPrevGroupId)){
			self.butPrevGroup = jQuery("#"+args.butPrevGroupId);
		}
		//是否定义了下一组键
		if(self._isDefined(args.butNextGroupId)){
			self.butNextGroup = jQuery("#"+args.butNextGroupId);
		}		
		//是否定义了查看原图键
		if(self._isDefined(args.butExamineId)){
			self.butExamine = jQuery("#"+args.butExamineId);
		}
		//检查是否取定义了显示总数
		if(self._isDefined(args.showTotalId)){
			self.showTotal = self._getElementsById(args.showTotalId);
		}
		//检查是否取定义了当前页总数
		if(self._isDefined(args.showIndexId)){
			self.showIndex = self._getElementsById(args.showIndexId);
		}
		//检查是否取定义了显示图片来源
		if(self._isDefined(args.showSourceId)){
			self.showSource = self._getElementsById(args.showSourceId);
		}
		if(self._isDefined(args.showSourceCompositeId)){
			self.showSourceComposite = self._getElementsById(args.showSourceCompositeId);
		}		
		//显示播放状态的标签
		if(self._isDefined(args.playStatusId)){
			self.playStatus = self._getElementsById(args.playStatusId);
		}
		//显示播放状态的标签
		if(self._isDefined(args.pvCounterId)){
			self.pvCounter = jQuery("#"+args.pvCounterId);
		}
		//是否因此和显示播放按钮
		if(!self._isDefined(args.hidePlayBut)){
			args.hidePlayBut = true;
		}
		self.hidePlayBut = args.hidePlayBut?true:false;
		//alt
		if(self._isDefined(args.altId)){
			self.alt = jQuery("#"+args.altId);
		}
		self.defaultAlt = args.defaultAlt || "";
		//进行事件绑定
		self._eventBinding();
		//进行按键绑定
		self._catchKeyEvent();
		//第一次转向
		var goTo = 0;
		if(self._isDefined(args.curUrl) && args.curUrl != ""){
			self._debug("default url:"+args.curUrl);
			self.go(goTo,true);
		}else{
			if(self._isDefined(args.curId)){
				self._debug("default id:"+args.curId);
				for(var i=0;i<self.data.length;i++){
					if(self.data[i].id == args.curId){
						goTo = i;
						self.curId = self.data[i].id 
						break;
					}
				}
			}
			self.go(goTo);
		}
		//让描述重新定位
		self.picDesc.trigger("load");
		//让图片重新定位
		self.screen.trigger("load");
		//重置播放速度
		if(null!=self.butSpeedGroup){
			self.butSpeedGroup.find("a[@speed="+self.interval+"]").trigger("click");
		}
		self._debug("init success");
	},
	getAbsoluteURL:function(index){
		var self = this;
		var toUrl = location.href;
		if(toUrl.indexOf("#id="+index) == -1){
			var pos=sUrl=toUrl.indexOf("#");
			if (pos==-1) {
				toUrl+="#id="+index;
			} else {
				toUrl=toUrl.substr(0,pos+1)+"id="+index;
			}
			location.href = toUrl;
			self._debug("change location to "+toUrl);
		}
		return toUrl;
	},
	go:function(index,noturn){
		var self = this;
		//修正url
		var toUrl = self.getAbsoluteURL(self.index);
		var noturn = noturn || false;
		self._debug("want to go "+index);
		index = (!self._isDefined(index)) || index<0 ? 0 : index;
		if(index > self.getTotal()-1){
			index = Number(self.getTotal())-1;
		}
		self._debug("going to "+index +" in fact");
		self.index = index;
		var item = self.data[index];
		//如果取不出数据 那么 向前跳转一页
		if(!self._isDefined(item)){
			self._debug("can't get item data of index "+index);
			if(self.index > 0){
				self.go(self.index-1);
			}else{
				return;
			}
		}
		if(!noturn){
			if(self.screen.attr("src") != item.middlePicUrl){
				self.screen.attr("src",item.middlePicUrl);
				self.picDesc.html(item.picDesc);
				//刷新计数器(如果是不是第一页 或者是第一页 但含有需要默认图片)
				if(self.pvCounter!=null && (self.index > 0 || (self.index==0 && null != self.curId))){
					if(typeof(self.turnFun) == "function"){
						self.turnFun.call();
					}
				}
			}
		}
		//修改上一页 下一页连接
		if(null!=self.butPrevLink){
			var prevItem = self.index > 0 ? self.data[self.index-1]:self.data[self.getTotal()-1];
			var prevHerf = self.baseUrl + prevItem.productId + "_bigpicture"+prevItem.id+(self.tag!=""?"_tag"+self.tag:"")+".html";
			//为了seo 尽量避免修改页面元素 所以先检查是否相同 不知道有没有用
			if(self.butPrevLink.attr("href")!=prevHerf){
				self.butPrevLink.attr("href",prevHerf);
				self._debug("change prev link to:"+prevHerf);
			}
		}
		if(null!=self.butNextLink){
			var nextItem = self.index >= (self.getTotal()-1) ? self.data[0] : self.data[self.index+1];
			var nextHerf = self.baseUrl + nextItem.productId + "_bigpicture"+nextItem.id+(self.tag!=""?"_tag"+self.tag:"")+".html";
			if(self.butNextLink.attr("href")!=nextHerf){
				self.butNextLink.attr("href",nextHerf);
				self._debug("change next link to:"+nextHerf);
			}
		}
		//刷新显示数据
		self._showNumberRefresh();
		//修正分页
		var totalGroup = self.getTotalGroup();
		self._debug("total Group "+totalGroup);
		self.groupNo = self._ceil((self.index + 1) / self.groupSize);
		self._debug("now group "+self.groupNo);
		if(self.groupNo > totalGroup){
			self.groupNo = totalGroup;
			self._debug("group error,set group "+self.groupNo);
		}
		//刷新导航
		self._navRefresh(noturn);
		//修改查看原图
		if(null!=self.butExamine && self.butExamine.length>0){
			//不做修改屏幕图片的话 直接连接屏幕
			var bigPicUrl = null;
			if(noturn){
				bigPicUrl = self.screen.attr("src");
			}
			bigPicUrl = bigPicUrl || item.bigPicUrl || item.middlePicUrl;
			self.butExamine.attr("href",bigPicUrl);
		}
		//修改图片来源
		if(null!=self.showSource){
			
			var source = "";
			if("网友上传图片"==item.articleTag){
				source = "网友上传";
			} else if (item.articleTitle!='' && item.articleUrl!=''){
				//文章标题,文章URL
		        source = '<a href="'+item.articleUrl+'" target="_blank">'+item.articleTitle+'</a>';
		    }
			self.showSource.html(source);
			if(null!=self.showSourceComposite){
				if(source==""){
					self.showSourceComposite.hide();
				}else{
					self.showSourceComposite.show();
				}
			}
		}
		//修改alt
		if(null!=self.alt){
			var alt = item.alt || self.defaultAlt;
			self.alt.attr("title",alt);
			self.alt.html(alt);
		}
		//如果已经到低页 并且在自动播放 停止程序
		if(index == self.getTotal()-1){
			if(null != self.timmer){
				self._debug("is the last one and player is running,stop it!");
				self.stop();	
			}
		}
	},
	goInterval:function(){
		var self = this;
		self._debug("going by goInterval");
		if(!self.pauseFlag){
			//如果用户鼠标悬浮在屏幕上 直接进入下一个循环
			self.go(self.index+1);
		}
		window.clearInterval(self.timmer);
		if(self.playFlag){
			self.timmer = window.setInterval(function(){self.goInterval();},self.interval * 1000);
		}
	},
	//播放
	play:function(){
		var self = this;
		self._debug("play");
		if(self.playFlag){
			self._debug("palyer is running,return!");
			return;
		}
		//设置播放标志
		self.playFlag = true;
		if(self.hidePlayBut){
			self._debug("hide the play button");
			if(null!=self.butPlay){
				self.butPlay.hide();
			}
			if(null!=self.playStatus){
				self.playStatus.hide();
			}
			if(null!=self.butStop){
				self.butStop.show();
			}
			if(null!=self.butPause){
				self.butPause.show();
			}
		}
		//显示速度调节
		if(null!=self.butSpeedGroup){
			self.butSpeedGroup.show();
		}
		self.timmer = window.setInterval(function(){self.goInterval();},self.interval * 1000);
	},
	//暂停
	pause:function(){
		var self = this;
		self._debug("pause,just call stop.");
		self.stop();
	},
	//停止
	stop:function(){
		var self = this;
		self._debug("stop");
		//设置停止标志
		self.playFlag=false;
		if(self.hidePlayBut){
			self._debug("show the play button");
			if(null!=self.butPlay){
				self.butPlay.show();
			}
			if(null!=self.playStatus){
				self.playStatus.show();
			}
			if(null!=self.butStop){
				self.butStop.hide();
			}
			if(null!=self.butPause){
				self.butPause.hide();
			}
		}
		//隐藏速度调节
		if(null!=self.butSpeedGroup){
			self.butSpeedGroup.hide();
		}
		window.clearInterval(self.timmer);
		self.timmer = null;
	},
	//设置播放速度
	setSpeed:function(speed){
		var self = this;
		speed = speed || self._defaultInterval;
		self._debug("begin to set speed:"+speed);
		self.interval = Number(speed);
		self._debug("set interval to cookie");
		jQuery.cookie(self._cookiePrefix+"interval",self.interval,{"expires":999999999,"domain":"junction.com","path":"/"});
		if(self.playFlag){
			self._debug("player is running,rePlay!");
			self.stop();
			self.play();
		}
		self._debug("set speed success!");
	},
	//上一张
	prev:function(){
		var self = this;
		if(self.index == 0){
			self.go(Number(self.getTotal())-1);
			return;
		}
		self.go(self.index - 1);
	},
	//下一张
	next:function(){
		var self = this;
		if(self.index == self.getTotal()-1){
			self.go(0);
			return;
		}
		self.go(Number(self.index) + 1);
	},
	//上一组
	prevGroup:function(){
		var self = this;
		if(self.groupNo == 1){
			alert("已经是第一页了");
			return;
		}
		self.go((self.groupNo - 2) * self.groupSize);
	},
	//下一组
	nextGroup:function(){
		var self = this;
		if(self.groupNo == self.getTotalGroup()){
			alert("已经是最后一页了");
			return;
		}
		self.go(self.groupNo * self.groupSize);
	},
	//下面是取得数据相关
	//取得当前下标
	getIndex:function(){
		var self = this;
		return self.index || 0;
	},
	total:null,
	//取得总的照片数
	getTotal:function(){
		var self = this;
		if(self.total == null){
			self.total = self.data.length;
		}
		return self.total;
	},
	totalGroup:null,
	getTotalGroup:function(){
		var self = this;
		if(self.totalGroup == null){
			self.totalGroup = self._ceil(self.getTotal() / self.groupSize);
		}
		return self.totalGroup;
	},
	//判断是否定义某个变量
	_isDefined:function(variable){
		return typeof(variable) != "undefined"
	},
	//绑定事件
	_eventBinding:function(){
		var self = this;
		//self._navRefresh();
		//绑定播放 暂停 停止
		self._bindingButClick(self.butPlay,function(){self.play();},true);
		self._bindingButClick(self.butStop,function(){self.stop();},true);
		self._bindingButClick(self.butPause,function(){self.pause();},true);
		//绑定速度
		if(null!=self.butSpeedGroup){
			self.butSpeedGroup
			.find("a")
			.click(function(){
				self.butSpeedGroup.find("a").removeClass("org")
				self.setSpeed(Number(jQuery(this).attr("speed")));
				jQuery(this).addClass("org");
			});
		}
		//绑定上一页 下一页
		self._bindingButClick(self.butPrev,function(){self.prev();},true);
		self._bindingButClick(self.butNext,function(){self.next();},true);
		//绑定上一组 下一组
		self._bindingButClick(self.butPrevGroup,function(){self.prevGroup();},true);
		self._bindingButClick(self.butNextGroup,function(){self.nextGroup();},true);
		//绑定原图
		//查看原图按钮在悬浮鼠标的时候 停止播放
		if(null!=self.butExamine){
			self.butExamine.hover(function(){
				if(self.playFlag){
					//悬浮的时候 暂停
					self.pauseFlag = true;
				}
			},function(){
				if(self.playFlag){
					self.pauseFlag = false;
				}
			});
		}
		//绑定屏幕事件
		var nowDirection = null;
		self.screen.hover(function(){
			if(self.playFlag){
				//悬浮的时候 暂停
				self.pauseFlag = true;
			}
		},function(){
			if(self.playFlag){
				self.pauseFlag = false;
			}
			jQuery(this).css('cursor','auto')
			.attr('title','')
			.attr('alt','');
		}).mousemove(function(event){
			event = event || window.event;
			var direction = (event.pageX - jQuery(this).offset().left)/jQuery(this).width()>0.5;
			if(nowDirection != direction){
				if (direction){
					jQuery(this).css('cursor','url(images/pointR.cur),auto')
					.attr('title','点击跳到下一张>>')
					.attr('alt','点击跳到下一张>>');
				}else{
					jQuery(this).css('cursor','url(images/pointL.cur),auto')
					.attr('title','<<点击跳到上一张')
					.attr('alt','<<点击跳到上一张');
				}
				self._debug("change direction to "+(direction?"next":"prev"));
				nowDirection = direction;
			}
		}).mouseout(function(){
			nowDirection = null;
			self._debug("clear direction");
		}).click(function(event){
			var direction = (event.pageX - jQuery(this).offset().left)/jQuery(this).width()>0.5;
			if(direction){
				self.next();
			}else{
				self.prev();
			}
		}).load(function(){
		});
	},
	//创建导航栏
	_navRefresh:function(nocheck){
		var self = this;
		if(null == self.nav){
			return;	
		}
		var nocheck = nocheck || false;
		var html = "";
		var begin = (self.groupNo - 1) * self.groupSize;
		var end = self.groupNo * self.groupSize;
		if(end > self.getTotal()-1){
			end = self.getTotal();
		}
		self.nav.find("li").removeClass("this");
		var selectItem = self.nav.find("li[idx="+self.index+"]");
		if(selectItem.length == 0){
			self._debug("not found item! turn groupNo (refresh nav)");
			var item = null;
			var toUrl = null;
			for(var i=begin;i<end;i++){
				toUrl = self.getAbsoluteURL(i);
				item = self.data[i];
				html += nocheck?"<li idx="+i+">":"<li"+(i == self.index?" class=\"this\"":"")+" idx="+i+">";
				html += "	<a class=\"iPic\" href=\""+toUrl+"\" idx="+i+" target=\"_self\"><img src=\""+item.thumbPicUrl+"\""+(self._isDefined(item.alt)&& ""!=item.alt?"alt=\""+item.alt+"\"":"")+" /></a>";
				html += "</li>";
			}
			self.nav.html(html);
			//绑定事件
			self.nav.find("a").click(function(){
				self.go(Number(jQuery(this).attr("idx")));
			});
			//处理页数显示
			if(self.showGroup != null){
				self.showGroup.html(self.groupNo);
			}
			if(self.showTotalGroup != null){
				self.showTotalGroup.html(self.getTotalGroup());
			}
		} else {
			selectItem.addClass("this");
			self._debug("found item and select it");
		}
	},
	//刷新显示数据
	_showNumberRefresh:function(){
		var self = this;
		if(null != self.showTotal){
			self.showTotal.html(self.getTotal());
		}
		if(null != self.showIndex){
			self.showIndex.html(self.index+1);
		}
	},
	_bindingButClick:function(but,func,unbind){
		var self = this;
		if(null!=but && but.length > 0){
			if(true == unbind){
				but.unbind("click");
			}
			but.click(function(){
				func.call();
			});
		}
	},
	//拦截键盘事件
	_catchKeyEvent:function(){
		var self = this;
		jQuery(document).keydown(function(event){
			event = event || window.event;
			var url = null;
			switch(event.keyCode){
				case 33:
					var prevItem = self.index > 0 ? self.data[self.index-1]:self.data[self.data.length-1];
					url = self.baseUrl + prevItem.productId + "_bigpicture"+prevItem.id+(self.tag!=""?"tag_"+self.tag:"")+".html";
	
					break;
				case 37:
					self.prev();
					break;
				case 34:
					var nextItem = self.index < self.data.length-1 ? self.data[self.index+1]:self.data[0];
					url = self.baseUrl + nextItem.productId + "_bigpicture"+nextItem.id+(self.tag!=""?"tag_"+self.tag:"")+".html";
					break
				case 39:
					self.next();
					break;
			}
			if(url!=null){
				location.href=url;
			}
		});
	},
	_getElementsById:function(ids){
		if(ids.indexOf(",")!=-1){
			ids = ids.replace(",",",#");
		}
		return jQuery("#"+ids);
	},
	//图片过滤器(tag:标准外观图|articleTag:行情图片)
	//把行情图片和标准外观图过滤出来
	_filter:function(picFilter){
		var self = this;
		self._debug("being to filter");
		if(!self._isDefined(picFilter) || null == picFilter || "" == picFilter){
			self._debug("filter is empty,return");
			return;
		}
		self._debug("filter by " + picFilter);
		var tempFilter = picFilter.split("|");
		var data = new Array();
		var item = null;
		Outer: for(var i = 0;i<self.data.length;i++){
			item = self.data[i];
			for(var j=0;j<tempFilter.length;j++){
				var kay_val = tempFilter[j].split(":");
				if(eval("!self._isDefined(item."+kay_val[0]+") || item."+kay_val[0]+".indexOf('"+kay_val[1]+"')==-1")){
					continue Outer;
				}
			}
			data.push(item);
		}
		self._debug("filter success,"+self.data.length+" to "+data.length);
		self.data = data;
	},
	//输出控台
	console:null,
	consoleId:"autoPlayerConsole",
	isDebug:false,
	_debug:function(str){
		var self = this;
		if(!self.isDebug){
			return;
		}
		if(null == self.console){
			if(jQuery("#"+self.consoleId).length <= 0){
				jQuery("html").append("<div id='"+self.consoleId+"'></div>");
			}
			self.console = jQuery("#"+self.consoleId);
		}
		var d = new Date();
		self.console.append("["+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds()+"."+d.getMilliseconds()+"]:"+str+"<br />");
	},
	_ceil:function(mun){
		if(parseInt(mun) == mun){
			return mun;
		}else{
			return parseInt(mun) + 1;
		}
	},
	//析构函数
	_destory:function(){}
}