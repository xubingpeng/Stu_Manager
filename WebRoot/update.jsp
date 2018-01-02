<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css">
<link rel="stylesheet"
	href="bootstrapvalidator/css/bootstrapValidator.css">
<link rel="stylesheet" href="css/site.css">
<link rel="stylesheet"
	href="bootstrap-datetimepicker/css/bootstrap-datetimepicker.css">
<script src="jquery/jquery-2.2.4.min.js" type="text/javascript"></script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"
	type="text/javascript"></script>
<script src="bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"
	type="text/javascript"></script>
<script
	src="bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"
	type="text/javascript"></script>
<!-- 表单验证 -->
<script src="bootstrapvalidator/js/bootstrapValidator.js"
	type="text/javascript"></script>

<title>添加学生</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<script type="text/javascript">
	$(function() {
		validateForm();

		$(".form_datetime").datetimepicker({
			format : 'yyyy-mm-dd',
			minView : 'month',
			language : 'zh-CN',
			autoclose : true,//选中自动关闭
			startDate : '1900-01-01',
			todayBtn : true
		//显示今日按钮
		});

	});

	function validateForm() {
		// 验证表单
		$("#registerform").bootstrapValidator({
			message : 'This value is not valid',
			feedbackIcons : {/*输入框不同状态，显示图片的样式*/
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {/*验证*/
				name : {/*键名username和input name值对应*/
					message : 'The username is not valid',
					validators : {
						notEmpty : {/*非空提示*/
							message : '姓名不能为空'
						},
						regexp : {
							regexp : /^[\u4E00-\u9FA5A-Za-z]+$/,
							message : '姓名不合法, 请重新输入'
						},
						stringLength : {/*长度提示*/
							min : 2,
							max : 4,
							message : '用户名长度必须在2到4之间'
						},
					/*最后一个没有逗号*/

					}
				},
				phone : {
					message : '电话无效',
					validators : {
						notEmpty : {
							message : '电话不能为空'
						},
						stringLength : {
							min : 11,
							max : 11,
							message : '电话长度为11位'
						}
					}
				},
				class : {
					message : '班级名无效',
					validators : {
						notEmpty : {
							message : '班级名不能为空'
						},
						stringLength : {
							min : 2,
							max : 5,
							message : '班级名长度必须在2到5之间'
						}
					}
				},
				chinese : {
					message : '成绩无效',
					validators : {
						notEmpty : {
							message : '成绩不能为空'
						},
						between : {
							min : 0,
							max : 100,
							message : '成绩必须为0到100之间的数字'
						}
					}
				},
				maths : {
					message : '成绩无效',
					validators : {
						notEmpty : {
							message : '成绩不能为空'
						},
						/* regexp : {
							regexp : /^(0|[1-9][0-9]?|100)$/,
							message : '成绩不合法, 请重新输入'
						}, */
						between : {
							min : 0,
							max : 100,
							message : '成绩必须为0到100之间的数字'
						}
					}
				},
				english : {
					message : '成绩无效',
					validators : {
						notEmpty : {
							message : '成绩不能为空'
						},

						between : {
							min : 0,
							max : 100,
							message : '成绩必须为0到100之间的数字'
						}
					}
				}
			}
		});
	}
</script>

</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-offset-3 col-sm-6 text-center">
				<h3>更改学生</h3>
			</div>
		</div>
		<form action="student?method=update"
			class="form-horizontal col-sm-offset-3" id="registerform"
			method="post">
			<div class="form-group">
				<label for="username" class="col-sm-2 control-label">学号：</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="id"
						value="${student.ID}" readonly="true">
				</div>
			</div>
			<div class="form-group">
				<label for="username" class="col-sm-2 control-label">姓名：</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="name"
						value="${student.NAME}">
				</div>
			</div>
			<div class="form-group">
				<label for="sex" class="col-sm-2 control-label">性别：</label>
				<div class="col-sm-4">
					<label class="radio-inline"> 
					<input type="radio" name="sex"
						value="男" ${student.SEX=='男'?'checked':'' }/> 男
					</label> <label class="radio-inline"> <input type="radio"
						name="sex" value="女"  ${student.SEX=='女'?'checked':'' }/> 女
					</label>
				</div>
			</div>
			<div class="form-group">
				<label for="datetime" class="col-sm-2 control-label">出生日期：</label>
				<div class="col-sm-4">
					<div class="input-group date form_datetime"
						data-date-format="dd-MM-yyyy" data-link-field="dtp_input1">
						<input class="form-control" size="16" type="text" name="datetime"
							id="datetime" value="${student.DATETIME}" readonly> <span
							class="input-group-addon"><span
							class="glyphicon glyphicon-remove"></span></span> <span
							class="input-group-addon"><span
							class="glyphicon glyphicon-th"></span></span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="phone" class="col-sm-2 control-label">电话：</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="phone"
						value="${student.PHONE}">
				</div>
			</div>
			<div class="form-group">
				<label for="class" class="col-sm-2 control-label">班级：</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="class"
						 value="${student.CLASS}">
				</div>
			</div>
			<div class="form-group">
				<label for="chinese" class="col-sm-2 control-label">语文：</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="chinese"
						value="${student.CHINESE}">
				</div>
			</div>
			<div class="form-group">
				<label for="maths" class="col-sm-2 control-label">数学：</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="maths"
						value="${student.MATHS}">
				</div>
			</div>
			<div class="form-group">
				<label for="english" class="col-sm-2 control-label">英语：</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="english"
						value="${student.ENGLISH}">
				</div>
			</div>
			<div class="form-group has-error">
				<div class="col-sm-offset-2 col-sm-4 col-xs-6 ">
					<span class="text-warning"></span>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-4 col-xs-12">
					<button type="submit" class="btn btn-success btn-block">更新</button>
				</div>
			</div>
			<tr>
				<td colspan="2" align="center" height="50"><font color="red">${error }</font>

				</td>
			</tr>

		</form>
	</div>
</body>
</html>
