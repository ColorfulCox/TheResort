<%@page import="cn.sendto.service.CustomerService"%>
<%@page import="cn.sendtu.util.DateUtil"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="cn.sendto.model.Customer"%>
<%@page import="cn.sendto.model.Proscenium"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../YFile/file.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>生日提醒</title>
<link rel="stylesheet" type="text/css"
	href="<%=pageContext.getServletContext().getContextPath()%>/css/remind.css">
<link rel="stylesheet" type="text/css"
	href="<%=pageContext.getServletContext().getContextPath()%>/css/currency.css">
</head>
<body>
	<div>
		<table class="table_top" align="left">
			<tr>
				<td>当前位置>生日提醒</td>
			</tr>
		</table>

		<table class="table_main" cellpadding="1">
			<caption>
				<span class="apan_style">近期7天客户生日提醒</span>
			</caption>
			<tr>
				<th class="table">姓名</th>
				<th class="table">性别</th>
				<th class="table">生日</th>
				<th class="table">年龄</th>
				<th class="table">电话</th>
				<th class="table">住址</th>
				<th class="table">备注</th>
			</tr>
			<%
				request.setCharacterEncoding("UTF-8");
				CustomerService dor = new CustomerService();
				List<Customer> list = dor.BirReminder();

				if (list != null) {
					SimpleDateFormat myFormatter = new SimpleDateFormat("MM月dd日");
					for (int i = 0; i < list.size(); i++) {
			%>
			<tr class="table_bottom">
				<td class="table_td"><%=list.get(i).getCusname()%></td>
				<td class="table_td"><%=list.get(i).getCussex()%></td>
				<td class="table_td table_bir"><%=myFormatter.format(list.get(i).getBirthday())%></td>
				<td class="table_td"><%=list.get(i).getCusage()%></td>
				<td class="table_td"><%=list.get(i).getTel()%></td>
				<td class="table_td"><%=list.get(i).getAddress()%></td>
				<td class="table_td"><%=list.get(i).getDemo1()%></td>
			</tr>

			<%
				}
				}
			%>
		</table>
		<br>
		<br>
		<br>
		<br>
		<br>
		<table class="table_main">
			<tr>
				<td colspan="2" class="table" colspan="2" align="center">会员生日特权</td>
				<td rowspan="5" width="100px"><img
					src="<%=pageContext.getServletContext().getContextPath()%>/images/birthday.jpg"
					width="100%" height="165px" /></td>
			</tr>
			<tr>
				<td class="table_td" width="150px" align="center">特权一</td>
				<td class="table_td2" width="200px" align="center">充值获取三倍积分</td>
			</tr>
			<tr>
				<td class="table_td" align="center">特权二</td>
				<td class="table_td2" align="center">精美生日蛋糕</td>
			</tr>
			<tr>
				<td class="table_td" align="center">特权三</td>
				<td class="table_td2" align="center">免费提供生日庆祝场所</td>
			</tr>
			<tr>
				<td class="table_td" s align="center">特权四</td>
				<td class="table_td2" align="center">生日当天所有消费五折</td>
			</tr>
		</table>
	</div>
</body>
</html>