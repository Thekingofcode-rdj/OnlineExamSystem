<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	$(function(){
		$("#dg").datagrid({
			url:'${pageContext.request.contextPath}/managerGetQuestionsList1',
			pagination:true,
			fit:true,
			fitColumns:true,
			toolbar:'#tb',
			rownumbers:true,
			columns:[[
				{
					field:'cb',
					align:'center',
					checkbox:true,
				},
				{
					field:'id',
					title:'编号',
					width:200,
					align:'center',
				},	
				{
					field:'lessonName',
					title:'所属课程',
					width:100,
					align:'center',
				},
				{
					field:'taotiName',
					title:'套题名称',
					width:150,
					align:'center',
				},
				{
					field:'subject',
					title:'考试题目',
					width:400,
					align:'center',
				},
				{
					field:'type',
					title:'试题类型',
					width:100,
					align:'center',
				},
				{
					field:'createtime',
					title:'创建时间',
					width:150,
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
				}
			]]
		})
	})
	
	function openUpdateDialog(){
		var selectedRow = $("#dg").datagrid("getSelected");
		if (selectedRow==null) {
			$.messager.alert("系统提示","请选择要修改的数据！");
			return;
		}
		window.location.href = "updateQuestions.jsp";
		$("#fm").form("load",selectedRow);
		$("#name").attr("readonly",true);
		$("#dlg").dialog("open").dialog("setTitle","修改考试题目");
	}
	
	function deleteQuestions(){
		var selections=$("#dg").datagrid("getSelections");
		if (selections.length==0) {
			$.messager.alert("系统提示","请选择要删除的数据！");
			return;
		}
		var ids=[];
		for (var i = 0; i < selections.length; i++) {
			ids.push(selections[i].id);
		}
		var idsStr = ids.join();
		$.messager.confirm("系统提示","确定要删除这"+selections.length+"条数据吗？",function(r){
			if (r) {
				$.ajax({
					url:'${pageContext.request.contextPath }/managerDeleteQuestion1',
					data:idsStr,
					type:'post',
					contentType:'application/json;charset=utf-8',
					success:function(result){
						if (result=="success") {
							$.messager.alert("系统提示","删除成功！");
							$("#dg").datagrid("reload");
						}else{
							$.messager.alert("系统提示","删除失败，请联系系统管理员！");
						}
					}
				})
			}
		})
	}
</script>
</head>
<body style="margin: 1px">
<table id="dg"></table>
<div id="tb">
	&nbsp;<a href="addQuestions.jsp" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加考试题目</a>
	&nbsp;<a href="javascript:openUpdateDialog()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改考试题目</a>
	&nbsp;<a href="javascript:deleteQuestions()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除考试题目</a>
</div>
</body>
</html>