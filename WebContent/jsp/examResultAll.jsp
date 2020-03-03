<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线考试系统-考试成绩</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/easyui/themes/icon.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/easyui/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/easyui/locale/easyui-lang-zh_CN.js"></script>
	
<script type="text/javascript">
$(function(){
	$("#tt").datagrid({
		url:'${pageContext.request.contextPath}/queryResult1',
		singleSelect:true,
		pagination:true,
		fit:true,
		fitColumns:true,
		toolbar:'#tb',
		columns:[[
			{
				field:'id',
				title:'编号',
				width:100,
				align:'center',
			},
			{
				field:'examnumber',
				title:'准考证号',
				width:200,
				align:'center',
			},
			{
				field:'lessonname',
				title:'考试课程',
				width:100,
				align:'center',
			},
			{
				field:'resingle',
				title:'单选题得分',
				width:100,
				align:'center',
			},
			{
				field:'resmore',
				title:'多选题得分',
				width:100,
				align:'center',
			},
			{
				field:'restotal',
				title:'总分',
				width:100,
				align:'center',
			},
			{
				field:'createtime',
				title:'考试时间',
				width:200,
				align:'center',
				formatter:function(value){
					var date=new Date(value);
					var y=date.getFullYear();
					var m=date.getMonth()+1;
					var d=date.getDate();
					var h=date.getHours();
					var min=date.getMinutes();
					var s=date.getSeconds();
					return y+"-"+m+"-"+d+"&nbsp;&nbsp;&nbsp;&nbsp;"+h+":"+min+":"+s;
				}
			},
		]]
	})
})
</script>
</head>
<body>
<table id="tt"></table>
</body>
</html>