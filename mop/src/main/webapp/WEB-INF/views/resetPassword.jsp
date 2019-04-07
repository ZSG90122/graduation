<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common/head.jsp" %> 
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/AdminLTE/dist/css/AllPagesStyle/main.css">
  <title></title>
</head>
<body class="hold-transition login-page">
<div class="login-box"  style="width: 700px;">
  <div class="login-logo">
    <b>重置用户信息</b>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <form id="form_login" action="" method="post" >
      <div class="row">
        <div class="col-md-6">
          <div class="form-group has-feedback">
            <input type="text"value="${uservo.id}" style="display: none;" id="id">
            <input type="text" name="jg_login_user" id="login_name" class="form-control" value="${uservo.name}" placeholder="登录名">
            <span class="glyphicon  glyphicon-user form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input type="text" name="jg_login_name" id="name" class="form-control" value="${uservo.loginName}" placeholder="用户姓名">
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input type="password" name="jg_login_pwd" id="password" class="form-control" placeholder="密码">
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input type="password" id="toPassword" name="jg_login_repwd" class="form-control" placeholder="确认密码">
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
          <div class="form-group  text-center" id="wrap">
             <c:if test="${uservo.sex=='0'}">
             <label class="radio-inline">
			<input type="radio" name="inlineRadioOptions" id="inlineRadio1" checked="checked"value="0">男 </label>
			<label class="radio-inline">
              <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="1"> 女
            </label>
	        </c:if>
            <c:if test="${uservo.sex=='1'}">
            <label class="radio-inline">
			<input type="radio" name="inlineRadioOptions" id="inlineRadio1" checked="checked"value="0">男 </label>
            <label class="radio-inline">
			<input  type="radio" name="inlineRadioOptions" id="inlineRadio2" value="1">女</label>
	        </c:if>
            <div class="InputAge">
            <input type="text" id="age" name="jg_login_age" value="${uservo.age}" placeholder="年龄">
          	</div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="form-group has-feedback">
            <input type="text" name="jg_login_phone"  id="phone" class="form-control" value="${uservo.phone}"  placeholder="电话">
            <span class="glyphicon glyphicon-phone form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
          <input type="text" id="address" class="form-control" value="${uservo.address}" placeholder="地址">
          <span class="glyphicon glyphicon-send form-control-feedback"></span>
        </div>
          <div class="form-group has-feedback">
            <input type="text" id="image" class="form-control" value="${uservo.image}" placeholder="头像">
            <span class="glyphicon glyphicon-sunglasses form-control-feedback"></span>
          </div>
          <!--由于在user表中把organization_id换成站的范围 所以组织模块暂时删除-->
          <!--<div class="form-group mySelect"> 组织：
            <select class="form-control" id="select1">
             <c:forEach items="${organizations}" var="major">
				<option value="${major.id}"
				<c:if test="${major.id eq uservo.roleIds}">
						selected="selected"</c:if>>${major.name}</option>
			</c:forEach>
            </select>&nbsp;&nbsp;&nbsp;&nbsp;角色：
            <select class="form-control" id="select2">
              <c:forEach items="${roles}" var="major">
				<option value="${major.id}"
				<c:if test="${major.id eq uservo.organizationId}">
						selected="selected"</c:if>>${major.name}</option>
			</c:forEach>
            </select>
          </div>-->
        </div>
      </div>
      <div class="row">
        <div class="col-xs-offset-4"></div>
        <!-- /.col -->
        <div class="col-xs-5 col-xs-offset-3" > 
          <button id="btn_login" type="submit" class="btn btn-primary btn-block btn-flat">重置信息</button>
        </div>
        <!-- /.col -->
      </div>
    </form>
  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 2.2.3 -->
<script src="<%=request.getContextPath()%>/AdminLTE/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrap.min.js"></script>
<script
	src="<%=request.getContextPath()%>/AdminLTE/bootstrap/js/bootstrapValidator.js"></script>
<script>
  $(function () {
	  //验证数据
	   $('#form_login').bootstrapValidator({
            fields: {
                /*验证*/
                jg_login_user: {
                    /*键名username和input name值对应*/
                    message: '用户验证失败',
                    validators: {
                        notEmpty: {
                            /*非空提示*/
                            message: '用户名不能为空'
                        },
                        regexp: {
                            /* 只需加此键值对，包含正则表达式，和提示 */
                            regexp: /[a-zA-Z0-9_]{2,16}/ ,
                            message: '请正确输入您的登录名'
                        }
                    }
                },
                jg_login_name: {
                    /*键名username和input name值对应*/
                    message: '用户验证失败',
                    validators: {
                        notEmpty: {
                            /*非空提示*/
                            message: '用户名不能为空'
                        },
                        regexp: {
                            /* 只需加此键值对，包含正则表达式，和提示 */
                            regexp: /[a-zA-Z0-9_]{2,16}/ ,
                            message: '请正确输入您的用户名'
                        }
                    }
                },
                jg_login_pwd: {
                    message: '密码无效',
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 30,
                            message: '密码长度必须在6到30之间'
                        }
                    }
                },
                jg_login_repwd: {
                    message: '密码无效',
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        stringLength: {
                            min: 6,
                            max: 30,
                            message: '密码长度必须在6到30之间'
                        }
                    }
                },
                jg_login_phone: {
                    message: '电话格式错误',
                    validators: {
                        notEmpty: {
                            /*非空提示*/
                            message: '电话不能为空'
                        },
                        regexp: {
                            /* 只需加此键值对，包含正则表达式，和提示 */
                            regexp: /^1[34578]\d{9}$/,
                            message: '请正确输入您的电话号码'
                        }
                    }
                },
                jg_login_age: {
                    message: '年龄错误',
                    validators: {
                        notEmpty: {
                            /*非空提示*/
                            message: '年龄不能为空'
                        },
                        regexp: {
                            /* 只需加此键值对，包含正则表达式，和提示 */
                            regexp: /100|((1[0-1]|\d)?\d)/,
                            message: '请正确输入您的年龄'
                        }
                    }
                }
            } //验证内容
        }).on('success.form.bv', function (e) {
        	e.preventDefault();
            var $form = $(e.target);
            var bv = $form.data('bootstrapValidator');
      //装填数据
     var  date = {
		id:$("#id").val(),
        loginName: $("#login_name").val(),
        name: $("#name").val(),
        password: $("#password").val(),
        sex:  $('#wrap input[name="inlineRadioOptions"]:checked ').val(),
        age:  $("#age").val(),
        phone:  $("#phone").val(),
        address:  $("#address").val(),
        image:  $("#image").val(),
        userType:"1",
        status:"0"
      }
     //这里提交表单
     $.post('<%=request.getContextPath()%>/rest/user/updateUser',date, function (result) {
     	alert(result.msg);
     	if (result.msg == "更新成功") {
     		window.location.href='<%=request.getContextPath()%>/rest/login';
			}else{
				alert(result.msg);
			}
     });
    })
        });   
</script>
</body>
</html>
