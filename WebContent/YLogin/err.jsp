<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%@include file="../YFile/file.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>出错页面</title>
<link type="text/css" rel="stylesheet"
	href="<%=pageContext.getServletContext().getContextPath()%>/css/err.css" />
</head>
<body>
	<div class="div">
		<img alt="对不起，出错了"
			src="<%=pageContext.getServletContext().getContextPath()%>/images/err.jpg"
			class="img" />
	</div>
</body>
</html>