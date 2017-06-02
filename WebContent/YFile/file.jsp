<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (request.getSession().getAttribute("username") == null) {
		request.getRequestDispatcher("../YLogin/login.jsp").forward(request, response);
	}
%>