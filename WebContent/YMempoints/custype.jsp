<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="../YLogin/err.jsp"%>
<%@include file="../YFile/file.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN"
"http://www.w3.org/TR/html4/strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link type="text/css" rel="stylesheet" href="css/remind.css" />
<title></title>
</head>
<link rel="stylesheet" type="text/css"
	href="<%=pageContext.getServletContext().getContextPath()%>/css/currency.css" />
<link rel="stylesheet" type="text/css"
	href="<%=pageContext.getServletContext().getContextPath()%>/css/custype.css" />
<body>
	<div>
		<table class="table_top" align="left">
			<tr>
				<td>当前位置>会员积分制度</td>
				<td align="right"><a href="select.jsp">返回积分查询</a></td>
			</tr>
		</table>
		<table class="table_main center">
			<caption>
				<span class="apan_style">会员积分制度</span>
			</caption>
			<tr class="table_tr">
				<td width="50%" class="table">充值金额</td>
				<td class="table">赠送积分</td>
			</tr>
			<tr class="table_tr">
				<td>单次充值30000元及以上</td>
				<td>2500</td>
			</tr>
			<tr class="table_tr">
				<td>单次充值20000元及以上</td>
				<td>1500</td>
			</tr>
			</tr>
			<tr class="table_tr">
				<td>单次充值12000元及以上</td>
				<td>1000</td>
			</tr>
			</tr>
			<tr class="table_tr">
				<td>单次充值8000元及以上</td>
				<td>600</td>
			<tr class="table_tr">
				<td>单次充值5000元及以上</td>
				<td>300</td>
			<tr class="table_tr">
				<td>单次充值2000元及以上</td>
				<td>100</td>
			</tr>
			<tr class="table_tr">
				<td>单次充值小于2000</td>
				<td>充值金额*0.01</td>
			</tr>
		</table>
	</div>
</body>
</html>
