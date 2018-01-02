<%@ page language="java"
	import="java.util.*,com.jxd.stu.po.*,com.jxd.stu.dao.*,com.jxd.stu.dao.impl.*"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>My JSP 'main.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript"
	src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript">
	function del() {
		var con = window.confirm("确定删除吗");
		return con;
	}
	function submitFrom(path) {
		$('form1').action = path;
		$('form1').submit();
	}
	var isCheckAll = false;
	function swapCheck() {
		if (isCheckAll) {
			$("input[type='checkbox']").each(function() {
				this.checked = false;
			});
			isCheckAll = false;
		} else {
			$("input[type='checkbox']").each(function() {
				this.checked = true;
			});
			isCheckAll = true;
		}
	}
</script>
</head>
<body>
	欢迎您:${adminName},本次登录时间为${currenttime }
	<form action="student?method=delete" method="post">
		<table align="center">
			<tr align="center">
				<td colspan="20" style="color:red;font-size: 3em">学生信息查看</td>
			</tr>
			<tr align="center">
				<td colspan="3" style="font-size: 1em">成绩查询： <select
					id="projectPorperty" name="projectPorperty">
						<option value="0" selected="selected">请选择</option>
						<option value="1">语文</option>
						<option value="2">数学</option>
						<option value="3">英语</option>
				</select></td>
				<script>
					form.projectPorperty.value = '${user.projectPorperty}';
				</script>
				<td colspan="3"><input type="text" value="最低分">—</td>
				<td colspan="1"><input type="text" value="最高分"></td>
				<td colspan="3"><input type="button" value="查询"></td>
				<td colspan="3"><input type="button" value="新增"
					onclick="window.location.href='insert.jsp'"></td>
				<td colspan="3"><input type="submit" value="删除"
					onclick="return del();"></td>
			</tr>

			<tr>
				<td bgcolor="#abc4e4" colspan="20" height="5"></td>
			</tr>
			<tr align="center">
				<td colspan="2" nowrap="nowrap" align="center"><input
					type="checkbox" onclick="swapCheck()" />全选</td>
				<td colspan="2" nowrap="nowrap" align="center">学号</td>
				<td colspan="2" nowrap="nowrap" align="center">姓名</td>
				<td colspan="2" nowrap="nowrap" align="center">性别</td>
				<td colspan="2" nowrap="nowrap" align="center">出生日期</td>
				<td colspan="2" nowrap="nowrap" align="center">电话</td>
				<td colspan="2" nowrap="nowrap" align="center">班级</td>
				<td colspan="2" nowrap="nowrap" align="center">语文</td>
				<td colspan="2" nowrap="nowrap" align="center">数学</td>
				<td colspan="2" nowrap="nowrap" align="center">英语</td>
			</tr>
			<tr>
				<td bgcolor="#abc4e4" colspan="20" height="5"></td>
			</tr>
			<%
				IAdminDao adminDao = new AdminDaoImpl();
				List list = adminDao.SelectAll();
				if (list != null) {
					session.setAttribute("studentList", list);
			%>
			<c:forEach var="list" items="${studentList }">
				<tr height="50">
					<center>
						<td width="129" colspan="2" align="center"><input
							type="checkbox" name="checkBox" value="${list.ID }" /></td>
						<td width="129" colspan="2" align="center">${list.ID }</td>
						<td width="129" colspan="2" align="center"><a
							href="student?method=getStudent&studentid=${list.ID}">${list.NAME }</a></td>
						<td width="129" colspan="2" align="center">${list.SEX }</td>
						<td width="129" colspan="2" align="center">${list.DATETIME }</td>
						<td width="129" colspan="2" align="center">${list.PHONE }</td>
						<td width="129" colspan="2" align="center">${list.CLASS }</td>
						<td width="129" colspan="2" align="center">${list.CHINESE }</td>
						<td width="129" colspan="2" align="center">${list.MATHS }</td>
						<td width="129" colspan="2" align="center">${list.ENGLISH }</td>
					</center>
				</tr>
			</c:forEach>

			<tr>
				<td bgcolor="#abc4e4" colspan="20" height="1"></td>
			</tr>
			<%
				}
			%>
		</table>
		<br>
	</form>
</body>
</html>
