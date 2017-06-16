<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
	$(function (){
		//获取一级分类静态数据
		$.getJSON("js/json/class_1.js",function(data){
			//将json静态数据传输到一级分类的下拉列表中
			$(data).each(function(i,json){
				$("#spu_class_1_select").append("<option value="+json.id+">"+json.flmch1+"</option>");
			});
			
		});
		
	});
	
	function spu_select_class_2_by_class_1(class_1_id){
		//获取一级分类id
		//$("#spu_select_class_1 option:selected").value();
		//alert(class_1_id);
		//获取二级分类静态数据
		$.getJSON("js/json/class_2_"+class_1_id+".js",function(data){
			//将json静态数据传输到二级分类的下拉列表中
			$("#spu_class_2_select").empty();
			$(data).each(function(i,json){
				$("#spu_class_2_select").append("<option value="+json.id+">"+json.flmch2+"</option>");
			});
			
		});
		//加载下拉菜单品牌列表
		spu_select_tm_by_class_1(class_1_id);
	}
	
	function spu_select_tm_by_class_1(class_1_id){
		//获取一级分类id
		//$("#spu_select_class_1 option:selected").value();
		//alert(class_1_id);
		//获取二级分类静态数据
		$.getJSON("js/json/tm_class_1_"+class_1_id+".js",function(data){
			//将json静态数据传输到二级分类的下拉列表中
			$("#spu_tm_select").empty();
			$(data).each(function(i,json){
				$("#spu_tm_select").append("<option value="+json.id+">"+json.ppmch+"</option>");
			});
			
		});
		
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品信息发布</title>
</head>
<body>
	商品信息发布<br>
	<form action="spu_publish.do" enctype="multipart/form-data" method="post">
		一级分类：<select name="flbh1" id="spu_class_1_select" onchange="spu_select_class_2_by_class_1(this.value)"></select><br>
		二级分类：<select name="flbh2" id="spu_class_2_select"></select><br>
		商标分类：<select name="pp_id" id="spu_tm_select"></select><br>
		<hr>
		商品spu名称：<input type="text" name="shp_mch"/><br>
		商品spu描述：<input type="text" name="shp_msh"/><br>
		商品图片组：<br>
		<dir>
			<img id="index_image_0" width="100px" onclick="index_image_click(0)" src="image/111.jpg" style="cursor: pointer;" />
			<input style="display:none;" id="index_file_0" type="file" name="files" onChange="index_image_change(0)" /><br>
		</dir>
		<input type="submit" value="发布spu信息"/>
	</form>
</body>
</html>