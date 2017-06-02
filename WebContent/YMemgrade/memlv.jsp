<%@page import="cn.sendto.service.CustomerService"%>
<%@page import="cn.sendto.rowmapper.impl.CustomerRowMapper"%>
<%@page import="cn.sendto.rowmapper.IRowMapper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cn.sendto.model.Member"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page import="cn.sendto.dbhelper.ConnectionManager"%>
<%@page import="cn.sendto.model.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="../YLogin/err.jsp"%>
<%@include file="../YFile/file.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="<%=pageContext.getServletContext().getContextPath()%>/css/inte.css">
<title>Insert title here</title>
</head>
<body>
	<%
		//编码
		request.setCharacterEncoding("UTF-8");
		String memtype = request.getParameter("memtype");
	%>
	<div class="memdiv">
		<table class="memtable">
			<tr class="memtr">
				<td colspan="7"><span style="font-size: 28px; color: red">会员等级查询</span></td>
			</tr>
			<tr class="memtr">
				<td colspan="7" align="left">
					<form action="memlv.jsp" method="post">
						会员卡号： <input type="text" name="memtype" /> <input type="submit"
							value="查询" style="width: 50px; color: blue;" />
					</form>
				</td>
			</tr>
			<tr class="memtr">
				<td class="memtd">会员卡号</td>
				<td class="memtd">顾客姓名</td>
				<td class="memtd">会员类型</td>
				<td class="memtd">电话</td>
				<td class="memtd">地址</td>
				<td class="memtd">备注</td>
			</tr>
			<%
				CustomerService remi = new CustomerService();
				List<Customer> list2 = remi.Reminder();
				for (int i = 0; i < list2.size(); i++) {
					String mtype = "";
					int metype = list2.get(i).getMemid();
					if (metype == 1) {
						mtype = "钻石";
					}
					if (metype == 2) {
						mtype = "白金";
					}
					if (metype == 3) {
						mtype = "黄金";
					}
					if (metype == 4) {
						mtype = "白银";
					}
					if (metype == 5) {
						mtype = "非会员";
					}
					if (memtype != null) {
						if (list2.get(i).getCusnumber().equals(memtype)) {
			%>
			<tr class="memtr">
				<td class="memtd"><%=list2.get(i).getCusnumber()%></td>
				<td class="memtd"><%=list2.get(i).getCusname()%></td>
				<td class="memtd"><%=mtype%></td>
				<td class="memtd"><%=list2.get(i).getTel()%></td>
				<td class="memtd"><%=list2.get(i).getAddress()%></td>
				<td class="memtd"><%=list2.get(i).getDemo1()%></td>
			</tr>
			<%
				}
					}
					if (memtype == null || memtype.equals("")) {
			%>
			<tr class="memtr">
				<td class="memtd"><%=list2.get(i).getCusnumber()%></td>
				<td class="memtd"><%=list2.get(i).getCusname()%></td>
				<td class="memtd"><%=mtype%></td>
				<td class="memtd"><%=list2.get(i).getTel()%></td>
				<td class="memtd"><%=list2.get(i).getAddress()%></td>
				<td class="memtd"><%=list2.get(i).getDemo1()%></td>
			</tr>
			<%
				}
				}
			%>
		</table>
	</div>
</body>
</html>