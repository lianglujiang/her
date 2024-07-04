<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'list.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/admin/general.css" />
<script src="/js/admin/table.js"></script>
</head>

<body>
	<div class="top">&nbsp;商品列表</div>
	<div class="main">
		<table width="98%" cellpadding="2" border="0" cellspacing="2" align="center">
		<tr>
			<th>id</th>
			<th>用户</th>
			<th>商品名称</th>
			<th>购买时间</th>
			<th>购买数量</th>
			<th>发货状态</th>
			<th>操作</th>
		</tr>
			<s:iterator value="orderList">
			<tr>
				<td><s:property value="id"/></td>
				<td>
					<s:property value="user.username"/>
				</td>
				<td>
					<a href="#"><s:property value="goods.goodsname"/></a>
				</td>
				<td><s:property value="buytime"/></td>
				<td><s:property value="total"/></td>
				<td><s:property value="status"/></td>
				<td><a href="orderState.action?orderid=<s:property value="id"/>">发货</a></td>
			</tr>
			</s:iterator>
		</table>
		<div style="text-align:center;">
		<%-- <a href="goods.action?currentPage=1">首页</a> <a href="goods.action?currentPage=${currentPage-1}">上一页</a> <a href="goods.action?currentPage=${currentPage+1}">下一页</a> <a href="goods.action?currentPage=${totalPage}">尾页</a>  
		共${totalPage}页数 当前${currentPage}页 <s:iterator begin="1" end="totalPage" status="st"> &nbsp;<s:property value="#st.index+1"/></s:iterator></div>
	</div>
	<div class="footer"><jsp:include page="/admin/copyright.inc"/></div> --%>
</body>
</html>
