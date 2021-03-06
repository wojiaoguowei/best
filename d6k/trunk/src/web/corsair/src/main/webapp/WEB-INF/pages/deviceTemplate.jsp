<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<%@ taglib prefix="form" uri="http://struts.apache.org/tags-html" %>--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="zh_CN">
<%
    session.getAttributeNames();
%>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>${sessionScope.APP_NAME}-设备模板</title>

    <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/metisMenu.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/sb-admin-2.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/font-awesome.css"/>" rel="stylesheet" type="text/css">
    <link href="resources/css/style.css" rel="stylesheet" type="text/css">

    <%--todo 页面自身需要的CSS begin--%>
    <%--页面自身需要的CSS end--%>
</head>

<body>

<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/js/metisMenu.min.js"/>"></script>
<script src="<c:url value="/resources/js/sb-admin-2.js"/>"></script>
<script src="<c:url value="/resources/dist/js/bootbox.min.js"/>"></script>
<script type="application/javascript">
    $(function(){
        $("tbody tr:even").css("background-color","rgb(31, 86, 134)");
        $("tbody tr:even").children().css("color","white");
        $("tbody tr:odd").css("background","#82accb");
        var num = $("tbody tr:odd").children().length;
        for(var i=1;i < num;i++){
            var count =5*i-3;
            $("tbody tr:even").children().eq(count).children(0).children(0).attr("src","/resources/img/Edit_W.png");
            $("tbody tr:odd").children().eq(count).children(0).children(0).attr("src","/resources/img/Edit_B.png");
        }
    });

</script>

<%--<div id="wrapper">
    <jsp:include page="meun.jsp"/>


    &lt;%&ndash;todo 工作空间，实际的内容将在这个位置添加&ndash;%&gt;
    <div id="page-wrapper">--%>
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header">设备模板</h3>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->

        <%--<form role="form" class="form-inline" action="accountList.do">--%>
        <form:form cssClass="form-inline" action="deviceTemplate" method="post" commandName="deviceTemplateForm">
            <form:hidden path="deleteIds" />
            <form:input type="submit" value="批量删除" cssStyle="display: none" path="del" />
            <div class="form-group">
                <input class="form-control" placeholder="模板名" name="name" autofocus/>
            </div>
            <div class="form-group">
                <input class="form-control" placeholder="模板描述" name="desc"/>
            </div>

            <button type="submit" class="btn btn-primary">
                <i class="glyphicon glyphicon-search"></i>
                查询模板
            </button>
            <a class="btn btn-primary" href="deviceTemplateModify">
                <i class="glyphicon glyphicon-plus"></i>
                新增模板
            </a>
            <div style="margin:10px 0;"></div>
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped">
                            <thead>
                            <tr id="first">
                                <th>
                                    模板名
                                </th>
                                <th>
                                    模板描述
                                </th>
                                <th>
                                    编辑模板
                                </th>
                                <th>
                                    编辑模板数据
                                </th>
                                <th>
                                    删除
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${not empty deviceTemplateList}">
                                <c:forEach items="${deviceTemplateList}" var="device">
                                    <tr>
                                        <td>
                                            <c:out value="${device.name }"/>
                                        </td>
                                        <td>
                                            <c:out value="${device.desc }"/>
                                        </td>
                                        <td align="center">
                                            <a href="deviceTemplateModify?id=${device.id }">
                                                <%--<i class="glyphicon glyphicon-edit"></i>
                                                编辑--%>
                                                <img />
                                            </a>
                                        </td>
                                        <td align="center">
                                            <a href="deviceTemplateData?id=${device.id }">
                                                <%--<i class="glyphicon glyphicon-calendar"></i>
                                                编辑--%>
                                                    <i class="glyphicon glyphicon-edit"></i>
                                            </a>
                                        </td>
                                        <td align="center">
                                            <c:if test="${account.username ne 'admin'}">
                                                <a
                                                   href="javascript:if(confirm('是否确定删除这条记录？')){document.forms[0].deleteIds.value='${device.id}';document.forms[0].del.click();}">
                                                    <%--<i class="glyphicon glyphicon-remove"></i>
                                                    删除--%>
                                                    <img src="/resources/img/Trash.png"/>
                                                </a>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <%--</html:form>--%>
        </form:form>

    <%--</div>
    <!-- /#page-wrapper -->

</div>--%>
<!-- /#wrapper -->
</body>

</html>
