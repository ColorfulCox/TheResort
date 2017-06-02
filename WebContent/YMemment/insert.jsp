<%@page import="cn.sendto.service.MemberserService"%>
<%@page import="cn.sendto.model.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="../YLogin/err.jsp"%>
<%@include file="../YFile/file.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>添加会员</title>
<link rel="stylesheet" type="text/css"
	href="<%=pageContext.getServletContext().getContextPath()%>/css/insert.css">
<link rel="stylesheet" type="text/css"
	href="<%=pageContext.getServletContext().getContextPath()%>/css/currency.css">
</head>
<body>
	<div>
		<table class="table_top" align="left">
			<tr>
				<td>当前位置>添加会员</td>
				<td align="right"><a href="user_list.jsp">返回会员列表</a></td>
			</tr>
			<tr>
				<td colspan="2" height="50px"></td>
			</tr>
		</table>
		<form action="doinsert.jsp" method="post">
			<table class="table_in">
				<tr>
					<td colspan="2" align="center"
						style="font-size: 25px; font-weight: bold;">添加会员信息</td>
				</tr>
				<tr>
					<td align="center" colspan="2" class="red" height="20px">
						<%
							if (request.getAttribute("info") != null) {
								out.print(request.getAttribute("info").toString());
							}
						%>
					</td>
				</tr>
				<tr>
					<td height="30px">会员类型：</td>
					<td><select name="memid" class="select">
							<%
								//编码
								request.setCharacterEncoding("UTF-8");
								MemberserService mem = new MemberserService();
								List<Member> list = mem.Reminder();
								for (int i = 0; i < list.size(); i++) {
									out.print("<option value=\"" + list.get(i).getMemid() + "\">" + list.get(i).getMemtype());
								}
							%>
					</select></td>
				</tr>

				<tr>
					<td height="30px">会员卡号：</td>
					<td><input type="number" required="required"
						placeholder="请输入卡号" name="cusnumber" /></td>
				</tr>
				<tr>
					<td>姓&nbsp;&nbsp;名：</td>
					<td><input type="text" required="required" placeholder="请输入姓名"
						name="cusname" /></td>
				</tr>
				<tr>
					<td>性&nbsp;&nbsp;别：</td>
					<td><input type="radio" name="cussex" checked="checked"
						value="男" />男 <input type="radio" name="cussex" value="女" />女</td>
				</tr>
				<tr>
					<td>联系电话：</td>
					<td><input type="text" required="required" placeholder="请输入电话"
						name="tel" pattern="1[3|5|8|7][0-9]{9}" /></td>
				</tr>
				<tr>
					<td>会员生日：</td>
					<td width="170px"><input type="date" required="required"
						name="birthday" class="birthday" /></td>
				</tr>
				<tr>
					<td>身份证号：</td>
					<td><input type="text" required="required"
						placeholder="请输入身份证号" name="idcard"
						pattern="[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)" />
					</td>
				</tr>
				<tr>
					<td>住&nbsp;&nbsp;址：</td>
					<td><input type="text" required="required" placeholder="请输入住址"
						name="address" /></td>
				</tr>
				<tr>
					<td>备&nbsp;&nbsp;注：</td>
					<td><input type="text" name="demo1" /></td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						name="submit" value="确认添加" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>