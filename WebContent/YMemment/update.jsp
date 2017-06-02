<%@page import="cn.sendto.service.CustomerService"%>
<%@page import="cn.sendto.model.Customer"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="../YLogin/err.jsp"%>
<%-- <%@include file="../YFile/file.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//编码
		request.setCharacterEncoding("UTF-8");
		String memtype = request.getParameter("cusnumber");
	%>
	<div>
		<form action="doUpdate.jsp" method="post">
			<table align="center">
				<caption>
					<h1>修改会员信息</h1>
				</caption>
				<%
					CustomerService dro = new CustomerService();
					List<Customer> list = dro.cusnumber(memtype);
					if (list != null && list.size() > 0) {
				%>
				<tr>
					<td width="100px">会员卡号：</td>
					<td><input readonly="readonly" autofocus="autofocus"
						type="number" name="cusnumber" value="<%=memtype%>" /></td>
				</tr>
				<tr>
					<td>会员姓名：</td>
					<td><input type="text" name="cusname"
						value="<%=list.get(0).getCusname()%>" /></td>
				</tr>
				<tr>
					<td>性别：</td>
					<td><input type="radio" name="cussex"
						<%=list.get(0).getCussex() == '男' ? "checked=\"checked\"" : " "%>
						value="男" />男 <input type="radio" name="cussex"
						<%=list.get(0).getCussex() == '女' ? "checked=\"checked\"" : " "%>
						value="女" />女</td>
				</tr>
				<tr>
					<td>联系电话：</td>
					<td><input type="text" name="tel"
						value="<%=list.get(0).getTel()%>" pattern="1[3|5|8|7][0-9]{9}" /></td>
				</tr>
				<tr>
					<td>会员生日：</td>
					<td><input type="date" name="birthday"
						value="<%=list.get(0).getBirthday()%>" /></td>
				</tr>
				<tr>
					<td>身份证号：</td>
					<td><input type="text" name="idcard"
						value="<%=list.get(0).getIdcard()%>"
						pattern="[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)" /></td>
				</tr>
				<tr>
					<td>住址：</td>
					<td><input type="text" name="address"
						value="<%=list.get(0).getAddress()%>" /></td>
				</tr>
				<tr>
					<td>备注：</td>
					<td><textarea rows="3" cols="17" name="demo1"><%=list.get(0).getDemo1()%></textarea>
						<!--  <input type="text" name="demo1"  value="<%--=list.get(0).getDemo1() --%>"/></td>-->
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="reset" name="reset" value="重置" />&nbsp;&nbsp;
						<input type="submit" name="submit" value="确认修改" /></td>
				</tr>
				<%
					}
				%>
			</table>

		</form>
	</div>
</body>
</html>