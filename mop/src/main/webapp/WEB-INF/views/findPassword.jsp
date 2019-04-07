<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<%@include file="common/head.jsp" %> 
</head>
<body class="hold-transition login-page">
	<div class="login-box" data-genuitec-lp-enabled="false"
		data-genuitec-file-id="wc3-1"
		data-genuitec-path="/lmpds/src/main/webapp/WEB-INF/views/login.jsp">
		<div class="login-logo">找回密码</div>
		<!-- /.login-logo -->
		<div class="login-box-body">
			<form id="form_login" action="" method="post">
				<div class="form-group has-feedback">
					<input name="jg_login_user" type="text" class="form-control"
						id="name" placeholder="您的用户名"> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="text" name="jg_login_user" id="login_name"
						class="form-control" placeholder="登录名"> <span
						class="glyphicon  glyphicon-user form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="text" name="jg_login_phone" id="phone"
						class="form-control" placeholder="电话"> <span
						class="glyphicon glyphicon-phone form-control-feedback"></span>
				</div>
				<div class="row">
        <div class="col-xs-offset-4"></div>
        <!-- /.col -->
        <div class="col-xs-5 col-xs-offset-3" > 
          <button id="btn_login" type="submit" class="btn btn-primary btn-block btn-flat">找回密码</button>
        </div>
        <!-- /.col -->
      </div>
			</form>
		</div>
		<!-- /.login-box-body -->
	</div>
	<!-- /.login-box -->

	<!-- jQuery 2.2.3 -->
	<script
		src="<%=request.getContextPath()%>/AdminLTE/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrapValidator.js"></script>
	<script>
		$(function() {
			//验证数据
			$('#form_login').bootstrapValidator({
				fields : {
					/*验证*/
					jg_login_user : {
						/*键名username和input name值对应*/
						message : '用户验证失败',
						validators : {
							notEmpty : {
								/*非空提示*/
								message : '用户名不能为空'
							},
							regexp : {
								/* 只需加此键值对，包含正则表达式，和提示 */
								regexp : /[a-zA-Z0-9_]{2,16}/,
								message : '请正确输入您的登录名'
							}
						}
					},
					jg_login_name : {
						message : '用户验证失败',
						validators : {
							notEmpty : {
								/*非空提示*/
								message : '用户名不能为空'
							},
							regexp : {
								/* 只需加此键值对，包含正则表达式，和提示 */
								regexp : /[a-zA-Z0-9_]{2,16}/,
								message : '请正确输入您的用户名'
							}
						}
					},
					jg_login_phone : {
						message : '电话格式错误',
						validators : {
							notEmpty : {
								/*非空提示*/
								message : '电话不能为空'
							},
							regexp : {
								/* 只需加此键值对，包含正则表达式，和提示 */
								regexp : /^1[34578]\d{9}$/,
								message : '请正确输入您的电话号码'
							}
						}
					}
				} //验证内容
			}).on('success.form.bv', function(e) {
				e.preventDefault();
				var $form = $(e.target);
				var bv = $form.data('bootstrapValidator');
				//装填数据
				var date = {
					loginName : $("#login_name").val(),
					name : $("#name").val(),
					phone : $("#phone").val()
				}
				//这里提交表单
				$.post('<%=request.getContextPath()%>/rest/user/findPasswordByBaseInfo', date, function(result) {
					alert(result.msg);
					if (result.msg == "查询成功") {
						window.location.href = '<%=request.getContextPath()%>/rest/user/resetPassword';
					} else {
						alert(result.msg);
					}
				});
			})
		});
	</script>
</body>
</html>
