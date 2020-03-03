/**
 * Created by IanSalvatore on 2016/11/9 0009.
 */
$(function () {
    //引入Jquery.Cookie插件
    if ($.cookie("User") != "null") {
        $(".SignOut").css("display", "block")
        $(".userstate").empty();
        $(".userstate").append("<a href='order.html' class='animated fadeInRight'><img src='img/avatar.jpg' class='animated rotateIn img-circle' width='30' style='position: relative;top: 9px;left: -20px;'/>账户管理</a>")
        //LoadShopCar()
    }
    else {
        $("#btnPayfor").text("亲，请登录").attr("href", "login.html");
        $(".SignOut").css("display", "none")
        $(".userstate").empty();
        $(".userstate").append("<a href='login.html' class='hrefLogin'>登录</a>");
        $(".userstate").append("<a href='login.html?iLogin=false'>注册</a>");
    }

    //安全退出
    $("#SignOut").click(function () {
        $.cookie("User", null, { path: '/' });
        window.location.reload();
    })

    var ajaxFormSubmit = function () {
        var $form = $(this);
        var typeId = $(this).attr("id");
        var options = {
            url: "../ActionServletFactory",
            type: $form.attr("method"),
            data: $form.serialize() + "&Ajax=" + typeId,
            dataType: "Json"
        };

        $.ajax(options).done(function (obj) {
        	  //console.log(obj)
            //登录
            if (obj.JsonType == "Login") {
            	
                //登录标识
                if (Boolean(obj.IsSuccess)) {
                    var account = $("#LoginAccount").val()
                    $.cookie("User", account, { path: '/' })
                    //$.cookie('User', obj.Account, { expires: 7 });
                    //登录成功跳转地址
                    window.location.href = obj.Result;
                }
            
                $(".validate-Auth-Login").text("用户名或密码无效");
                $(".validate-Login").addClass("fadeInDown")
            }
            //注册
            else if (obj.JsonType == "Register") {
                if (Boolean(obj.IsSuccess)) {
                    var account = $("#RegAccount").val()
                    $.cookie("User", account)
                    //注册成功跳转地址
                    window.location.href = obj.Result;
                    return;
                }
                $(".validate-Auth-Reg").text("用户名已存在，请使用其他用户名");
                $(".validate-Reg").addClass("fadeInDown")
            }

        })
        return false;
    }
    $("form[data-form-ajax='true']").submit(ajaxFormSubmit);


});