<%--
  Created by IntelliJ IDEA.
  User: xss
  Date: 2018/8/25
  Time: 1:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>信息发布管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            //$("#name").focus();
            $("#inputForm").validate({
                submitHandler: function (form) {
                    loading('正在提交，请稍等...');
                    form.submit();
                },
                errorContainer: "#messageBox",
                errorPlacement: function (error, element) {
                    $("#messageBox").text("输入有误，请先更正。");
                    if (element.is(":checkbox") || element.is(":radio") || element.parent().is(".input-append")) {
                        error.appendTo(element.parent().parent());
                    } else {
                        error.insertAfter(element);
                    }
                }
            });
        });
    </script>
    <link href="${ctxStatic}/myStyle/my.css" rel="stylesheet"
          type="text/css"/>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/publish/publishDetail/examineAndVerify">信息发布列表</a></li>
    <li class="active"><a href="${ctx}/publish/publishDetail/info?id=${publishDetail.id}">详细信息<shiro:hasPermission
            name="publish:publishDetail:edit">${not empty publishDetail.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission
            name="publish:publishDetail:edit">查看</shiro:lacksPermission></a></li>
</ul>
<br/>
<form:form id="inputForm" modelAttribute="publishDetail" action="${ctx}/publish/publishDetail/passInfo" method="post"
           class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">标题：</label>
        <div class="controls">
                ${publishDetail.title}
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">内容：</label>
        <div class="controls">
                ${publishDetail.content}
        </div>
    </div>
    <c:if test="${pictureUrl ne null && pictureUrl ne ''}">
        <div class="control-group">
            <label class="control-label">图片：</label>
            <div class="controls">
                <img class="pictureInfo" src="${pictureUrl}"/>

            </div>
        </div>
    </c:if>
    <div class="control-group">
        <label class="control-label">备注信息：</label>
        <div class="controls">
                ${publishDetail.remarks} </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="publish:publishDetail:edit">
            <c:if test="${publishDetail.completeFlag ne 0}">
                <c:if test="${publishDetail.reviewFlag ne 0}">
                    <input id="btnSubmit" name="btnSubmit" class="btn btn-primary" type="submit" value="通过"/>
                </c:if>&nbsp;
                <input id="btnSubmit1" class="btn btn-primary" style="background-color: #cc4a4a" type="submit"
                       value="不通过"/>
            </c:if>
        </shiro:hasPermission>

        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>