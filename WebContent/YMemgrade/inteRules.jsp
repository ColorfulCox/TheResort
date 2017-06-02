<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="err.jsp"%>
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
	<table width="95%">
		<tr>
			<td align="left">当前位置>会员等级制度</td>
			<td align="center"><a href="inteRules.jsp">返回</a></td>
		</tr>
	</table>
	<div class="intediv">
		<table class="intetable">
			<tr class="intetr">
				<td colspan="2" class="intetd"><span
					style="font-size: 28px; color: red">等级制度</span></td>
			</tr>
			<tr class="intetr">
				<td class="intetd" align="center">会员级别</td>
				<td align="center">消费优惠</td>
			</tr>
			<tr class="intetr">
				<td class="intetd">钻石</td>
				<td align="center">钻石会员单次消费满5000元即可享受<span><font
						color="#ff0000" size="5px">六折</font></span>优惠
				</td>
			</tr>
			<tr class="intetr">
				<td class="intetd">白金</td>
				<td align="center">白金会员单次消费满5000元即可享受<span><font
						color="#ff0000" size="5px">七折</font></span>优惠
				</td>
			</tr>
			<tr class="intetr">
				<td class="intetd">黄金</td>
				<td align="center">黄金会员单次消费满5000元即可享受<span><font
						color="#ff0000" size="5px">八折</font></span>优惠
				</td>
			</tr>
			<tr class="intetr">
				<td class="intetd" align="center">白银</td>
				<td align="center">白银会员单次消费满5000元即可享受<span><font
						color="#ff0000" size="5px">九折</font></span>优惠
				</td>
			</tr>
			<tr class="intetr">
				<td class="intetd">普通用户</td>
				<td align="center">单次最低消费5000元即可享受<span><font
						color="#ff0000" size="5px">九五折</font></span>优惠
				</td>
			</tr>
		</table>
	</div>
</body>
</html>