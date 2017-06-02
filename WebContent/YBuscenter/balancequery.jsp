<%@page import="cn.sendto.service.CustomerService"%>
<%@page import="cn.sendto.model.Customer"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="cn.sendto.model.Proscenium"%>
<%@page import="cn.sendto.rowmapper.impl.ProsceniumRowMapper"%>
<%@page import="cn.sendto.dbhelper.DbHelper"%>
<%@page import="cn.sendto.dbhelper.ConnectionManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="../YLogin/err.jsp"%>
<%@include file="../YFile/file.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>余额查询</title>
<link rel="stylesheet" type="text/css"
	href="<%=pageContext.getServletContext().getContextPath()%>/css/currency.css">
<link rel="stylesheet" type="text/css"
	href="<%=pageContext.getServletContext().getContextPath()%>/css/balancequery.css">
</head>
<body>
	<table class="table_top" align="left">
		<tr>
			<td>当前位置>余额查询</td>
			<td align="right"><a href="../YMemment/user_list.jsp">返回用户列表</a></td>
		</tr>
	</table>
	<%
		request.setCharacterEncoding("UTF-8");
		String cusnn = request.getParameter("cusn");
		CustomerService bq = new CustomerService();
		List<Customer> list = bq.Reminder();
		String cusn;
		if (cusnn != null) {
			cusn = cusnn;
		} else {
			cusn = "";
		}
	%>

	<form action="balancequery.jsp" method="post">

		<table class="table_top" align="left" border="0">
			<tr>
				<td colspan="2" align="center" class="apan_style">会员余额查询</td>
			</tr>
			<tr>
				<td width="39%" height="50px" align="right" valign="bottom">会员卡号：
					<input type="text" name="cusn" value="<%=cusn%>" />&nbsp; <input
					type="submit" value="查询" />
				</td>
				<td></td>
			</tr>
		</table>
		<table align="center" class="table_main" cellspacing="1"
			cellpadding="0">
			<tr align="center">
				<th class="table">会员卡号</th>
				<th class="table">会员姓名</th>
				<th class="table">积分</th>
				<th class="table">剩余金额</th>
			</tr>
			<%
				for (int i = 0; i < list.size(); i++) {
					if (cusn != null) {
						if (list.get(i).getCusnumber().equals(cusn)) {
			%>
			<tr align="center">
				<td class="table_td"><%=list.get(i).getCusnumber()%></td>
				<td class="table_td"><%=list.get(i).getCusname()%></td>
				<td class="table_td"><%=list.get(i).getIntegral()%></td>
				<td class="table_td"><%=list.get(i).getBalance()%></td>
			</tr>
			<%
				}
					}
				}
			%>
			<%
				if (cusn == null || cusn.equals("")) {
					for (int i = 0; i < list.size(); i++) {
			%>
			<tr align="center">
				<td class="table_td"><%=list.get(i).getCusnumber()%></td>
				<td class="table_td"><%=list.get(i).getCusname()%></td>
				<td class="table_td"><%=list.get(i).getIntegral()%></td>
				<td class="table_td"><%=list.get(i).getBalance()%></td>
			</tr>
			<%
				}
				}
			%>
		</table>
	</form>
</body>
</html>