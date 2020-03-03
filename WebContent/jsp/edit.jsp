<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线考试系统-修改资料</title>
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
		var studentId=$("#studentId").val();
		$("#ff").form('load','${pageContext.request.contextPath}/getEditInfo1?id='+studentId);
		$("#name").change(function(){
			var name=$(this).val();
			$.ajax({
				url:'${pageContext.request.contextPath}/checkSignIn1',
				data:'name='+name,
				type:'post',
				success:function(data){
					if(data==false){
						$("#sp").text("帐号已被注册！");
					}else{
						$("#sp").text("");
					}
				}
			})
		})
		$("#subm").click(function(){
			var flag=true;
			$(":text").each(function(){
				var thisVal = $(this).val();
				var thisText=$(this).parent().prev().text();
				if(thisVal==""){
					$.messager.alert(thisText+"不能为空！");
					flag=false;
					return false;
				}
			})
			if(flag){
				var password1=$("#password").val();
				var spanText = $("#sp").text();
				if(spanText != ""){
					$.messager.alert("帐号已被注册！");
					return false;
				}
				if(password1==""){
					$.messager.alert("请输入密码！");
					return false;
				}
				return true;
			}
			return false;
		})
	})
</script>
</head>
<body>
<div style="margin-top:2%;margin-left:2%">
	<font color="black">当前位置 ： 修改资料</font>
</div>
<center style="margin-top:2%">
	<form id="ff" action="${pageContext.request.contextPath }/edit1" method="post">
	<input type="hidden" name="id" id="studentId" value="${studentId }">
		<table cellpadding="5px">
			<tr>
				<td>帐号</td>
				<td><input id="name" type="text" name="name"><font id="sp" color="red"></font></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input id="password" type="text" name="password"></td>
			</tr>
			<tr>
				<td>专业</td>
				<td><input type="text" name="profesion"></td>
			</tr>
			<tr>
				<td>性别</td>
				<td>
					<select name="sex">
						<option value="男">男</option>
						<option value="女">女</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><input id="subm" type="submit" value="修改"></td>
				<td align="right"><input type="reset" value="重置"></td>
			</tr>
		</table>
	</form>
</center>
</body>
</html>