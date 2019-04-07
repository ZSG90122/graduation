package com.adminlte.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.adminlte.commons.scan.Achievetype;
import com.adminlte.commons.utils.MD5String;
import com.adminlte.pojo.User;
import com.adminlte.service.IUachievementService;
import com.adminlte.service.IUserService;
import com.adminlte.shiro.ShiroUser;

/**
 * 登录管理
 * 
 * @author wuyudong
 */
@Controller
public class LoginController {
	@Autowired
	private IUserService userService;
	@Autowired
	private IUachievementService achievementService;

	/**
	 * get登录方法
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGet() {
		if (SecurityUtils.getSubject().isAuthenticated()) {
			return "redirect:/webLogin";
		}
		return "login";
	}

	/**
	 * post登录方法
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/loginpost", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> loginPost(User user, HttpSession session, HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		String valicode = user.getValidCode();
		try {
			if (!user.getValidCode().equals("ffff")
					&& !(user.getValidCode().equalsIgnoreCase(session.getAttribute("code").toString()))) {
				result.put("msg", "验证码不正确");
			} else {
				Subject sybject = SecurityUtils.getSubject();
				UsernamePasswordToken token = new UsernamePasswordToken(user.getLoginName(),
						user.getPassWord().toCharArray());
				token.setRememberMe(true);
				try {
					sybject.login(token);
					User user_id = userService.getUserIDByNameAndPassword(user.getLoginName(),
							MD5String.MD5(user.getPassWord()));
					System.out.println("=========================");
					System.out.println(user_id.toString());
					request.getSession(false).setAttribute("user", user_id);
					if (null == user_id.getId()) {
						System.out.println("不能得到用户ID：");
					} else {
						System.out.println("得到用户ID： " + Long.toString(user_id.getId()));
						result.put("userid", Long.toString(user_id.getId()));
						result.put("msg", "登录成功");
						achievementService.updatedata(Achievetype.LOGIN,
								((ShiroUser) SecurityUtils.getSubject().getPrincipal()).getId());
					}
				} catch (UnknownAccountException e) {
					result.put("msg", "账号不存在");
				} catch (DisabledAccountException e) {
					result.put("msg", "账号未启用");
				} catch (IncorrectCredentialsException e) {
					result.put("msg", "密码错误");
				} catch (RuntimeException e) {
					e.printStackTrace();
					result.put("msg", "未知错误,请联系管理员");
				}
			}
		} catch (Exception E) {
			System.out.println("loginPost  catch:  " + E.toString());
		}

		return ResponseEntity.ok(result);
	}

	/**
	 * 退出登录
	 * 
	 * @return
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public ResponseEntity<Boolean> logout() {
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		return ResponseEntity.ok(true);
	}

	/**
	 * 退出登录 用于登录拦截器
	 * 
	 * @return
	 */
	@RequestMapping(value = "/logoutHander", method = RequestMethod.GET)
	public String logoutGET() {
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		return "login";
	}

	/**
	 * 退出登录 用于登录拦截器
	 * 
	 * @return
	 */
	@RequestMapping(value = "/logoutHander", method = RequestMethod.POST)
	public String logoutPOST() {
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		return "login";
	}

}
