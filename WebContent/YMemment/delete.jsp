<%@page import="cn.sendto.service.CustomerService"%>
<%@page import="cn.sendto.service.ExpeniseService"%>
<%@page import="cn.sendto.model.Customer"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="../YLogin/err.jsp"%>
<%@include file="../YFile/file.jsp"%>
<%
	//step1:获取参数
	String cusnumber = request.getParameter("cusnumber");
	//创建删除用户信息对象
	CustomerService dor = new CustomerService();
	//创建删除用户消费信息对象
	ExpeniseService exp = new ExpeniseService();
	//删除用户消费信息
	int row1 = exp.expenise(cusnumber);
	//删除用户信息
	int row = dor.deletenumber(cusnumber);
	//判断是否删除成功
	if (row > 0) {
		request.setAttribute("info", "删除成功");
		request.getRequestDispatcher("user_list.jsp").forward(request, response);
		return;
	} else {
		request.setAttribute("info", "删除失败，请重新操作");
		request.getRequestDispatcher("user_list.jsp").forward(request, response);
		return;
	}
%>