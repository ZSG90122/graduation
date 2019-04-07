package com.adminlte.controller;

import java.io.Console;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.adminlte.commons.utils.MD5String;
import com.adminlte.pojo.Udepartment;
import com.adminlte.pojo.Urole;
import com.adminlte.pojo.vo.Result;
import com.adminlte.pojo.vo.UserVo;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IUserService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.mysql.fabric.xmlrpc.base.Array;

/**
 * 用户管理
 * @author wuyudong
 *
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {
	
	@Autowired
	private IUserService userService;
	
	/**
	 * 个人信息页
	 *  
	 * @return
	 */
	
	
	@RequestMapping("/profile")
	public String profile() {
		return "profile";
	}
	
	/**
	 * 用户管理页
	 * @return
	 */
	@RequestMapping("/manager")
	public String manager() {
		return "user/manager";
	}
	/**
	 * 用户管理页
	 * @return
	 */
	@RequestMapping("/websocket")
	public String websocket(HttpServletRequest request) {
		return "socket/websocket";
	}
	/**
	 * 用户注册页
	 * @return
	 */
	@RequestMapping("/register")
	public String register() {
		return "register";
	}
	/**
	 * 找回密码
	 * @return
	 */
	@RequestMapping("/findPassword")
	public String findPassword(){
		return "findPassword";
	}
	/**
	 * 密码重置页面
	 * @return
	 */
	@RequestMapping("/resetPassword")
	public String resetPassword(){
		return "resetPassword";
	}
	
	@RequestMapping(value = "/dataGrid", method = RequestMethod.POST)
	public ResponseEntity<DatatablesResult> queryListByCategoryId(
			UserVo userVo,
			@RequestParam(value = "draw") String draw,
			@RequestParam(value = "start") String start,
			@RequestParam(value = "length") String length) {
		int rows = Integer.parseInt(length);
		int page = (Integer.parseInt(start) / rows) + 1;
		try {
			DatatablesResult datatablesResult = this.userService.selectUserVo(userVo, page, rows, Integer.parseInt(draw) );
			return ResponseEntity.ok(datatablesResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	
	/**
	 * 删除用户
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST) 
	public ResponseEntity<Void> queryListByCategoryId(@RequestParam(value = "id") String id) {
		try {
			Boolean bool = userService.deleteUserById(id);
			if (bool) {
				return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	}
	
	
	/**===============================用户注册========================================**/
	
	/**
	 * 获取所有role和organization信息
	 */
	@RequestMapping(value = "/getAllRolesAndOrganizations", method = RequestMethod.GET) 
	public String getAllRolesAndOrganizations(HttpSession session){
	List<Urole>roles= userService.getAllRoles();
	session.setAttribute("roles", roles);
	//List<Organization> organizations=userService.getAllOrganizations();
	//session.setAttribute("organizations",organizations);
	return "register";
	}
	/**
	 * 获取所有role和管辖区域的信息
	 */
	@RequestMapping(value = "/getAllRolesAndAreaInfo",method = RequestMethod.POST) 
	public ResponseEntity<Map<String, Object>> getAllRolesAndAreaInfo(){
		Map<String, Object> result = new HashMap<String, Object>();
		List<Urole>roles= userService.getAllRoles();
		 result.put("roles", roles);
		return ResponseEntity.ok(result);
	}
	/**
	 * 用户注册
	 * 返回是否注册成功信息
	 */
	@RequestMapping(value = "/addUser") 
	public ResponseEntity<Map<String, Object>> addUserInfo(UserVo uservo){
		Date createTime=new Date();
		uservo.setCreateTime(createTime);
		Map<String, Object> result = new HashMap<String, Object>();
		String password=MD5String.MD5(uservo.getPassword());
		uservo.setPassword(password);
		try {
			System.out.println(uservo.toString());
			Boolean bool = userService.addUserVoInfo(uservo);
			if (bool) {
				result.put("msg", "success");
			}else{
				result.put("msg", "failse");
			}
		} catch (Exception e) {
			result.put("msg", "failse");
			e.printStackTrace();
		}
		return ResponseEntity.ok(result);
	}
	
	/**
	 * 根据用户名，登录名和电话号码来查询用户 用于用户重置
	 */
	@RequestMapping(value = "/findPasswordByBaseInfo", method = RequestMethod.POST) 
	public ResponseEntity<Map<String, Object>> findPasswordByBaseInfo(UserVo userVo,HttpSession session){
		Map<String, Object> result = new HashMap<String, Object>();
		UserVo uservo;
		System.out.println(userVo.toString());
		try {
			 uservo = userService.findPasswordByBaseInfo(userVo);
			 List<Urole>roles= userService.getAllRoles();
			 //组织表暂时不用 启用sys_area_group表
			 //List<Organization> organizations=userService.getAllOrganizations();
			if (uservo!=null) {
				session.setAttribute("uservo", uservo);
				session.setAttribute("roles", roles);
				//session.setAttribute("organizations",organizations);
				result.put("msg", "查询成功");
			}else{
				result.put("msg", "没有该用户");
			}
		} catch (Exception e) {
			result.put("msg", "没有该用户");
			e.printStackTrace();
		}
		return ResponseEntity.ok(result);
	} 
	/**
	 * 用户自己修改用户信息
	 */
	@RequestMapping(value = "/updateUser", method = RequestMethod.POST) 
	public ResponseEntity<Map<String, Object>> updateUserInfo(UserVo userVo){
		Map<String, Object> result = new HashMap<String, Object>();
		String password=MD5String.MD5(userVo.getPassword());
		userVo.setPassword(password);
		try {
			Boolean bool = userService.updateUserVoInfo(userVo);
			if (bool) {
				result.put("msg", "success");
			}else{
				result.put("msg", "failse");
			}
		} catch (Exception e) {
			result.put("msg", "failse");
			e.printStackTrace();
		}
		return ResponseEntity.ok(result);
	}
	/**
	 * by lqq
	 * 超级管理员更新用户信息
	 * 
	 */
	@RequestMapping(value = "/updateUserInfoBySuper", method = RequestMethod.POST) 
	public ResponseEntity<Map<String, Object>> updateUserInfoBySuper(UserVo userVo){
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			String password=MD5String.MD5(userVo.getPassword());
			userVo.setPassword(password);
			
			//userService.updateUserVoInfo(userVo);
			System.out.print("updateUserInfoBySuper "+userVo.toString() );			
			Boolean bool = userService.updateUserInfoBySuper(userVo);
			if (bool) {
				result.put("msg", "success");
			}else{
				result.put("msg", "failse");
			}
		} catch (Exception e) {
			result.put("msg", "failse");
			e.printStackTrace();
		}
		return ResponseEntity.ok(result);
	}
	/**
	 * by lqq
	 * 删除一个或多个用户信息
	 */
	@RequestMapping(value = "/delectUser", method = RequestMethod.POST) 
	public ResponseEntity<Map<String, Object>> delectOneOrMoreUserInfo(Long[] user_id){
		Map<String, Object> result = new HashMap<String, Object>();
		List<Long> user_ids = Arrays.asList(user_id);
		try {
			Boolean bool = userService.delectUserInfo(user_ids);
			if (bool) {
				result.put("msg", "删除成功");
			}else{
				result.put("msg", "删除失败");
			}
		} catch (Exception e) {
			result.put("msg", "删除失败");
			e.printStackTrace();
		}
		return ResponseEntity.ok(result);
	}
	
	/*
	 * gzsds
	 */
	@RequestMapping(value = "/userList", method = RequestMethod.GET)
	@ResponseBody //
	public List<UserVo> getAreaOrGroupData(){	
		System.out.println("get all user");
		return userService.getAllUsers();
	}
	
	/**
	 * 根据传入的departmentId数组 获取user表中对应departmentId的所有人员信息
	 */
	@RequestMapping(value = "/getAllStafferInfobydep/{data}", method = RequestMethod.GET)
    @ResponseBody
    public List<UserVo> getAllStafferInfo(@PathVariable("data") String data) {
		
		List<UserVo> userVos = userService.selectUserVoByDepId(Long.parseLong(data));
		 
		return  userVos;
    }
	@RequestMapping(value = "/getAllStafferInfo/{data}", method = RequestMethod.POST)
    @ResponseBody
	public ResponseEntity<DatatablesResult> getAllStafferInfo(
			UserVo userVo,
			@PathVariable("data") String data,
			@RequestParam(value = "draw") String draw,
			@RequestParam(value = "start") String start,
			@RequestParam(value = "length") String length) {
		int rows = Integer.parseInt(length);
		int page = (Integer.parseInt(start) / rows) + 1;
		try {
			DatatablesResult datatablesResult = this.userService.selectUserVo(userVo, page, rows, Integer.parseInt(draw) );
			 List<UserVo> userVos = userService.selectUserVoByDepId(Long.parseLong(data));
			datatablesResult.setData(userVos);
			return ResponseEntity.ok(datatablesResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	
	
	/*
	 * 根据传入的名称 获取对应的用户信息
	 */
	@RequestMapping(value = "/getStafferInfoByName/{data}", method = RequestMethod.POST)
    @ResponseBody
	public ResponseEntity<DatatablesResult> getStafferInfoByName(
			UserVo userVo,
			@PathVariable("data") String data,
			@RequestParam(value = "draw") String draw,
			@RequestParam(value = "start") String start,
			@RequestParam(value = "length") String length) {
		int rows = Integer.parseInt(length);
		int page = (Integer.parseInt(start) / rows) + 1;
		System.out.println("----------------"+data);
		try {
			//DatatablesResult datatablesResult = this.userService.selectUserVo(userVo, page, rows, Integer.parseInt(draw) );
			// List<UserVo> userVos = userService.selectUserVoByName(data);
			//UserVo userVo = new UserVo();
			EntityWrapper<UserVo> wrapper = new EntityWrapper<UserVo>(userVo);
			if(data !=null && data.length()>0){
				wrapper.isWhere(true).like("t.name", data);
				System.out.println("----------------"+data);
			}
		    DatatablesResult datatablesResult = this.userService.selectUserVoWrapper(userVo, page, rows, Integer.parseInt(draw),wrapper );
			//datatablesResult.setData(userVos);
			return ResponseEntity.ok(datatablesResult);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.toString());
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	
}
