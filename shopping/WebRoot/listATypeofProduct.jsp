<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'listProduct.jsp' starting page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<link rel="stylesheet" href="css/font/bootstrap.min.css"  type="text/css">
	<link rel="stylesheet" href="css/font/style.css">
	<link rel="stylesheet" href="css/font-awesome/css/font-awesome.min.css"  type="text/css">
	<link rel="stylesheet" href="css/fonts/font-slider.css" type="text/css">
	<script src="js/jquery-2.1.1.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script type="text/javascript">
	function deleteOrder(id) {
		location.href = "deleteById?productid=" + id;
	}
	</script>
	<style type="text/css">
		
	</style>
  </head>
  
  <body>
  <jsp:include page="top.jsp"></jsp:include>
  
  
<%--   <s:iterator value="elist">
      <li>
        <p class="img"><a href="showgoods.action?id=${id}"><img src="<s:property value="goodspic"/>" alt="${goodsname}"/></a></p>
        <p class="name"><a href="showgoods.action?id=${id}" title="${goodsname}"><s:property value="goodsname"/></a></p>
        <p class="price">  ${price}  </p>
        <s:property value="goodspic"/>
       
      </li>
  
      </s:iterator> --%>
  
  
  
    <%--  <s:iterator value="elist" > --%>
    	<%-- <s:property value="id" />
    	<s:property value="typename" /> --%>
    	
		<div id="page-content" class="home-page" >
			<div class="container" >

				<div class="row" >
					<div class="col-lg-12" >
						<%-- <div class="heading">
							<h2><s:property value="goodstype.typename" /></h2>
						</div> --%>
						 
						<s:iterator value="elist" status="status1" >
						<s:if test="((status1.index)%3)==0"></s:if>
						<s:if test="status1.index==0"></s:if>
						<!-- style="float: left ;width: 50% ;" -->
						<div class="products"  >
							<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" >
								<div class="product" >
									<!-- 显示图片 -->
									<div class="image">
										<a href="showgoods.action?id=${id}">
										<img border="0" src=<s:property value="goodspic" /> ></a>
									</div>
									<div class="buttons">
										<a class="btn cart"
											href="showgoods.action?id=${id}"><span
											class="glyphicon glyphicon-shopping-cart"></span></a>

									</div>
									<div class="caption">
										<div class="name">
											<h3>
												<a href="showgoods.action?id=${id}"><s:property value="goodsname" /></a>
											</h3>
										</div>
										<div class="price">
											<s:property value="price" /><span>原价:￥2399</span>
										</div>
										<div class="rating">
											<span class="glyphicon glyphicon-star"></span><span
												class="glyphicon glyphicon-star"></span><span
												class="glyphicon glyphicon-star"></span><span
												class="glyphicon glyphicon-star"></span><span
												class="glyphicon glyphicon-star-empty"></span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<s:if test=" ((status1.index)%3)==0"></s:if>
						</s:iterator>
					</div>
				</div>
			</div>
		</div>
	<%-- </s:iterator> --%>
  </body>
</html>
