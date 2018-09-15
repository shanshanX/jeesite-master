<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
	<title>任务管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
        $(document).ready(function () {

        });
        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }
	</script>
	<link href="${ctxStatic}/myStyle/my.css" rel="stylesheet"
		  type="text/css"/>
</head>
<body>
<ul class="nav nav-tabs">
	<li class="active"><a href="${ctx}/task/tasksDetail/">任务汇总表</a></li>
</ul>
<form:form id="searchForm" modelAttribute="publishDetail" action="${ctx}/task/tasksDetail/" method="post"
		   class="breadcrumb form-search">
	<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
	<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
	<ul class="ul-form">
		<li><label>标题：</label>
			<form:input path="title" htmlEscape="false" maxlength="64" class="input-medium"/>
		</li>
		<li><label>受助人：</label>
			<form:input path="createByUserName" htmlEscape="false" maxlength="64" class="input-medium"/>
		</li>

		<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
		<li class="clearfix"></li>
	</ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
	<thead>
	<tr>
		<th>序号</th>
		<th>标题</th>
		<th>受助人</th>
		<th>审核进度</th>
		<th>专业人员</th>
		<th>更新时间</th>
		<th>备注信息</th>
		<shiro:hasPermission name="publish:publishDetail:edit">
			<th>操作</th>
		</shiro:hasPermission>
	</tr>
	</thead>
	<tbody>
	<c:forEach items="${page.list}" var="publishDetail" varStatus="status">
		<tr>
			<td>${ status.index + 1 + (page.pageNo - 1) * 10}</td>
			<td><a href="${ctx}/task/tasksDetail/info?id=${publishDetail.id}">${publishDetail.title}
			</a></td>
			<td>
					${publishDetail.createByUserName}
			</td>
			<td>
				<c:if test="${publishDetail.reviewFlag eq 1}">
					<a class="am-badge">未通过</a>
				</c:if>
				<c:if test="${publishDetail.reviewFlag eq 0}">
					<a class="am-badge" style="background-color: #25cc0a">通过</a>
				</c:if>
				<c:if test="${publishDetail.reviewFlag eq 2}">
					<a class="am-badge" style="background-color: #00a8c6">待审核</a>
				</c:if>
			</td>
			<td>
				<c:if test="${publishDetail.receiveUserName ne null && publishDetail.receiveUserName ne ''}">
					${publishDetail.receiveUserName}
				</c:if>
				<c:if test="${publishDetail.receiveUserName eq null || publishDetail.receiveUserName eq ''}">
					<a class="am-badge" style="background-color: #ccc">暂无</a>
				</c:if></td>
			<td>
				<fmt:formatDate value="${publishDetail.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>

			</td>

			<td>
					${publishDetail.remarks}
			</td>

			<shiro:hasPermission name="task:tasksDetail:edit">
				<td>
					<a href="${ctx}/task/tasksDetail/applicationFlag?id=${publishDetail.id}"
					   onclick="return confirmx('确认要领取该任务吗？', this.href)" class="am-badge" style="background-color: #737a7a">领取</a>

				</td>
			</shiro:hasPermission>
		</tr>
	</c:forEach>
	</tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>