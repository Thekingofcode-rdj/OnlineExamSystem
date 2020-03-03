<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>777考试系统-首页</title>
    
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/easyui/demo.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/easyui/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/easyui/locale/easyui-lang-zh_CN.js"></script>
	
<script type="text/javascript">
	
	function openTab(title,url,icon){
		var studentName="${sessionScope.studentName}";
		if (studentName=="") {
			window.location.href="${pageContext.request.contextPath }/logout1";
			return;
		}
		if ($("#tabs").tabs("exists",title)) {
			$("#tabs").tabs("select",title);
		}else{
			var content="<iframe frameborder='0' scolling='auto' width='100%' height='100%' src='${pageContext.request.contextPath}/jsp/"+url+"'></iframe>";
			$("#tabs").tabs("add",{
				title:title,
				iconCls:icon,
				closable:true,
				content:content
			})
		}
	}
</script>
</head>
<body class="easyui-layout">
<div data-options="region:'east',split:true" title="日历" style="width:180px;">
            <div class="easyui-tree" data-options="url:'tree_data1.json',method:'get',animate:true,dnd:true">
            	<div class="easyui-calendar" style="width:250px;height:250px;"></div>
            </div>
</div>
<div data-options="region:'west',title:'后台导航栏',split:true" style="width:200px">
		<div class="easyui-accordion" data-options="fit:true">
			<div title="考试" style="padding: 10px" data-options="iconCls:'icon-group'" align="center">
				<a href="javascript:openTab('在线考试','exam.jsp','icon-man')" class="easyui-linkbutton" data-options="iconCls:'icon-group',plain:true" style="width:150px">考试</a>
			</div>
			<div title="成绩查询" style="padding:10px" data-options="iconCls:'icon-ask'" align="center">
				<a href="javascript:openTab('成绩查询','examResultAll.jsp','icon-man')" class="easyui-linkbutton" data-options="iconCls:'icon-ask',plain:true" style="width:150px">成绩查询</a>
			</div>
			<div title="修改资料" style="padding: 10px" data-options="iconCls:'icon-ask'" align="center">
				<a href="javascript:openTab('修改资料','toedit.jsp','icon-man')" class="easyui-linkbutton" data-options="iconCls:'icon-ask',plain:true" style="width:150px">修改资料</a>
			</div>
			<div title="系统管理" style="padding: 10px" align="center">
				<a href="${pageContext.request.contextPath }/logout1" class="easyui-linkbutton" data-options="iconCls:'icon-signout',plain:true" style="width:150px">退出</a>
			</div>
		</div>
	</div>
	
	<div data-options="region:'center'" style="padding:1px;background:#eee;width: 100px; height: 100px;">
		<div id="tabs" class="easyui-tabs" data-options="fit:true,border:false">
			<div title="首页">
			</div>
		</div>
	</div>
</body>

 </body>
</html>