<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html lang="en">
<head>
	<meta charset="utf-8"/>
	<title>${fns:getConfig('productName')}</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1" name="viewport"/>
	<meta content="Preview page of Metronic Admin Theme #1 for " name="description"/>
	<meta content="" name="author"/>
	<!-- BEGIN GLOBAL MANDATORY STYLES -->
	<link href="https://lug.ustc.edu.cn/wiki/lug/services/googlefonts" rel="stylesheet"
		  type="text/css"/>
	<link href="${ctxStatic}/newTheme/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet"
		  type="text/css"/>
	<link href="${ctxStatic}/newTheme/assets/global/plugins/simple-line-icons/simple-line-icons.min.css"
		  rel="stylesheet" type="text/css"/>
	<link href="${ctxStatic}/newTheme/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet"
		  type="text/css"/>
	<link href="${ctxStatic}/newTheme/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css"
		  rel="stylesheet" type="text/css"/>
	<!-- END GLOBAL MANDATORY STYLES -->
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<link href="${ctxStatic}/newTheme/assets/global/plugins/select2/css/select2.min.css" rel="stylesheet"
		  type="text/css"/>
	<link href="${ctxStatic}/newTheme/assets/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet"
		  type="text/css"/>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN THEME GLOBAL STYLES -->
	<link href="${ctxStatic}/newTheme/assets/global/css/components.min.css" rel="stylesheet" id="style_components"
		  type="text/css"/>
	<link href="${ctxStatic}/newTheme/assets/global/css/plugins.min.css" rel="stylesheet" type="text/css"/>
	<!-- END THEME GLOBAL STYLES -->
	<!-- BEGIN PAGE LEVEL STYLES -->
	<link href="${ctxStatic}/newTheme/assets/pages/css/login-5.min.css" rel="stylesheet" type="text/css"/>
	<!-- END PAGE LEVEL STYLES -->
	<!-- BEGIN THEME LAYOUT STYLES -->
	<!-- END THEME LAYOUT STYLES -->
    <link rel="shortcut icon" href="favicon.ico"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#loginForm").validate({
				rules: {
					validateCode: {remote: "${pageContext.request.contextPath}/servlet/validateCodeServlet"}
				},
				messages: {
					username: {required: "请填写用户名."},password: {required: "请填写密码."},
					validateCode: {remote: "验证码不正确.", required: "请填写验证码."}
				},
				errorLabelContainer: "#messageBox",
				errorPlacement: function(error, element) {
					error.appendTo($("#loginError").parent());
				} 
			});
		});
		// 如果在框架或在对话框中，则弹出提示并跳转到首页
		if(self.frameElement && self.frameElement.tagName == "IFRAME" || $('#left').length > 0 || $('.jbox').length > 0){
			alert('未登录或登录超时。请重新登录，谢谢！');
			top.location = "${ctx}";
		}
            $(window).resize(function () {
                $('body').height($(window).height());
                var top = $('body').height() / 2 - $('.form-signin').height() / 2 - 39;
                var left = $('body').width() / 2 - $('.form-signin').width() / 2 - 14;
                $('.form-signin').css({'top': top, 'left': left});
                $('.footer').css({'top': top + 250, 'left': left + 30});
            });
	</script>
