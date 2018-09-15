<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>

<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->

<head>
	<meta charset="utf-8"/>
	<title>${fns:getConfig('productName')}</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1" name="viewport"/>
	<meta content="Preview page of Metronic Admin Theme #1 for statistics, charts, recent events and reports"
		  name="description"/>
	<meta content="" name="author"/>
	<!-- BEGIN GLOBAL MANDATORY STYLES -->
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
	<link href="${ctxStatic}/newTheme/assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.css"
		  rel="stylesheet" type="text/css"/>
	<link href="${ctxStatic}/newTheme/assets/global/plugins/morris/morris.css" rel="stylesheet" type="text/css"/>
	<link href="${ctxStatic}/newTheme/assets/global/plugins/fullcalendar/fullcalendar.min.css" rel="stylesheet"
		  type="text/css"/>
	<link href="${ctxStatic}/newTheme/assets/global/plugins/jqvmap/jqvmap/jqvmap.css" rel="stylesheet" type="text/css"/>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN THEME GLOBAL STYLES -->
	<link href="${ctxStatic}/newTheme/assets/global/css/components.min.css" rel="stylesheet" id="style_components"
		  type="text/css"/>
	<link href="${ctxStatic}/newTheme/assets/global/css/plugins.min.css" rel="stylesheet" type="text/css"/>
	<!-- END THEME GLOBAL STYLES -->
	<!-- BEGIN THEME LAYOUT STYLES -->
	<link href="${ctxStatic}/newTheme/assets/layouts/layout/css/layout.min.css" rel="stylesheet" type="text/css"/>
	<link href="${ctxStatic}/newTheme/assets/layouts/layout/css/themes/darkblue.min.css" rel="stylesheet"
		  type="text/css" id="style_color"/>
	<link href="${ctxStatic}/newTheme/assets/layouts/layout/css/custom.min.css" rel="stylesheet" type="text/css"/>
	<!-- END THEME LAYOUT STYLES -->
	<link rel="shortcut icon" href="favicon.ico"/>
</head>
<!-- END HEAD -->

