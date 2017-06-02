<%@page import="cn.sendto.model.Customer"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="../YLogin/err.jsp"%>
<%@include file="../YFile/file.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css"
	href="<%=pageContext.getServletContext().getContextPath()%>/css/inte.css" />
<title>会员充值</title>
</head>
<body>
	<table width="90%">
		<tr>
			<td>当前位置>会员充值</td>
			<td align="right"><a href="../YMemment/user_list.jsp">返回用户列表</a></td>
		</tr>
	</table>
	<%
		//设置编码格式
		request.setCharacterEncoding("UTF-8");
	%>
	<div class="rediv">
		<form action="doRecharge.jsp" method="post">
			<table>
				<tr>
					<td colspan="2" width="500px" height="70px" align="center"><span
						style="font-size: 28px; color: red;">充值界面</span></td>
				</tr>
				<tr>
					<td colspan="2" width="500px" height="20px" align="center"><span
						style="font-size: 12px; color: red;"> <%
 	if (request.getAttribute("cus") != null) {
 		out.print(request.getAttribute("cus").toString());
 	}
 %>
					</span></td>
				</tr>
				<tr>
					<td height="100px" width="160px" align="right">会员卡号：</td>
					<td><input type="text" name="cusnumber" required="required"
						placeholder="请输入卡号" class="reinput"></td>
				</tr>
				<tr>
					<td height="100px" align="right">充值金额：</td>
					<td><input type="text" name="credit" required="required"
						placeholder="请输入充值金额" class="reinput"></td>
				</tr>
				<tr>
					<td colspan="2" height="85px" align="center"><input
						type="submit" name="resubmit" value="充值" class="resubmit"></td>
				</tr>

			</table>
		</form>
	</div>
</body>
</html>