</head>
<body class="login">
<!--BEGIN : LOGIN PAGE 5-1 -->
<div class="user-login-5">
	<div class="row bs-reset">
		<div class="col-md-6 bs-reset mt-login-5-bsfix">
			<div class="login-bg" style="background-image:url(${ctxStatic}/newTheme/assets/pages/img/login/bg1.jpg)">
				<img class="login-logo" src=" "/></div>
		</div>
		<div class="col-md-6 login-container bs-reset mt-login-5-bsfix">
			<div class="login-content">
				<h1>${fns:getConfig('productName')}</h1>
				<p>西南林业大学 团委</p>
				<form id="loginForm" class="login-form" action="${ctx}/login" method="post">
					<div class="alert alert-danger display-hide">
						<button class="close" data-close="alert"></button>
						<span>Enter any username and password. </span>
					</div>

					<div class="header" style="color: #ff0000">
						<div id="messageBox" class="alert alert-error ${empty message ? 'hide' : ''}">
							<button data-dismiss="alert" class="close">×</button>
							<label id="loginError" class="error">${message}</label>
						</div>
					</div>

					<div class="row">
						<div class="col-xs-6">
							<input class="form-control form-control-solid placeholder-no-fix form-group" type="text"
								   autocomplete="off" placeholder="账号" name="username" required/></div>
						<div class="col-xs-6">
							<input class="form-control form-control-solid placeholder-no-fix form-group" type="password"
								   autocomplete="off" placeholder="密码" name="password" required/></div>
					</div>
					<div class="row">
						<c:if test="${isValidateCodeLogin}">
							<div class="col-xs-6">
								<label class="input-label mid" for="validateCode">验证码</label>
								<sys:validateCode name="validateCode" inputCssStyle="margin-bottom:0;"/>
							</div>
						</c:if>
					</div>
					<div class="row">
						<div class="col-sm-4">
							<div class="rem-password">
								<label class="rememberme mt-checkbox mt-checkbox-outline">
									<input type="checkbox" name="remember" value="1"/> 记住我
									<span></span>
								</label>
							</div>
						</div>
						<div class="col-sm-8 text-right">
							<button class="btn green" type="submit">登录</button>
							<a class="btn blue" href="${fns:getFrontPath()}/reg/form">注册</a>

						</div>
					</div>
				</form>
				<!-- BEGIN FORGOT PASSWORD FORM -->
				<form class="forget-form" action="javascript:;" method="post">
					<h3 class="font-green">忘记密码：</h3>
					<p>请联系管理员。</p>
					<div class="form-group">
						<input class="form-control placeholder-no-fix form-group" type="text" autocomplete="off"
							   placeholder="Email" name="email"/></div>
					<div class="form-actions">
						<button type="button" id="back-btn" class="btn green btn-outline">返回</button>
					</div>
				</form>
				<!-- END FORGOT PASSWORD FORM -->
			</div>
			<div class="login-footer">
				<div class="row bs-reset">
					<div class="col-xs-5 bs-reset">
						<ul class="login-social">
							<li>
								<a href="javascript:;">
									<i class="icon-social-facebook"></i>
								</a>
							</li>
							<li>
								<a href="javascript:;">
									<i class="icon-social-twitter"></i>
								</a>
							</li>
							<li>
								<a href="javascript:;">
									<i class="icon-social-dribbble"></i>
								</a>
							</li>
						</ul>
					</div>
					<div class="col-xs-7 bs-reset">
						<div class="login-copyright text-right">
							<p>Copyright &copy; 青春西林 2018</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="${ctxStatic}/newTheme/assets/global/plugins/respond.min.js"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/excanvas.min.js"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/ie8.fix.min.js"></script>
<![endif]-->
<!-- BEGIN CORE PLUGINS -->
<script src="${ctxStatic}/newTheme/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js"
		type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js"
		type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="${ctxStatic}/newTheme/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"
		type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/jquery-validation/js/additional-methods.min.js"
		type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/select2/js/select2.full.min.js"
		type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/backstretch/jquery.backstretch.min.js"
		type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN THEME GLOBAL SCRIPTS -->
<script src="${ctxStatic}/newTheme/assets/global/scripts/app.min.js" type="text/javascript"></script>
<!-- END THEME GLOBAL SCRIPTS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="${ctxStatic}/newTheme/assets/pages/scripts/login-5.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<!-- BEGIN THEME LAYOUT SCRIPTS -->
<!-- END THEME LAYOUT SCRIPTS -->
<script>
    $(document).ready(function () {
        $('#clickmewow').click(function () {
            $('#radio1003').attr('checked', 'checked');
        });
    })
</script>
</body>

</html>