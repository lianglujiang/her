<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userLogin.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="js/admin/jquery-1.4.2.min.js"></script>
	<script src="js/admin/login.js"></script>
  </head>
  
  <body>
   <form action="userLogin.action" method="post">
	<table cellpadding=3 cellspacing=1 align=center class=tableborder1 >
		<tr>
			<td valign=middle colspan=2 align=center height=25 background="images/bg2.gif" >
				
				<font color="white"><b>输入您的用户名、密码登录</b></font>
				<br/><font color="red">${请先登录}</font>
			</td>
			
		</tr>
		
		<tr>
		
		<td valign=middle class=tablebody1>请输入您的用户名</td>
			<td valign=middle class=tablebody1><INPUT name="username" type=text>

				<br>
				<br>
			</td>
		</tr>
		<tr>
			<td valign=middle class=tablebody1>请输入您的密码</td>
			<td valign=middle class=tablebody1>
				<INPUT name="password" type=password> 
				<br>
				<br>
			</td>
		</tr>
		<tr>
			<td valign=middle class=tablebody1>请输入验证码</td>
			<td valign=middle class=tablebody1>
				<input name="verifyCode" id="verifyCode" class="input_verify" />
											<img id="imgCode" onclick="reflashCode()"
											src="verifycode.action" align="absbottom"
											style="cursor:pointer;">&nbsp;&nbsp;&nbsp;<span
											id="error_verify" style="color:#FF0000;"></span>
			</td>
			
		</tr>
		
		
		
		<tr>
			<td class=tablebody2 valign=middle colspan=2 align=center>
				<input type="submit" value="登 录">
			</td>
		</tr>
	</table>
</form>
  </body>
</html>
