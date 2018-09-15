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
    <li class="active"><a href="${ctx}/task/tasksDetail/myTasks">我的任务</a></li>
    <shiro:hasPermission name="task:tasksDetail:edit">
        <li><a href="${ctx}/task/tasksDetail/">任务添加</a></li>
    </shiro:hasPermission>
</ul>
<form:form id="searchForm" modelAttribute="tasksDetail" action="${ctx}/task/tasksDetail/myTasks" method="post"
           class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">

        <li><label>受助人：</label>
            <form:input path="userName" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>

        <li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<table id="contentTable" class="table table-striped table-bordered table-condensed">
    <thead>
    <tr>
        <th>标题</th>
        <th>受助人</th>
        <th>受助人电话</th>
        <th>专业人员</th>
        <th>更新时间</th>
        <th>状态</th>
        <shiro:hasPermission name="publish:publishDetail:edit">
            <th>操作</th>
        </shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="tasksDetail">
        <tr>
            <td><a href="${ctx}/task/tasksDetail/info?id=${tasksDetail.id}">${tasksDetail.taskTitle}
            </a></td>
            <td>
                    ${tasksDetail.userName}
            </td>
            <td>
                    ${tasksDetail.phone}
            </td>

            <td>
                    ${tasksDetail.receiveUserNameRecent}
            </td>
            <td>
                <fmt:formatDate value="${tasksDetail.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>

            </td>

            <td>
                <c:if test="${tasksDetail.completeFlag eq 1}">
                    <a class="am-badge" style="background-color: #ed6b75">未完成</a>
                </c:if>
                <c:if test="${tasksDetail.completeFlag eq 0}">
                    <a class="am-badge" style="background-color: #25cc0a">已完成</a>
                </c:if>
            </td>

            <shiro:hasPermission name="task:tasksDetail:edit">
                <td>
                    <c:if test="${tasksDetail.completeFlag eq 1}">
                        <a href="${ctx}/task/tasksDetail/tasksSuccess?id=${tasksDetail.id}"
                           onclick="return confirmx('确认完成了该任务吗？', this.href) " class="am-badge"
                           style="background-color: #737a7a">完成</a>
                        <a href="${ctx}/task/tasksDetail/delApplication?id=${tasksDetail.id}"
                           onclick="return confirmx('确认要退回该任务吗？', this.href)" class="am-badge"
                           style="background-color: #737a7a">退回任务</a>
                    </c:if>
                    <c:if test="${tasksDetail.completeFlag eq 0}">
                        <a class="am-badge" style="background-color: #737a7a">无</a>
                    </c:if>
                </td>
            </shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>