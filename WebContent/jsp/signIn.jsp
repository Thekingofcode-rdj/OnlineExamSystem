<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线考试系统-注册</title>

 	<link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/style.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/register.css" />
    <script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.cookie.js"></script>
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
    
    <script type="text/javascript">
	$(function(){
		$("input:first").change(function(){
			var name=$(this).val();
			if(name==""){
				return;
			}
			$.ajax({
				url:'${pageContext.request.contextPath}/checkSignIn',
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
					alert(thisText+"不能为空！");
					flag=false;
					return false;
				}
			})
			if(flag){
				var password1=$("#password1").val();
				var password2=$("#password2").val();
				var spanText = $("#sp").text();
				if(spanText != ""){
					alert("帐号已被注册！");
					return false;
				}
				if(password1=="" || password2==""){
					alert("请输入密码！");
					return false;
				}
				if(password1 != password2){
					alert("两次密码输入不一致！");
					return false;
				}
				return true;
			}
		})
	})
</script>
</head>
<body class="gray-bg" style="background-image:url('${pageContext.request.contextPath}/image/register.jpg'); background-size:cover">
<div class="middle-box text-center loginscreen   animated fadeInDown">
<div style="text-align:center;margin-top:12%">
		<font face="仿宋" size="10" color="red">考 生 注 册</font>
	</div>
        <div>
            <div>
                <h1 class="logo-name">CQIE</h1>
            </div>
            <h4 class="no-margins">注册一个考生账户</h4>
            <form class="m-t" role="form" method="post" id="Register" action="${pageContext.request.contextPath }/signIn1">
                <div class="form-group">
                    <input type="text" class="form-control uname" name="name" placeholder="请输入用户名" required="">
                    <font id="sp" color="red"></font>
                    <!-- <p class="popover-options pull-right" style="margin-top: -49px;height:0px; overflow: hidden;">
						<a id="aclick" href="#" type="button" class="btn btn-warning"
						   data-container="body" data-toggle="popover" data-content="
							 <h4 style='color:red;'>用户名已存在，请使用其他用户名</h4>">
						</a>
					</p>
					 -->
                </div>
                <div class="form-group">
                    <input type="password" id="password1" class="form-control pword m-b password" name="password" placeholder="请输入密码" required="">
                </div>
                <div class="form-group">
                    <input type="password" id="password2" class="form-control pword m-b confirmPass" placeholder="请再次输入密码" required="">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control uname" name="profesion" placeholder="请输入职业" required="">
                </div>
                <div class="form-group">请选择性别
                    <select name="sex" class="form-control uname" >
						<option value="男">男</option>
						<option value="女">女</option>
					</select>
                </div>
                <div class="form-group text-left">
                    <div class="checkbox i-checks">
                        <label class="no-padding">
                            <input type="checkbox"><i></i> 我同意注册协议</label>
                    </div>
                </div>
                <input id="subm" type="submit" class="btn btn-success btn-block registerButn floating-btn" value="注 册"/>

                <p class="text-center"><small>已经有账户了？</small><a href="login.jsp">点此登录</a>
                </p>

            </form>
        </div>
    </div>
</body>
</html>