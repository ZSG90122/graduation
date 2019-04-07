package com.adminlte.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.adminlte.pojo.Benterprise;
import com.adminlte.service.IBenterpriseService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;

@Controller
@RequestMapping("/benterprise")
public class BEnterpriseController extends BaseController {
	@Autowired
	IBenterpriseService iBenterpriseService;

	@RequestMapping("/getenterpriselist")
	@ResponseBody
	public List<Benterprise> getEnterpriseList() {
		EntityWrapper<Benterprise> wrapper = new EntityWrapper<Benterprise>();
		return iBenterpriseService.selectList(wrapper);
	}

}
