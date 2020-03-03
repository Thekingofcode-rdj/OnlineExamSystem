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
<form id="fm" method="post" action="${pageContext.request.contextPath }/managerAddQuestion1"> 
		<table cellpadding="10px">
			<tr>
				<td>所属套题</td>
				<td><input id="cc2" class="easyui-combobox" name="taotiid"
					data-options="textField:'name',valueField:'id',panelHeight:'auto',url:'${pageContext.request.contextPath }/managerGetTaotis1'"></td>
				<td>
					<input type="hidden" id="id" name="id">
				</td>
				<td>
					<input type="hidden" id="addorupdate" value="">
				</td>
			</tr>
			<tr>
				<td>考试题目</td>
				<td><textarea id="subject" name="subject" cols="20" rows="4"></textarea></td>
				<td>试题类型</td>
				<td>
					<select id="type" name="type" class="easyui-combobox" data-options="panelHeight:'auto'">
						<option value="单选">单选</option>
						<option value="多选">多选</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>选项A</td>
				<td><input id="optiona" class="easyui-validatebox" data-options="required:true" name="optiona"></td>
				<td>选项B</td>
				<td><input id="optionb" class="easyui-validatebox" data-options="required:true" name="optionb"></td>
			</tr>
			<tr>
				<td>选项C</td>
				<td><input id="optionc" class="easyui-validatebox" data-options="required:true" name="optionc"></td>
				<td>选项D</td>
				<td><input id="optiond" class="easyui-validatebox" data-options="required:true" name="optiond"></td>
			</tr>
			<tr>
				<td>正确答案</td>
				<td>
					A<input type="checkbox" name="answer" checked="checked" value="A">&nbsp;&nbsp;&nbsp;&nbsp;
					B<input type="checkbox" name="answer" value="B">&nbsp;&nbsp;&nbsp;&nbsp;
					C<input type="checkbox" name="answer" value="C">&nbsp;&nbsp;&nbsp;&nbsp;
					D<input type="checkbox" name="answer" value="D">
				</td>
				<td>备注</td>
				<td><input id="remark" type="text" name="note"></td>
			</tr>
		</table>
		<button type="submit" class="btn btn-success btn-block loginButn">提交</button>
	</form>
	<input type="button" name="button" id="button" value="返回" onclick="reback()">
</body>
</html>