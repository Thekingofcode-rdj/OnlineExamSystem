<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线考试系统-登录</title>

<link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/font-awesome.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/animate.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/style.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/register.css" />

<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>

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
	var message="${requestScope.msg}";
	if (message !=null && message != "") {
		$.messager.alert("系统提示",message);
	}
})

</script>

<style>
    	#myModal .modal-content{
			width: 360px;
			margin-top: 120px;
			margin-left: 160px;
			color:#FFFFFF;
			background: #FFFFFF;
			border-top: 4px #1a7bb9 solid;
			border-bottom: 2px #1a7bb9 solid;
			border-left: 3px #1a7bb9 solid;
			border-right: 1px #1a7bb9 solid;
			box-shadow: 4px 4px 12px #C0C0C0;
			border-radius:8px;
		}
		
		#myModal .modal-content .modal-header{
			background:#1a7bb9;
			color: #000000;
			font-family: "微软雅黑";
			font-size: 16px;
			font-weight: bold;
			text-align: center;
			border-radius:4px;
			
		}
		
		#myModal .modal-content .modal-body{
			color: #000000;
			font-family: "微软雅黑";
			font-weight: bold;
			text-align: center;
			line-height:32px;
		}
		
		#myModal .modal-content .modal-header .glyphicon{
			color: red;
		}
		    	
    </style>
</head>
<body class="gray-bg" style="background-image:url('${pageContext.request.contextPath}/image/bg.jpg'); background-size:cover">
	
	<div style="text-align:center;margin-top:12%">
		<font face="仿宋" size="10" color="red">考 生 登 录</font>
	</div>
	<div class="middle-box text-center loginscreen  animated fadeInDown">
        <div>
            <div>

                <h1 class="logo-name">CQIE</h1>

            </div>
            <form class="m-t" role="form" method="post" id="Login" action="${pageContext.request.contextPath }/login2" >
                <div class="form-group">
                    <input type="text" class="form-control uname" name="name" placeholder="用户名" >
                </div>
                <div class="form-group">
                    <input type="password" class="form-control pword m-b" name="password" placeholder="密码">
                </div>
                <button type="submit" class="btn btn-success btn-block loginButn">登 录</button>


                <p class="text-center" ><small style="color: #fffff;">没有账号？</small><a href="signIn.jsp">注册一个新账号</a>
                </p>
				
            </form>
        </div>
    </div>
</body>
</html>