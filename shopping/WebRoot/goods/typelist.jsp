<%@ page language="java" import="java.util.*,java.text.SimpleDateFormat" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html public "-//w3c//dtd xhtml 1.0 transitional//en" "http://www.w3.org/tr/xhtml1/dtd/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<link rel="stylesheet" type="text/css" href="css/admin/general.css" />
<script src="js/admin/table.js"></script>

<script type="text/javascript">
/* 	function deleteProduct(id) {
		location.href = "deleteGoodsById.action?id=" + id;
	}
	
	function updateProduct(id) {
		location.href = "findProductById.action?id=" + id;
	}
	 */
</script>

</head>

<body>
<div class="top">商品列表</div>
<div class="main">
<table width="100%" border="0" cellpadding="2" cellspacing="2">
<tr>
	<th>商品编号</th>
	<th>商品类别</th>
	
	<th>操作</th>
</tr>
<s:iterator value="gtlist"  status='st'>
    	<input type="hidden" value="id"/>
    	<tr>
    	<td><input type="checkbox" id="cb<s:property value='#st.index'/>"/><s:property value="#st.index+1" /></td>
    	<%-- <td><img src='<s:property value="goodspic" />' width="100"  height="100"/></td>
   		<td><s:property value="goodsname"/></td> --%>
   		<td><s:property value="typename"/></td>
   		<%-- <td><s:property value="price"/></td>
   		<td><s:property value="count"/></td> --%>
   		
   		
   		<td><input type="button" value="修改" onclick="updateProduct('<s:property value="id" />')"> 
   		<input type="button" value="删除" onclick="deleteProduct('<s:property value="id" />')"></td>
   		<!-- <td><a href="updategoods.action?id="<s:property value="id"/>>修改</a> <a href="">删除</a></td> -->
   		</tr>
 </s:iterator>
</table>

</div>
<div class="footer">
<jsp:include page="/admin/copyright.inc" ></jsp:include>
</div>
</body>
</html>
