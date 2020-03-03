<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线考试系统-选择课程</title>
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
		var spanText = $("#sp").text();
		if(spanText==""){
			$("#ft").hide();
		}
		$("#examlesson").combobox({
			url:'${pageContext.request.contextPath}/getLessonList1',
			valueField:'id',
			textField:'name',
			editable:false,
			panelHeight:'auto'
		})
		$("#subm").click(function(){
			if($("#examlesson").val()==""){
				$.messager.alert("系统提示","请选择考试科目！");
				return false;
			}
			return true;
		})
	})
</script>
</head>
<body>
<div style="margin-top:2%;margin-left:2%">
	<font color="black">当前位置 ： 在线考试 >> 选择考试课程</font>
</div>
<br>
<br>
<center style="margin-top:2%">
	<form action="${pageContext.request.contextPath }/toExamPage1" method="post">
		<table cellpadding="15px">
			<tr>
				<td>请选择考试课程</td>
				<td><input id="examlesson" name="lessonid"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input id="subm" type="submit" value="确定"></td>
			</tr>
		</table>
	</form>
		<br>
		<br>
		<br>
		<br>
</center>
</body>
</html>