<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="err.jsp"%>
<%@include file="../YFile/file.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=pageContext.getServletContext().getContextPath()%>/css/top3.css">
<title>顶部标签</title>
<style type="text/css">
body {
	background-image:
		url("<%=pageContext.getServletContext().getContextPath()%>/images/topbj.jpg");
	background-repeat: no-repeat;
	background-size: 100% 130px;
}
</style>
</head>
<body>
	<div class="topdiv">
		<span class="span">云创度假村会员管理系统</span><span class="span1"><a
			href="login.jsp" target="_top">返回登录</a></span>
		<p>
			欢迎您:<%=request.getSession().getAttribute("username")%></p>
	</div>
</body>
</html>