function addRegion(id, maxLen){
	var region=null;
	var regionText="";
	var area=$("#area");
	var city=$("#city");
	var province=$("#province");
	if(area.attr("value")!=0){
		region=area.attr("value");
		regionText=province.find("option:selected").text()+" "+city.find("option:selected").text()+" "+area.find("option:selected").text();
	}else if(city.attr("value")!=0){
		region=city.attr("value");
		regionText=province.find("option:selected").text()+" "+city.find("option:selected").text();
	}else if(province.attr("value")!=0){
		region=province.attr("value");
		regionText=province.find("option:selected").text();
	}
	if(region!=null){
		var fillElements=$("#"+id);
		var len=fillElements.attr("length");
		if(len>=maxLen){
			$.alertInfo("您最多只能选择"+maxLen+"个地区!");
			return false;
		}
		if(fillElements.find("option[value='4476']").val()){
			if(region!=4476){
				$.alertInfo("您已经选择全国了,不能选择其它地区!");
				return false;
			}
		}else{
			if(region==4476){
				if(len>0){
					$.confirmInfo("您已经选择了其它地区,不能再选择全国了!<br \/>您确定要选择全国吗?<br \/><font color=\"red\">注:点击“确定”按钮将删除已选其它地区!<\/font>", {onOk: function(){
							fillElements.empty().append("<option value='"+region+"'>"+regionText+"<\/option>");
						}
					});
				}else{
					fillElements.append("<option value='"+region+"'>"+regionText+"<\/option>");
				}
			}else{
				if(!fillElements.find("option[value='"+region + "']").val()){
					fillElements.append("<option value='"+region+"'>"+regionText+"<\/option>");
				}
			}
		}
		fillElements.blur();
	}
}
function deleteRegion(id) {
	var fillElements=$("#"+id);
	var selected=fillElements.find("option:selected");
	if(selected.val()){
		selected.remove();
	}else{
		$.alertInfo("请至少选择一个地区删除");
	}
	fillElements.blur();
}
function selectedRegion(id) {
	$("#"+id).children().each(function(){$(this).attr("selected","selected")});
}