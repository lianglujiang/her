<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>XFCMS管理中心登陆</title>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/admin/login.css" type="text/css" rel="stylesheet" />
<script src="js/admin/jquery-1.4.2.min.js"></script>
<script src="js/admin/login.js"></script>
<script type="text/javascript">
	
</script>

</head>

<body onload="document.forms[0].reset()" >
	<table cellspacing="0" cellpadding="0" width="100%" bgcolor="#002779"
		border=0 style="margin-top:100px" align="center">
		<tr>
			<td align="center">
				<table cellspacing=0 cellpadding=0 width=468 border=0 align="center">
					<tr>
						<td><img height=23 src="images/admin/login_1.jpg" width="468" />
						</TD>
					</tr>
					<tr>
						<TD><img height=147 src="images/admin/login_2.jpg" width=468 />
						</TD>
					</tr>
				</TABLE>
				<TABLE cellSpacing=0 cellPadding=0 width=468 bgColor=#ffffff
					border=0 align="center">
					<tr>
						<TD width=16><IMG height=122 src="images/admin/login_3.jpg"
							width=16>
						</TD>
						<td align="center">
							<form onsubmit="return false;" action="chklogin.action" method="post"
								id="form_login">
								<table width=366 border=0 align="center" cellPadding=0
									cellSpacing=0>

									<tr>
										<TD width="50" height="30">用户名：</TD>
										<TD width="150" align="left"><input name="username"
											id="username" class="input" maxlength="10" />
											<br/><font color="red">${message}</font>
										</TD>

										<TD width="166" align="left"><span id="error_name"
											style="color:#FF0000;"></span>
										</td>
									</tr>
									<tr>
										<TD width="50" height="30">口 令：</TD>
										<TD align="left"><input type="password" name="password"
											id="password" class="input" maxlength="10" />
										</TD>
										<TD width="166" align="left"><span id="error_pass"
											style="color:#FF0000;"></span>
										</TD>
									</tr>
									<tr height=28>
										<TD width="50">验证码：</TD>
										<TD height="26" colspan="2" align="left" valign="middle">
											<input name="verifyCode" id="verifyCode" class="input_verify" />
											<img id="imgCode" onclick="reflashCode()"
											src="verifycode.action" align="absbottom"
											style="cursor:pointer;">&nbsp;&nbsp;&nbsp;<span
											id="error_verify" style="color:#FF0000;"></span>
											<font color="red">${error}</font>
										</TD>
									</tr>
									<tr height=5>
										<TD colSpan=3></TD>
									</tr>
									<tr>
										<TD width="50">&nbsp;</TD>
										<TD colspan="2" align="left"
											style="padding-left:0px;!important padding-left:4px;"><input
											type="submit" class="button" value="进入管理中心" id="enter" />
										</TD>
									</tr>

								</TABLE>
							</FORM></TD>
						<TD width=16><IMG height=122 src="images/admin/login_4.jpg"
							width=16>
						</TD>
					</tr>
				</TABLE>
				<TABLE cellSpacing=0 cellPadding=0 width=468 border=0 align="center">
					<tr>
						<TD><IMG height=16 src="images/admin/login_5.jpg" width=468>
						</TD>
					</tr>
				</TABLE>
			</TD>
		</tr>
	</TABLE>
</BODY>
</HTML>
