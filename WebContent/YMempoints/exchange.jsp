<%@page import="cn.sendto.service.CustomerService"%>
<%@page import="cn.sendto.model.Customer"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="../YLogin/err.jsp"%>
<%@include file="../YFile/file.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link type="text/css" rel="stylesheet"
	href="<%=pageContext.getServletContext().getContextPath()%>/css/remind.css" />
<link rel="stylesheet" type="text/css"
	href="<%=pageContext.getServletContext().getContextPath()%>/css/currency.css">
<style>
</style>
<title>礼品展示</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String cusnumber = request.getParameter("cusnumber");
		String integer = request.getParameter("integer");
		CustomerService cus = new CustomerService();
		List<Customer> list = cus.cusnumber(cusnumber);
	%>
	<table class="table_top" align="left">
		<tr>
			<%
				if (list != null) {
			%>
			<td>当前位置>积分兑换</td>
			<%
				}
			%>
			<%
				if (list == null) {
			%>
			<td>当前位置>礼品展示</td>
			<%
				}
			%>
			<td align="right"><a href="select.jsp">返回积分查询</a></td>
		</tr>
	</table>

	<table border="0" align="center" cellspacing="10px">
		<caption>
			<%
				if (list != null) {
			%>
			<span class="apan_style">积分兑换</span>
			<%
				}
			%>
			<%
				if (list == null) {
			%>
			<span class="apan_style">礼品展示</span>
			<%
				}
			%>
		</caption>
		<tr>
			<td></td>
			<%
				if (list != null) {
			%>
			<td align="right" width="300px" class="red">
				<%
					request.setCharacterEncoding("UTF-8");
						if (request.getAttribute("info") != null) {
							out.print(request.getAttribute("info").toString());
						}
				%>
			</td>
			<td>剩余积分：<%=list.get(0).getIntegral()%></td>
			<%
				}
			%>

		</tr>
		<tr>
			<td height="150px" width="200px"><img
				src="<%=pageContext.getServletContext().getContextPath()%>/images/04.jpg" />水质安全检测<br />积分：400</td>
			<td height="150px" width="200px"><img
				src="<%=pageContext.getServletContext().getContextPath()%>/images/05.jpg" />用电安全检测<br />积分：400</td>
			<td height="150px" width="200px"><img
				src="<%=pageContext.getServletContext().getContextPath()%>/images/06.jpg" />冰箱清洗保养<br />积分：400</td>
		</tr>
		<%
			if (list != null) {
		%>
		<tr align="center">
			<td height="20px"><a
				href="doexchange.jsp?integer=400&cusnumber=<%=cusnumber%>"><img
					src="<%=pageContext.getServletContext().getContextPath()%>/images/dh.jpg"
					name="img1" /></a></td>
			<td height="20px"><a
				href="doexchange.jsp?integer=400&cusnumber=<%=cusnumber%>"><img
					src="<%=pageContext.getServletContext().getContextPath()%>/images/dh.jpg"
					name="img2" /></a></td>
			<td height="20px"><a
				href="doexchange.jsp?integer=400&cusnumber=<%=cusnumber%>"><img
					src="<%=pageContext.getServletContext().getContextPath()%>/images/dh.jpg"
					name="img3" /></a></td>
		</tr>
		<%
			}
		%>
		<%
			if (list == null) {
		%>
		<tr>
			<td colspan="3" height="30px"></td>
		</tr>
		<%
			}
		%>
		<tr>
			<td height="150px" width="200px"><img
				src="<%=pageContext.getServletContext().getContextPath()%>/images/01.jpg" />Casarte简爱·棒式搅拌机<br />积分：3000</td>
			<td height="150px" width="200px"><img
				src="<%=pageContext.getServletContext().getContextPath()%>/images/02.jpg" />Casarte简爱·滴漏式咖啡机<br />积分：3000</td>
			<td height="150px" width="200px"><img
				src="<%=pageContext.getServletContext().getContextPath()%>/images/03.jpg" />Casarte简爱·MINI多士炉<br />积分：3000</td>
		</tr>
		<%
			if (list != null) {
		%>
		<tr align="center">
			<td height="20px"><a
				href="doexchange.jsp?integer=3000&cusnumber=<%=cusnumber%>"><img
					src="<%=pageContext.getServletContext().getContextPath()%>/images/dh.jpg"
					name="img4" /></a></td>
			<td height="20px"><a
				href="doexchange.jsp?integer=3000&cusnumber=<%=cusnumber%>"><img
					src="<%=pageContext.getServletContext().getContextPath()%>/images/dh.jpg"
					name="img5" /></a></td>
			<td height="20px"><a
				href="doexchange.jsp?integer=3000&cusnumber=<%=cusnumber%>"><img
					src="<%=pageContext.getServletContext().getContextPath()%>/images/dh.jpg"
					name="img6" /></a></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>
