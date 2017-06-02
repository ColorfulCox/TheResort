<%@page import="cn.sendto.service.CustomerService"%>
<%@page import="cn.sendto.model.Customer"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="../YLogin/err.jsp"%>
<%@include file="../YFile/file.jsp"%>
<%
	//设置编码
	request.setCharacterEncoding("UTF-8");
	//获取信息
	String integral = request.getParameter("integer");
	String cusnumber = request.getParameter("cusnumber");
	CustomerService dore = new CustomerService();
	int rows = dore.integer(integral, cusnumber);
	if (rows > 0) {
		request.setAttribute("info", "兑换成功");
		request.getRequestDispatcher("exchange.jsp").forward(request, response);
		return;
	} else {
		request.setAttribute("info", "积分不足，无法兑换");
		request.getRequestDispatcher("exchange.jsp").forward(request, response);
		return;
	}
%>