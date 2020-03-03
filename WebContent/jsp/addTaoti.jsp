<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	function reback(){
		window.history.go(-1);
	}
</script>
</head>
<body>
<form id="fm" method="post" action="${pageContext.request.contextPath }/managerAddTaoti1"> 
		<table cellpadding="15px">
			<tr>
				<td>套题名称</td>
				<td><input id="name" class="easyui-validatebox" name="name" data-options="required:true,panelHeight:'auto'"></td>
			</tr>
			<tr>
				<td>所属课程</td>
				<td><input id="cc" name="lessonid" class="easyui-combobox"
					data-options="panelHeight:'auto',editable:false,valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/managerGetLessons1'"></td>
			</tr>
			<tr>
				<td><input id="id" name="id" type="hidden"></td>
				<td><input id="addorupdate" type="hidden" value=""></td>
			</tr>
		</table>
		 <button type="submit" class="btn btn-success btn-block loginButn">提交</button>
	</form>
	<input type="button" name="button" id="button" value="返回" onclick="reback()">
</body>
</html>