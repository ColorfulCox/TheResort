<%@page import="cn.sendto.service.ProsceniumService"%>
<%@page import="cn.sendto.rowmapper.impl.ProsceniumRowMapper"%>
<%@page import="cn.sendto.model.Proscenium"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="javafx.scene.control.Alert"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="cn.sendto.dbhelper.DbHelper"%>
<%@page import="cn.sendto.dbhelper.ConnectionManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="../YLogin/err.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	String username = request.getParameter("username");
	String userpass = request.getParameter("userpass");
	String box = request.getParameter("userbox");

	if ((username == null) && (userpass == null)) {
		request.setAttribute("info", "请登录！");
		request.getRequestDispatcher("../YLogin/login.jsp").forward(request, response);
		return;
	}
	if (username.equals("")) {
		request.setAttribute("info", "请输入用户名！");
		request.getRequestDispatcher("../YLogin/login.jsp").forward(request, response);
		return;
	}
	ProsceniumService dol = new ProsceniumService();
	List<Proscenium> list = dol.judge(username);
	if (list.size() > 0) {
		if (userpass.equals("") || userpass == null) {
			request.setAttribute("info", "请输入密码！");
			request.setAttribute("user", username);
			request.getRequestDispatcher("../YLogin/login.jsp").forward(request, response);
			return;
		}
		if (list.get(0).getPropass().equals(userpass)) {
			session.setAttribute("username", username);
			if (box != null && box.equals("yes")) {
				Cookie cookie = new Cookie("userName", username);
				cookie.setPath("/");
				cookie.setMaxAge(1000 * 60 * 60 * 24 * 7);
				response.addCookie(cookie);
			} else {
				Cookie cookie = new Cookie("userName", "");
				cookie.setPath("/");
				cookie.setMaxAge(1000 * 60 * 60 * 24 * 7);
				response.addCookie(cookie);
			}
			session.setAttribute("userName", username);
			response.sendRedirect("../YLogin/main.jsp");
			return;
		} else {
			request.setAttribute("info", "密码输入错误！");
			request.setAttribute("user", username);
			request.getRequestDispatcher("../YLogin/login.jsp").forward(request, response);
			return;
		}
	} else {
		//out.println("用户名或密码输入错误！");
		request.setAttribute("info", "无此用户！");
		request.getRequestDispatcher("../YLogin/login.jsp").forward(request, response);
		return;
	}
%>