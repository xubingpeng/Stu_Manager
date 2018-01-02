<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>管理员登录</title>
<meta charset="utf-8">
</head>
<body>
	<form action="login?method=login" method="post">
		<table align="center" border="0" width="300px">
			<h1 align="center">管理员登录</h1>
			<tr>
				<td>用户名：</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>密 码：</td>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<td colspan="2" align="center" height="50"><input type="submit"
					value="登录"> <input type="reset" value="重置"></td>
			</tr>
			<tr>
				<td colspan="2" align="center" height="50"><font color="red">${error }</font>

				</td>
			</tr>
		</table>
		</form>
</body>
</html>