<body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white">
<div class="page-wrapper">
	<!-- BEGIN HEADER -->
	<div class="page-header navbar navbar-fixed-top">
		<!-- BEGIN HEADER INNER -->
		<div class="page-header-inner ">
			<!-- BEGIN LOGO -->
			<div class="page-logo">
				<a href="#">
					<img src="${ctxStatic}/newTheme/assets/layouts/layout/img/logo_swfu.png" alt="logo"
						 class="logo-default" style="width: 150px;height: 32px;"/> </a>
				<div class="menu-toggler sidebar-toggler">
					<span></span>
				</div>
			</div>
			<!-- END LOGO -->
			<!-- BEGIN RESPONSIVE MENU TOGGLER -->
			<a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse"
			   data-target=".navbar-collapse">
				<span></span>
			</a>
			<!-- END RESPONSIVE MENU TOGGLER -->
			<!-- BEGIN TOP NAVIGATION MENU -->
			<div class="top-menu">
				<ul class="nav navbar-nav pull-right">
					<!-- BEGIN NOTIFICATION DROPDOWN -->
					<!-- DOC: Apply "dropdown-dark" class after "dropdown-extended" to change the dropdown styte -->
					<!-- DOC: Apply "dropdown-hoverable" class after below "dropdown" and remove data-toggle="dropdown" data-hover="dropdown" data-close-others="true" attributes to enable hover dropdown mode -->
					<!-- DOC: Remove "dropdown-hoverable" and add data-toggle="dropdown" data-hover="dropdown" data-close-others="true" attributes to the below A element with dropdown-toggle class -->
					<!-- END NOTIFICATION DROPDOWN -->
					<!-- BEGIN INBOX DROPDOWN -->
					<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
					<!-- END INBOX DROPDOWN -->
					<!-- BEGIN TODO DROPDOWN -->
					<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
					<!-- END TODO DROPDOWN -->
					<!-- BEGIN USER LOGIN DROPDOWN -->
					<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
					<li class="dropdown dropdown-user">
						<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown"
						   data-close-others="true">
							<img alt="" class="img-circle"
								 src="${fns:getUser().photo}"/>
							<span class="username username-hide-on-mobile"> ${fns:getUser().name} </span>
							<i class="fa fa-angle-down"></i>
						</a>
						<ul class="dropdown-menu dropdown-menu-default">
							<li>
								<a href="${ctx}/sys/user/info" target="mainFrame">
									<i class="icon-user"></i> 个人信息 </a>
							</li>
							<li>
								<a href="${ctx}/sys/user/modifyPwd" target="mainFrame">
									<i class="icon-calendar"></i> 修改密码 </a>
							</li>
							<li>
								<a href="app_inbox.html">
									<i class="icon-envelope-open"></i> 我的通知
									<%--<span class="badge badge-danger"> 3 </span>--%>
								</a>
							</li>

							<li class="divider"></li>

							<li>
								<a href="${ctx}/logout" title="退出登录">
									<i class="icon-key"></i> 退出登录 </a>
							</li>
						</ul>
					</li>
					<!-- END USER LOGIN DROPDOWN -->
					<!-- BEGIN QUICK SIDEBAR TOGGLER -->
					<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
					<li class="dropdown dropdown-quick-sidebar-toggler">
						<a href="${ctx}/logout" class="dropdown-toggle">
							<i class="icon-logout"></i>
						</a>
					</li>
					<!-- END QUICK SIDEBAR TOGGLER -->
				</ul>
			</div>
			<!-- END TOP NAVIGATION MENU -->
		</div>
		<!-- END HEADER INNER -->
	</div>
	<!-- END HEADER -->
	<!-- BEGIN HEADER & CONTENT DIVIDER -->
	<div class="clearfix"></div>
	<!-- END HEADER & CONTENT DIVIDER -->
	<!-- BEGIN CONTAINER -->
	<div class="page-container">
		<!-- BEGIN SIDEBAR -->
		<div class="page-sidebar-wrapper">
			<!-- BEGIN SIDEBAR -->
			<!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
			<!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
			<div class="page-sidebar navbar-collapse collapse">
				<!-- BEGIN SIDEBAR MENU -->
				<!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
				<!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
				<!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
				<!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
				<!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
				<!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
				<ul class="page-sidebar-menu  page-header-fixed " data-keep-expanded="false" data-auto-scroll="true"
					data-slide-speed="200" style="padding-top: 20px">
					<!-- DOC: To remove the sidebar toggler from the sidebar you just need to completely remove the below "sidebar-toggler-wrapper" LI element -->
					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
					<li class="sidebar-toggler-wrapper hide">
						<div class="sidebar-toggler">
							<span></span>
						</div>
					</li>
					<!-- END SIDEBAR TOGGLER BUTTON -->
					<!-- DOC: To remove the search box from the sidebar you just need to completely remove the below "sidebar-search-wrapper" LI element -->

					<li class="heading">
						<h3 class="uppercase">${fns:getConfig('productName')}</h3>
					</li>

					<c:set var="firstMenu" value="true"/>
					<c:forEach items="${fns:getMenuList()}" var="menu" varStatus="idxStatus">
						<c:if test="${menu.parent.id eq '1'&&menu.isShow eq '1'}">
							<li class="nav-item">
								<c:if test="${empty menu.href}">
									<a data-toggle="collapse" data-parent="#menu-${param.parentId}"
									   data-href="#collapse-${menu.id}" href="#collapse-${menu.id}"
									   title="${menu.remarks}"
									   class="nav-link nav-toggle">
										<i class="icon-folder"></i>
										<span class="title">${menu.name}</span>
										<span class="arrow "></span>
									</a>
								</c:if>
								<c:if test="${not empty menu.href}">
									<a href="javascript:;"
									   href="${fn:indexOf(menu.href, '://') eq -1 ? ctx : ''}${menu.href}"
									   data-id="${menu.id}" target="mainFrame"
									   class="nav-link nav-toggle">
										<i class="icon-folder"></i>
										<span class="title">${menu.name}</span>
										<span class="arrow "></span>
									</a>
								</c:if>
								<ul class="sub-menu" style="display:block;">
									<c:forEach items="${menuList}" var="menu2">
										<c:if test="${menu2.parent.id eq menu.id&&menu2.isShow eq '1'}">
											<li class="nav-item">
												<a href="javascript:;" data-href=".menu3-${menu2.id}"
												   href="${fn:indexOf(menu2.href, '://') eq -1 ? ctx : ''}${not empty menu2.href ? menu2.href : '/404'}"
												   target="${not empty menu2.target ? menu2.target : 'mainFrame'}"
												   class="nav-link nav-toggle">
													<i class="icon-settings"></i> ${menu2.name}
													<span class="arrow"></span>
												</a>
												<ul class="sub-menu">
													<c:forEach items="${menuList}" var="menu3">
														<c:if test="${menu3.parent.id eq menu2.id&&menu3.isShow eq '1'}">
															<li class="nav-item">
																<a href="${fn:indexOf(menu3.href, '://') eq -1 ? ctx : ''}${not empty menu3.href ? menu3.href : '/404'}"
																   target="${not empty menu3.target ? menu3.target : 'mainFrame'}">
																	<i class="icon-plus"></i> ${menu3.name}
																	</span>
																</a>

															</li>
														</c:if>
													</c:forEach>
												</ul>
											</li>
										</c:if>
									</c:forEach>
								</ul>
							</li>
							<c:if test="${firstMenu}">
								<c:set var="firstMenuId" value="${menu.id}"/>
							</c:if>
							<c:set var="firstMenu" value="false"/>
						</c:if>
					</c:forEach>

				</ul>
				<!-- END SIDEBAR MENU -->
				<!-- END SIDEBAR MENU -->
			</div>
			<!-- END SIDEBAR -->
		</div>
		<!-- END SIDEBAR -->
		<!-- BEGIN CONTENT -->
		<div class="page-content-wrapper">
			<!-- BEGIN CONTENT BODY -->
			<div class="page-content">
				<div id="right">
					<iframe id="mainFrame" name="mainFrame" class="fit-windows" src="" style="overflow:visible;" scrolling="no" frameborder="no" width="100%" onload="this.height=mainFrame.document.body.scrollHeight"

					></iframe>
				</div>
			</div>
			<!-- END CONTENT BODY -->
		</div>
		<!-- END CONTENT -->

	</div>
	<!-- END CONTAINER -->
	<!-- BEGIN FOOTER -->
	<div class="page-footer">
		<div class="page-footer-inner"> 2018 &copy; 青春西林 By
			<a target="_blank" href="/">Xieshanshann</a> &nbsp;|&nbsp;
			<a href="#" title="Welcome to you!" target="_blank">Welcome to you!</a>
		</div>
		<div class="scroll-to-top">
			<i class="icon-arrow-up"></i>
		</div>
	</div>
	<!-- END FOOTER -->
