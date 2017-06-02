<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="err.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>登陆页面</title>
</head>
<link type="text/css" rel="stylesheet"
	href="<%=pageContext.getServletContext().getContextPath()%>/css/login.css" />

<body>
	<%
		Cookie[] userCookies = request.getCookies();
		String isLogin = "";
		if (userCookies != null) {
			for (int i = 0; i < userCookies.length; i++) {
				if (userCookies[i].getName().equals("userName")) {
					isLogin = userCookies[i].getValue();
					break;
				}
			}
		}
	%>
	<div class="div">
		<form
			action="<%=pageContext.getServletContext().getContextPath()%>/Ydo/dologin.jsp"
			method="post">

			<table class="tablecenter" border="0">
				<tr>
					<td colspan="3" align="center" valign="bottom" class="font">云创度假村管理系统<br />
					</td>

				</tr>
				<tr>
					<td colspan="3" height="10px">
						<hr style="border: 1px dashed royalblue;">
					</td>

				</tr>
				<tr>
					<td colspan="3" height="14px"
						style="font-size: 12px; color: red; text-align: center;">
						<%
							request.setCharacterEncoding("UTF-8");
							if (request.getAttribute("info") != null) {
								out.print(request.getAttribute("info").toString());
							}
						%>
					</td>
				</tr>
				<tr>
					<td align="right" height="35px" class="txt">用户名：</td>
					<td colspan="2"><input type="text" name="username"
						class="inputusername inp"
						value="<%=isLogin%><%if (request.getAttribute("user") != null) {
				String s = request.getAttribute("user").toString();
				out.print(s);
			}%>" /></td>
				</tr>
				<tr>
					<td align="right" height="35px" class="txt">密&nbsp;&nbsp;&nbsp;码：</td>
					<td colspan="2"><input type="password" name="userpass"
						class="inputpassword inp" /></td>
				</tr>
				<tr>
					<td align="center" height="35px" class="txt12"></td>
					<td width="20px"><input type="checkbox" name="userbox"
						<%=(isLogin.equals("")) ? " " : "checked=\"checked\""%>
						value="yes" /></td>
					<td align="left">记住用户</td>
				</tr>
				<tr>
					<td colspan="3" align="center"><input type="image"
						src="<%=pageContext.getServletContext().getContextPath()%>/images/denglu.gif" /></td>
				</tr>
			</table>

		</form>
	</div>
</body>

</html>