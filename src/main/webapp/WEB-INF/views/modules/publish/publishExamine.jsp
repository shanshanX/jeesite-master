<%--
  Created by IntelliJ IDEA.
  User: xss
  Date: 2018/8/25
  Time: 0:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
    <title>信息发布管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function() {

        });
        function page(n,s){
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
    <li class="active"><a href="${ctx}/publish/publishDetail/examineAndVerify">信息审核</a></li>
</ul>
<form:form id="searchForm" modelAttribute="publishDetail" action="${ctx}/publish/publishDetail/examineAndVerify" method="post" class="breadcrumb form-search">
    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
    <ul class="ul-form">
        <li><label>标题：</label>
            <form:input path="title" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>受助人：</label>
            <form:input path="createByUserName" htmlEscape="false" maxlength="64" class="input-medium"/>
        </li>
        <li><label>专业人员：</label>
            <form:input path="receiveUserName" htmlEscape="false" maxlength="64" class="input-medium"/>
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
        <th>专业人员</th>
        <th>是否通过审核</th>
        <th>更新时间</th>
        <th>备注信息</th>
        <shiro:hasPermission name="publish:publishDetail:edit"><th>操作</th></shiro:hasPermission>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${page.list}" var="publishDetail">
        <tr>
            <td><a href="${ctx}/publish/publishDetail/info?id=${publishDetail.id}">${publishDetail.title}
            </a></td>
            <td>
                    ${publishDetail.createByUserName}
            </td>
            <td>
                <c:if test="${publishDetail.receiveUserName ne null && publishDetail.receiveUserName ne ''}">
                    ${publishDetail.receiveUserName}
                </c:if>
                <c:if test="${publishDetail.receiveUserName eq null || publishDetail.receiveUserName eq ''}">
                    <a class="am-badge" style="background-color: #ccc">暂无</a>
                </c:if>
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

                <c:if test="${publishDetail.receiveFlag eq 1 && publishDetail.reviewFlag eq 0}">
                    <a class="am-badge">暂无人领取该任务</a>
                </c:if>
                <c:if test="${publishDetail.receiveFlag eq 0 && publishDetail.completeFlag eq 1}">
                    <a class="am-badge" style="background-color: #e67c3f">专业人员正在线下与用户对接</a>
                </c:if>

                <c:if test="${publishDetail.completeFlag eq 1 && publishDetail.reviewFlag eq 0}">
                    <a class="am-badge">未完成服务</a>
                </c:if>
                <c:if test="${publishDetail.completeFlag eq 0}">
                    <a class="am-badge " style="background-color: #25cc0a">已完成服务</a>
                </c:if>
            </td>
            <td>
                <fmt:formatDate value="${publishDetail.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>

            </td>

            <td>
                    ${publishDetail.remarks}
            </td>
            <shiro:hasPermission name="publish:publishDetail:edit"><td>
                <a href="${ctx}/publish/publishDetail/info?id=${publishDetail.id}" class="am-badge" style="background-color: #737a7a">查阅</a>
            </td></shiro:hasPermission>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="pagination">${page}</div>
</body>
</html>