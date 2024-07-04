<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title></title>
</head>
<body>
	<nav id="top">
		<div class="container">
			<div class="row">
				<div class="col-xs-6">
					<select class="language">
						<option value="chinese" selected>中文</option>
						<option value="notsupport">其他语言待添加</option>
						
					</select>
					
				</div>
				<div class="col-xs-6">
					<ul class="top-link">
					<li>
				<%-- 	<% 
						User u = (User)session.getAttribute("user");
						if(u!=null){
					
						out.print("欢迎您：" + u.getUser_name()+"&nbsp;&nbsp;&nbsp;");	
						
						
						}else{
					%>
						<a href="account.jsp"> <img width="20px" height="20px" alt="order" src="../images/account.png"  /> &nbsp;我的账户 </a>
					<%	
						}
					%>	 --%>
						</li>
						<li><a href="showOrder.action"><img width="20px" height="20px" alt="order" src="images/order.png"  /> &nbsp;订单</a></li>
						<li><a href="register.action"><img width="20px" height="20px" alt="order" src="images/contactus.png"  /> &nbsp;注册</a></li>
						<li><a href="userLogin.jsp"><img width="20px" height="20px" alt="order" src="images/Admin.png"  /> &nbsp;登陆</a></li>
						<li> 当前用户：${sessionScope.user.username}</li>
						<li> <a href="javascript:if(confirm('确定退出吗？')){location.href='userLogout.action'}" target="_parent">退出</a></li>
						

					</ul>
				</div>
			</div>
		</div>
	</nav>
	<!--Header-->
	<header class="container">
		<div class="row">
			<div class="col-md-4">
				<div id="logo"><img src="images/logo.png" /></div>
			</div>
			<div class="col-md-4">
				<form class="form-search" action="searchname.action" method="post">  
					<input type="text" class="input-medium search-query" name="searchname">  
					<button type="submit" class="btn btn-1"><span class="glyphicon glyphicon-search"></span></button>  
				</form>
			</div>
			<div class="col-md-4">
			
				<div id="cart"><a class="btn btn-1" href="/showcar.action"><span class="glyphicon glyphicon-shopping-cart"></span>购物车</a></div>
			</div>
		</div>
	</header>
	<!--Navigation-->
    <nav id="menu" class="navbar">
		<div class="container">
			<div class="navbar-header"><span id="heading" class="visible-xs">Categories</span>
			  <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
			</div>
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav">
					<li><a href="index.jsp">首页</a></li>
					<s:iterator value="topTypeList">
					<li class="dropdown"><a href="showType.action?pid=<s:property value="id"/>"><s:property value="typename"/></a>
						<div class="dropdown-menu">
							<div class="dropdown-inner">
								<ul class="list-unstyled">
								
								<s:iterator value="navigation">
									<li><a href="showType.action?pid=<s:property value="id"/>"><s:property value="typename"/></a></li>
								</s:iterator>
								</ul>
							</div>
						</div>
					</li>
					</s:iterator>
					<!-- <li class="dropdown"><a href="category.jsp">食</a>
						<div class="dropdown-menu">
							<div class="dropdown-inner">
								<ul class="list-unstyled">
									<li><a href="category.jsp">Dell</a></li>
									<li><a href="category.jsp">Asus</a></li>
									<li><a href="category.jsp">Samsung</a></li>
									<li><a href="category.jsp">Lenovo</a></li>
									<li><a href="category.jsp">Acer</a></li>
								</ul>
							</div> 
						</div>
					</li>
					<li class="dropdown"><a href="category.jsp" >住</a>
						<div class="dropdown-menu" style="margin-left: -203.625px;">
							<div class="dropdown-inner">
								<ul class="list-unstyled">
									<li><a href="listProductById?ptypeid=20">装修公司</a></li>
									<li><a href="category.jsp">云莱装饰</a></li>
									<li><a href="category.jsp">装修材料供应商</a></li>
									<li><a href="category.jsp">四维卫浴</a></li>
									<li><a href="category.jsp">马可波罗瓷砖</a></li>
								</ul>
								<ul class="list-unstyled">
									<li><a href="category.jsp">Nexus</a></li>
									<li><a href="category.jsp">Dell</a></li>
									<li><a href="category.jsp">Oppo</a></li>
									<li><a href="category.jsp">Blackberry</a></li>
									<li><a href="category.jsp">HTC</a></li>
								</ul>
								<ul class="list-unstyled">
									<li><a href="category.jsp">LG</a></li>
									<li><a href="category.jsp">Q-Mobiles</a></li>
									<li><a href="category.jsp">Sony</a></li>
									<li><a href="category.jsp">Wiko</a></li>
									<li><a href="category.jsp">T&T</a></li>
								</ul>
							</div>
						</div>
					</li>
					<li><a href="software.jsp">行</a></li> -->
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>