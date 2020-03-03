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
<form id="fm" method="post" action="${pageContext.request.contextPath }/managerAdd1"> 
		<table cellpadding="10px">
			<tr>
				<td colspan="2"><input id="id" name="id" type="hidden"></td>
			</tr>
			<tr>
				<td>帐号</td>
				<td><input id="name" class="easyui-validatebox" name="name" data-options="required:true"></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input id="password" class="easyui-validatebox" name="password" data-options="required:true"></td>
			</tr>
			<tr>
				<td>权限</td>
				<td>
					<select id="authority" class="easyui-combobox" name="authority" data-options="editable:false,panelHeight:'auto'">
						<option value="simple" selected="selected">simple</option>
						<option value="super">super</option>
					</select>
				</td>
			</tr>
		</table>
		<button type="submit" class="btn btn-success btn-block loginButn">提交</button>
	</form>
	<input type="button" name="button" id="button" value="返回" onclick="reback()">
</body>
</html>