</div>

<!--[if lt IE 9]>
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
<script src="${ctxStatic}/newTheme/assets/global/plugins/moment.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.js"
		type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/morris/morris.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/morris/raphael-min.js" type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/counterup/jquery.waypoints.min.js"
		type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/counterup/jquery.counterup.min.js"
		type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/amcharts/amcharts/amcharts.js" type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/amcharts/amcharts/serial.js" type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/amcharts/amcharts/pie.js" type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/amcharts/amcharts/radar.js" type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/amcharts/amcharts/themes/light.js"
		type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/amcharts/amcharts/themes/patterns.js"
		type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/amcharts/amcharts/themes/chalk.js"
		type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/amcharts/ammap/ammap.js" type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/amcharts/ammap/maps/js/worldLow.js"
		type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/amcharts/amstockcharts/amstock.js"
		type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/fullcalendar/fullcalendar.min.js"
		type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/horizontal-timeline/horizontal-timeline.js"
		type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/flot/jquery.flot.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/flot/jquery.flot.resize.min.js"
		type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/flot/jquery.flot.categories.min.js"
		type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/jquery-easypiechart/jquery.easypiechart.min.js"
		type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/jquery.sparkline.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/jqvmap/jqvmap/jquery.vmap.js" type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.russia.js"
		type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.world.js"
		type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.europe.js"
		type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.germany.js"
		type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/jqvmap/jqvmap/maps/jquery.vmap.usa.js"
		type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/global/plugins/jqvmap/jqvmap/data/jquery.vmap.sampledata.js"
		type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN THEME GLOBAL SCRIPTS -->
<script src="${ctxStatic}/newTheme/assets/global/scripts/app.min.js" type="text/javascript"></script>
<!-- END THEME GLOBAL SCRIPTS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="${ctxStatic}/newTheme/assets/pages/scripts/dashboard.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<!-- BEGIN THEME LAYOUT SCRIPTS -->
<script src="${ctxStatic}/newTheme/assets/layouts/layout/scripts/layout.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/layouts/layout/scripts/demo.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/newTheme/assets/layouts/global/scripts/quick-nav.min.js" type="text/javascript"></script>
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