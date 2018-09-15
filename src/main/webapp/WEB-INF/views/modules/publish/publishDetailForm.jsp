<%--
  Created by IntelliJ IDEA.
  User: xss
  Date: 2018/8/25
  Time: 1:29
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
            //$("#name").focus();
            $("#inputForm").validate({
                submitHandler: function(form){
                    loading('正在提交，请稍等...');
                    form.submit();
                },
                errorContainer: "#messageBox",
                errorPlacement: function(error, element) {
                    $("#messageBox").text("输入有误，请先更正。");
                    if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
                        error.appendTo(element.parent().parent());
                    } else {
                        error.insertAfter(element);
                    }
                }
            });
        });
    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li><a href="${ctx}/publish/publishDetail/">我的需求</a></li>
    <li class="active"><a href="${ctx}/publish/publishDetail/form?id=${publishDetail.id}">发布新需求<shiro:hasPermission name="publish:publishDetail:edit">${not empty publishDetail.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="publish:publishDetail:edit">查看</shiro:lacksPermission></a></li>
</ul><br/>
<form:form id="inputForm" modelAttribute="publishDetail" action="${ctx}/publish/publishDetail/save" method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <sys:message content="${message}"/>
    <div class="control-group">
        <label class="control-label">标题：</label>
        <div class="controls">
            <form:input path="title" htmlEscape="false" maxlength="255" class="input-xlarge required"/>
            <span class="help-inline"><font color="red">*</font> </span>			</div>
    </div>
    <div class="control-group">
        <label class="control-label">内容：</label>
        <div class="controls">
            <form:textarea path="content" htmlEscape="false" row="10" maxlength="500" class="input-xxlarge required"/>
            <span class="help-inline"><font color="red">*</font> </span>			</div>
    </div>
    <div class="control-group">
        <label class="control-label">图片：</label>
        <div class="controls">
            <form:hidden id="picture" path="picture" htmlEscape="false" maxlength="600" class="input-xlarge"/>
            <sys:ckfinder input="picture" type="files" uploadPath="/publish/publishDetail" selectMultiple="true"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">备注信息：</label>
        <div class="controls">
            <form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="publish:publishDetail:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
        <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
    </div>
</form:form>
</body>
</html>