<%@page import="java.util.Date"%>
<%@page import="cn.sendto.service.CustomerService"%>
<%@page import="cn.sendtu.util.DateUtil"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="cn.sendto.model.Customer"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="../YLogin/err.jsp"%>
<%@include file="../YFile/file.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>用户列表</title>
<link rel="stylesheet" type="text/css"
	href="<%=pageContext.getServletContext().getContextPath()%>/css/currency.css">
<link rel="stylesheet" type="text/css"
	href="<%=pageContext.getServletContext().getContextPath()%>/css/user_list.css">
<style type="text/css">
table {
	margin: 0 auto;
}

.width {
	width: 100px;
}
</style>
</head>
<%
	//编码
	request.setCharacterEncoding("UTF-8");
	String memtype = request.getParameter("memtype");
	SimpleDateFormat myFormatter = new SimpleDateFormat("MM月dd日");
	if (memtype == null) {
		memtype = "";
	}
%>
<body>
	<form action="user_list.jsp" method="post">
		<div>
			<table class="table_top" align="left">
				<tr>
					<td>当前位置>会员列表</td>
					<td align="right"><a href="user.jsp">忘记卡号</a></td>
				</tr>
				<tr>
					<td colspan="2" align="center" class="apan_style">会员信息查询</td>
				</tr>
			</table>
		</div>
		<table width="80%">
			<tr>
				<td>会员卡号： <input type="text" name="memtype"
					value="<%=memtype%>" /> <input type="submit" value="查询" /></td>
				<td class="red">
					<%
						if (request.getAttribute("info") != null) {
							out.print(request.getAttribute("info").toString());
						}
					%>
				</td>
				<td align="right"><a href="insert.jsp"> <img
						src="<%=pageContext.getServletContext().getContextPath()%>/images/add.gif">添加新用户
				</a></td>
			</tr>
		</table>
		<table class="table_main" width="90%" ; cellspacing="1"
			cellpadding="0">
			<tr class="tr_a"height: 30px;>
				<th class="table">卡号</th>
				<th class="table">用户名</th>
				<th class="table">性别</th>
				<th class="table">电话</th>
				<th class="table">生日</th>
				<th class="table">身份证号</th>
				<th class="table">地址</th>
				<th class="table">备注</th>
				<th class="table" width="50px">修改</th>
				<th class="table" width="50px">删除</th>
			</tr>
			<%
				CustomerService dro = new CustomerService();
				List<Customer> list = dro.Reminder();
				for (int i = 0; i < list.size(); i++) {
					boolean isPaly = DateUtil.compare(list.get(i).getBirthday());
					if (memtype != null) {
						if (list.get(i).getCusnumber().equals(memtype)) {
			%>
			<tr class="tr_b">
				<td align="center"><%=list.get(i).getCusnumber()%></td>
				<td align="center"><%=list.get(i).getCusname()%></td>
				<td align="center"><%=list.get(i).getCussex()%></td>
				<td align="center"><%=list.get(i).getTel()%></td>
				<td align="center" <%=isPaly ? "class=\"table_bir\"" : ""%>><%=myFormatter.format(list.get(i).getBirthday())%></td>
				<td align="center"><%=list.get(i).getIdcard()%></td>
				<td align="center"><%=list.get(i).getAddress()%></td>
				<td align="center"><%=list.get(i).getDemo1()%></td>
				<td align="center"><a
					href="Update.jsp?cusnumber=<%=list.get(i).getCusnumber()%>"><img
						src="<%=pageContext.getServletContext().getContextPath()%>/images/1.jpg"
						name="" /></a></td>
				<td align="center" onclick='return confirm("确定要删除此用户信息吗？")'><a
					href="delete.jsp?cusnumber=<%=list.get(i).getCusnumber()%>"><img
						src="<%=pageContext.getServletContext().getContextPath()%>/images/delimg.jpg"
						name="" /></a></td>
			</tr>
			<%
				}
					}
					if (memtype == null || memtype.equals("")) {
			%>
			<tr class="tr_b">
				<td align="center"><%=list.get(i).getCusnumber()%></td>
				<td align="center"><%=list.get(i).getCusname()%></td>
				<td align="center"><%=list.get(i).getCussex()%></td>
				<td align="center"><%=list.get(i).getTel()%></td>
				<td align="center" <%=isPaly ? "class=\"table_bir\"" : ""%>><%=myFormatter.format(list.get(i).getBirthday())%></td>
				<td align="center"><%=list.get(i).getIdcard()%></td>
				<td align="center"><%=list.get(i).getAddress()%></td>
				<td align="center"><%=list.get(i).getDemo1()%></td>
				<td align="center"><a
					href="update.jsp?cusnumber=<%=list.get(i).getCusnumber()%>"><img
						src="<%=pageContext.getServletContext().getContextPath()%>/images/1.jpg"
						name="" /></a></td>
				<td align="center" onclick='return confirm("确定要删除此用户信息吗？")'><a
					href="delete.jsp?cusnumber=<%=list.get(i).getCusnumber()%>"><img
						src="<%=pageContext.getServletContext().getContextPath()%>/images/delimg.jpg"
						name="" /></a></td>
			</tr>
			<%
				}
				}
			%>
		</table>
	</form>
</body>

</html>