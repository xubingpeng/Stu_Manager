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

<title>学生管理系统</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrap3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/bootstrap3/css/bootstrap-theme.min.css">
<script
	src="${pageContext.request.contextPath}/bootstrap3/js/jquery-1.11.2.min.js"></script>
<script
	src="${pageContext.request.contextPath}/bootstrap3/js/bootstrap.min.js"></script>

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
		/* 	var rs = document.getElementById("checkBox").value();
			alert(rs);
			if (rs == null) {
				alert("请选择要删除的学生");
			} else {
				var con = window.confirm("确定删除吗");
				return con;
			} */

		var con = window.confirm("确定删除吗");
		return con;
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
		<table style="font-size:15px;color:black">
			<tr>
				<td align="left">欢迎您:<span style="font-size:15px;color:red">${sessionScope.adminName}</span>,本次登录时间为${sessionScope.currenttime }
				</td>
				<td><a href="login?method=logout">注销登录</a></td>
			</tr>
		</table>
	<table align="center" class="table table-hover">
		<tr align="center">
			<td colspan="20" style="color:red;font-size: 3em">学生信息查看</td>
		</tr>
		<tr align="center">
			<form action="student?method=selectByFilter" method="post">
				<td colspan="3" style="font-size: 1em">成绩查询： <select
					id="projectPorperty" name="projectPorperty">
						<option value="0" selected="selected">请选择</option>
						<option value="1"
							<c:if test="${projectPorperty==1}">selected</c:if>>语文</option>
						<option value="2"
							<c:if test="${projectPorperty==2}">selected</c:if>>数学</option>
						<option value="3"
							<c:if test="${projectPorperty==3}">selected</c:if>>英语</option>
				</select></td>
				<td colspan="3"><input type="text" name="min" placeholder="最低分"
					value=""></td>
				<td colspan="1"><input type="text" name="max" placeholder="最高分"
					value=""></td>

				<td colspan="3"><button type="submit" class="btn btn-success">查询</button></td>
			</form>
			<form action="student?method=delete" delete" method="post">
				<td colspan="3"><button type="button" class="btn btn-success"
						onclick="window.location.href='insert.jsp'">增加</button></td>
				<td colspan="3">
					<button type="submit" class="btn btn-success"
						onclick="return del();">删除</button>
				</td>
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

		<c:forEach var="list" items="${studentList }">
			<tr height="50">
				<center>
					<td width="129" colspan="2" align="center"><input
						type="checkbox" id="checkBox" name="checkBox" value="${list.ID }" /></td>
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
		</form>
	</table>
	<br>
</body>
</html>
