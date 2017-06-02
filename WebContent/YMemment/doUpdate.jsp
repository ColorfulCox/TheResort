<%@page import="cn.sendto.service.CustomerService"%>
<%@page import="cn.sendto.model.Customer"%>
<%@page import="cn.sendto.dbhelper.DbHelper"%>
<%@page import="cn.sendto.dbhelper.ConnectionManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="../YLogin/err.jsp"%>
<%@include file="../YFile/file.jsp"%>
<%
	//设置中文编码
	request.setCharacterEncoding("UTF-8");

	//获取信息
	String cusnumber = request.getParameter("cusnumber");
	String cusname = request.getParameter("cusname");
	String cussex = request.getParameter("cussex");
	String tel = request.getParameter("tel");
	String birthday = request.getParameter("birthday");
	String idcard = request.getParameter("idcard");
	String address = request.getParameter("address");
	String demo1 = request.getParameter("demo1");

	CustomerService cus = new CustomerService();
	int rows = cus.insert(cusnumber, cusname, cussex, tel, birthday, idcard, address, demo1);

	if (rows > 0) {
		request.setAttribute("info", "修改成功");
		request.getRequestDispatcher("user_list.jsp").forward(request, response);
		return;
	} else {
		request.setAttribute("info", "修改失败");
		request.getRequestDispatcher("user_list.jsp").forward(request, response);
		return;
	}
%>