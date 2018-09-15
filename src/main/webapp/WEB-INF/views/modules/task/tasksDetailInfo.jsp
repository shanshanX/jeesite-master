<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>任务详情</title>
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
    <li class="active"><a href="${ctx}/task/tasksDetail/">任务列表</a></li>

</ul>
<br/>
<form:form id="inputForm" modelAttribute="tasksDetail"
           action="${ctx}/task/tasksDetail/tasksSuccess?id=${tasksDetail.id}" method="post"
           class="form-horizontal">
    <%--<form:hidden path="id"/>--%>
    <sys:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">标题：</label>
        <div class="controls">
                ${title}
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">内容：</label>
        <div class="controls">
                ${content}
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
                ${remarks} </div>
    </div>
    <div class="form-actions">
        <c:if test="${tasksDetail.completeFlag eq 1}">
            <shiro:hasPermission name="task:tasksDetail:edit">
                <input id="btnSubmit" name="btnSubmit" class="btn btn-primary" type="submit" value="完成"/>&nbsp;
            </shiro:hasPermission>
        </c:if>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>