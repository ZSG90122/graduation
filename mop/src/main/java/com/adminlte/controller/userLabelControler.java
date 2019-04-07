package com.adminlte.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 普通用户视图
 * @author luo
 *后台 普通用户界面的所有页面跳转请求
 */
@Controller
@RequestMapping("/userLabel")
public class userLabelControler {
	 
	/**
	 *  项目查询
	 * Model 传递数据
	 * @return
	 */
	@RequestMapping("/findUserAllLabel")
	public String findUserAllLabel(Model model) {
		model.addAttribute("projectLists", "ss");
		return "projectmanage/systemmanager/userLabelfindAll";
	}
	/**
	 *  为标段添加其他信息
	 * Model 传递数据
	 * @return
	 */
	@RequestMapping("/userUpLabeldetail")
	public String userUpLabeldetail(Model model) {
		model.addAttribute("projectLists", "ss");
		return "projectmanage/systemmanager/userUpLabeldetail";
	}
	
	/**
	 * 查看标段信息
	 */
	@RequestMapping("/showUserProjectLabel")
	public String showUserProjectLabel(Model model) {
		model.addAttribute("projectLists", "ss");
		return "projectmanage/systemmanager/userUpLabeldetail";
	}
	
}
