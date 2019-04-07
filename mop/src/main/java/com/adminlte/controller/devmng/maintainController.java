package com.adminlte.controller.devmng;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.adminlte.controller.BaseController;

@Controller
@RequestMapping("/maintain")
public class maintainController extends BaseController {
	//不会走的路径
	@RequestMapping("/inspectManage")
	public String taskManager(Model model) {
		return "maintain/taskManage";
	}
}
