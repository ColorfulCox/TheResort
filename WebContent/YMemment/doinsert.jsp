<%@page import="cn.sendto.model.Customer"%>
<%@page import="java.util.List"%>
<%@page import="cn.sendto.service.CustomerService"%>
<%@page import="cn.sendtu.util.DateUtil"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Connection"%>
<%@page import="cn.sendto.dbhelper.ConnectionManager"%>
<%@page import="cn.sendto.dbhelper.DbHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="../YLogin/err.jsp"%>
<%@include file="../YFile/file.jsp"%>
<%
	//设置中文编码
	request.setCharacterEncoding("UTF-8");

	//获取信息

	String memid = request.getParameter("memid");
	String cusnumber = request.getParameter("cusnumber");
	String cusname = request.getParameter("cusname");
	String cussex = request.getParameter("cussex");
	String tel = request.getParameter("tel");
	String birthday = request.getParameter("birthday");
	String idcard = request.getParameter("idcard");
	String address = request.getParameter("address");
	String demo1 = request.getParameter("demo1");
	CustomerService rem = new CustomerService();
	List<Customer> list = rem.cusnumber(cusnumber);
	if (list != null) {
		request.setAttribute("info", "卡号已被注册");
		request.getRequestDispatcher("insert.jsp").forward(request, response);
		return;
	}

	int row = rem.inname(memid, cusnumber, cusname, cussex, tel, birthday, idcard, address, demo1);

	if (row > 0) {
		request.setAttribute("info", "注册成功");
		request.getRequestDispatcher("user_list.jsp").forward(request, response);
		return;
	} else {
		request.setAttribute("info", "注册失败");
		request.getRequestDispatcher("user_list.jsp").forward(request, response);
		return;
	}
%>