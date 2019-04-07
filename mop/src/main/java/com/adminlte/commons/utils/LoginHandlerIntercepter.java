package com.adminlte.commons.utils;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.adminlte.pojo.User;
import com.adminlte.shiro.ShiroUser;

@Component
public class LoginHandlerIntercepter implements HandlerInterceptor {
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object arg2, Exception arg3) {

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		// TODO Auto-generated method stub

		/*
		 * String userAgent=request.getHeader("user-agent"); if(userAgent!= null
		 * ){ userAgent = userAgent.toUpperCase(); }
		 * System.out.println("DD----"+userAgent); //IPHONE;ANDROID
		 */

		// 下边的方法测试成功，郫县公安局系统
		/*
		 * if (((HttpServletRequest) request).getHeader("X-Requested-With") ==
		 * null) //apicloud的请求没有内容，不拦截 { ShiroUser user= (ShiroUser)
		 * SecurityUtils.getSubject().getPrincipal();
		 * System.out.println("webs:"+user); return true; }
		 */

		// ShiroUser user= (ShiroUser)
		// SecurityUtils.getSubject().getPrincipal();

		User user = (User) request.getSession().getAttribute("user");
		// System.out.println(request.getRequestURI());
		// System.out.println( "xre:" + ((HttpServletRequest)
		// request).getHeader("X-Requested-With") );
		if ("XMLHttpRequest".equalsIgnoreCase(((HttpServletRequest) request).getHeader("X-Requested-With"))) {
			// ajax的请求，失败，所有请求都满足，通过jui的网页
			//
			System.out.println("Ajax comming!" + user);
			if (null == user) {
				response.setHeader("session-status", "timeout");
				return false;
			} else {
				return true;
			}
		}

		if (null != user) {
			System.out.println("loginlanjie:" + user.getId());
		} else {
			System.out.println("loginlanjie:" + user);
		}

		if (null == user) {

			// response.setContentType("text/html;charset=GBK");

			// request.getRequestDispatcher("/rest/logoutHander").include(request,
			// response);

			// 遗留问题，怎么在顶层显示登录,改天再研究
			/*
			 * PrintWriter out = response.getWriter(); out.println("<html>");
			 * out.println("<script>");
			 * out.println("window.open ('"+""+"/lmpds/rest/login','_top')");
			 * out.println("</script>"); out.println("</html>");
			 */

			response.sendRedirect("/mop/rest/login");//

			return false; // 终止后面的拦截器的执行
		}
		return true;// 让下一个拦截器去处理
	}

}
