<%@page import="cn.sendto.service.CustomerService"%>
<%@page import="cn.sendto.model.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="cn.sendto.dbhelper.DbHelper"%>
<%@page import="java.sql.Connection"%>
<%@page import="cn.sendto.dbhelper.ConnectionManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="../YLogin/err.jsp"%>
<%@include file="../YFile/file.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=pageContext.getServletContext().getContextPath()%>/css/inte.css" />
<title>会员充值</title>
</head>
<body>
	<table width="90%">
		<tr>
			<td>当前位置>会员充值</td>
		</tr>
	</table>
	<%
		//设置编码格式
		request.setCharacterEncoding("UTF-8");
		//获取表单数据
		//卡号
		String cusnumber = request.getParameter("cusnumber");
		//充值金额
		String credit = request.getParameter("credit");
		//判断数据有效性
		// -|查询卡号是否存在
		//如果存在就卡的信息返回回来
		//前一个页面的充值金额要获取到，填写到充值栏（可修改）
		CustomerService cus = new CustomerService();
		//充值奖励积分
		int integral = cus.points(credit);
		List<Customer> list = cus.cusnumber(cusnumber);
		if (list == null) {
			request.setAttribute("cus", "卡号不存在");
			request.getRequestDispatcher("recharge.jsp").forward(request, response);
			return;
		} else if (list != null) {
			credit = String.valueOf(list.get(0).getBalance() + Double.parseDouble(credit));
			integral = list.get(0).getIntegral() + integral;
	%>
	<form action="doRech.jsp" method="post">
		<div class="dorediv">
			<table class="doretable">
				<tr class="doretr">
					<td colspan="2"><span style="font-size: 28px; color: red">用户信息确认</span></td>
				</tr>
				<tr class="doretr">
					<td class="doretd">会 员 卡号：</td>
					<td><input type="text" readonly="readonly" class="text"
						name="cusnumber" value="<%=list.get(0).getCusnumber()%>"></td>
				</tr>
				<tr class="doretr">
					<td class="doretd">顾 客 姓名：</td>
					<td><%=list.get(0).getCusname()%></td>
				</tr>
				<tr class="doretr">
					<td class="doretd">顾 客 电话：</td>
					<td><%=list.get(0).getTel()%></td>
				<tr class="doretr">
					<td class="doretd">余&nbsp;&nbsp;&nbsp;额：</td>
					<td><%=list.get(0).getBalance()%></td>
				</tr>
				<tr class="doretr">
					<td class="doretd">积&nbsp;&nbsp;&nbsp;分：</td>
					<td><%=list.get(0).getIntegral()%></td>
				</tr>
				<tr class="doretr">
					<td class="doretd">充值后余额：</td>
					<td><input type="text" readonly="readonly" class="text"
						name="balance" value="<%=credit%>"></td>
				</tr>
				<tr class="doretr">
					<td class="doretd">充值后积分：</td>
					<td><input type="text" readonly="readonly" class="text"
						name="integral" value="<%=integral%>"></td>
				<tr class="doretr">
					<td colspan="2"><input type="submit" name="doresnumber"
						value="确认充值" class="resubmit"></td>
				</tr>
			</table>
		</div>
	</form>
	<%
		}
	%>
</body>
</html>