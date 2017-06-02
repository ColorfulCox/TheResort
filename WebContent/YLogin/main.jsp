<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="err.jsp"%>
<%@include file="../YFile/file.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<frameset rows="130,*" frameborder="no" noresize="noresize">
	<frame
		src="<%=pageContext.getServletContext().getContextPath()%>/YLogin/top.jsp"
		scrolling="no" />
	<frameset cols="240,*" noresize="noresize">
		<frame scrolling="no"
			src="<%=pageContext.getServletContext().getContextPath()%>/left.html"
			noresize="noresize" />
		<frame name="right"
			src="<%=pageContext.getServletContext().getContextPath()%>/YBuscenter/remind.jsp" />
	</frameset>

</frameset>
</html>