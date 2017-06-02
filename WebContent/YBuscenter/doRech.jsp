<%@page import="cn.sendto.service.CustomerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="../YLogin/err.jsp"%>
<%@include file="../YFile/file.jsp"%>
<%
	//设置编码格式
	request.setCharacterEncoding("UTF-8");
	//获取表单数据
	//卡号
	String cusnumber = request.getParameter("cusnumber");
	//充值后的金额
	String balance = request.getParameter("balance");
	//充值后的积分
	String integral = request.getParameter("integral");
	CustomerService dor = new CustomerService();
	int row = dor.recharge(balance, integral, cusnumber);
	if (row > 0) {
		request.setAttribute("cus", "充值成功");
		request.getRequestDispatcher("Recharge.jsp").forward(request, response);
	} else {
		request.setAttribute("cus", "充值失败");
		request.getRequestDispatcher("Recharge.jsp").forward(request, response);
	}
%>