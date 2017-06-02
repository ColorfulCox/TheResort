<%@page import="cn.sendto.service.CustomerService"%>
<%@page import="cn.sendto.model.Customer"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="../YLogin/err.jsp"%>
<%@include file="../YFile/file.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN"
"http://www.w3.org/TR/html4/strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link type="text/css" rel="stylesheet"
	href="<%=pageContext.getServletContext().getContextPath()%>/css/remind.css" />
<link rel="stylesheet" type="text/css"
	href="<%=pageContext.getServletContext().getContextPath()%>/css/currency.css">
<title>积分查询</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String cusnumber = request.getParameter("secusnumber");
		if (cusnumber == null) {
			cusnumber = "";
		}
	%>
	<form action="select.jsp" method="post">
		<table class="table_top" align="left">
			<tr>
				<td>当前位置>积分查询</td>
			</tr>
			<tr>
				<td class="apan_style" align="center" colspan="2">会员积分查询</td>
			</tr>
		</table>
		<div>
			<table>
				<tr>
					<td width="72%" align="right">会员卡号&nbsp; <input type="text"
						name="secusnumber" value="<%=cusnumber%>">&nbsp; <input
						type="submit" name="btnsubmit" value="查询"></td>
				</tr>
			</table>
			<table class="table_main">
				<tr>
					<th class="table">卡号</th>
					<th class="table">积分</th>
					<th class="table">积分兑换</th>
				</tr>

				<%
					CustomerService cus = new CustomerService();
					List<Customer> list = cus.Reminder();
					if (list != null) {
						for (int i = 0; i < list.size(); i++) {
							if (cusnumber == null || cusnumber.equals("")) {
				%>
				<tr>
					<td align="center" class="table_td"><%=list.get(i).getCusnumber()%></td>
					<td align="center" class="table_td"><%=list.get(i).getIntegral()%></td>
					<td align="center" class="table_td"><a
						href="exchange.jsp?cusnumber=<%=list.get(i).getCusnumber()%>">兑换</a></td>
				</tr>
				<%
					}
							if (cusnumber != null) {
								if (list.get(i).getCusnumber().equals(cusnumber)) {
				%>
				<tr>
					<td align="center" class="table_td"><%=list.get(i).getCusnumber()%></td>
					<td align="center" class="table_td"><%=list.get(i).getIntegral()%></td>
					<td align="center" class="table_td"><a
						href="exchange.jsp?cusnumber=<%=list.get(i).getCusnumber()%>">兑换</a></td>
				</tr>
				<%
					}
							}
						}
					}
				%>
			</table>
		</div>
	</form>
</body>
</html>
