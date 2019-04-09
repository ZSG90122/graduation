package com.adminlte.controller.maintain;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.adminlte.controller.BaseController;
import com.adminlte.pojo.Bfault;
import com.adminlte.pojo.Bpersoninspection;
import com.adminlte.pojo.vo.BfaultVo;
import com.adminlte.pojo.vo.Result;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IBfaultService;
import com.adminlte.service.IBpersoninspectionService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;

/**
 * 故障管理的Controller
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/fault")
public class faultController extends BaseController {
	@Autowired
	IBfaultService ibfaultService;

	@Autowired
	IBpersoninspectionService ibpersoninspectionService;

	@RequestMapping("/faultManage")
	public String faultManage(Model model) {
		return "maintain/faultManage";
	}

	/**
	 * 获取表格形式的故障信息
	 * 
	 * @param querystring
	 * @param draw
	 * @param start
	 * @param length
	 * @return
	 */
	@RequestMapping("/getFaultDataGrid")
	public ResponseEntity<DatatablesResult<BfaultVo>> getInspectDataGrid(String querystring,
			@RequestParam(value = "draw") String draw, @RequestParam(value = "start") String start,
			@RequestParam(value = "length") String length) {
		int rows = Integer.parseInt(length);
		int page = (Integer.parseInt(start) / rows) + 1;
		String taskcontent = null;// 搜索框内的条件
		System.out.println("------------:" + querystring);
		if (null != querystring) {
			String str1[] = querystring.split(",");// 将字符串按逗号分割为两部分
			int i;
			for (i = 0; i < str1.length; i++) {
				String str2[] = str1[i].split(":");
				if (str2.length < 2) {
					continue;
				}
				switch (str2[0]) {
				case "taskcontent":
					taskcontent = str2[1];
					break;
				}
			}
		}
		try {
			EntityWrapper<Bfault> wrapper = new EntityWrapper<Bfault>();
			if (null != taskcontent && taskcontent.length() > 0) {
				wrapper.like("taskcontent", taskcontent);
			}
			wrapper.orderBy("id");
			DatatablesResult<BfaultVo> datatablesResult = this.ibfaultService.selecDataGridWrapper(page, rows,
					Integer.parseInt(draw), wrapper);
			return ResponseEntity.ok(datatablesResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 新增一条故障
	 * 
	 * @param fault
	 * @return
	 */
	@RequestMapping("/insertOneFault")
	@ResponseBody
	public Result insertOneFault(Bfault fault) {
		try {
			if (fault.getSystemid() == -1)
				fault.setSystemid(null);
			if (fault.getInpectid() == -1)
				fault.setInpectid(null);
			if (fault.getRedevid() == -1)
				fault.setRedevid(null);
			fault.setState((byte) 0);
			fault.setFillperson(getShiroUser().getId());
			this.ibfaultService.insert(fault);
			return new Result(true);
		} catch (Exception e) {
			return new Result(false);
		}
	}

	/**
	 * 删除一条数据
	 * 
	 * @param fault
	 * @return
	 */
	@RequestMapping("/deleteOneFault")
	@ResponseBody
	public Result deleteOneFault(Bfault fault) {
		try {
			// 如果此故障是来自于巡检的故障，那么删除后就需要重新将状态置为未录入
			if (fault.getInpectid() != null) {
				Bpersoninspection personinspection = this.ibpersoninspectionService.selectById(fault.getInpectid());
				personinspection.setState((byte) 1);
				this.ibpersoninspectionService.updateById(personinspection);
			}
			this.ibfaultService.deleteById(fault);
			return new Result(true);
		} catch (Exception e) {
			return new Result(false);
		}
	}

	/**
	 * 审核后录入解决方案
	 * 
	 * @param fault
	 * @return
	 */
	@RequestMapping("/insertFaultSolution")
	@ResponseBody
	public Result insertFaultSolution(Bfault fault) {
		try {
			fault.setState((byte) 1);
			fault.setVeriyperson(getShiroUser().getId());
			fault.setVeriytime(new Date());
			this.ibfaultService.updateById(fault);
			return new Result(true);
		} catch (Exception e) {
			return new Result(false);
		}
	}

	/**
	 * 故障解决后，而且当故障是来自于巡检的时候会修改巡检的故障状态
	 * 
	 * @param fault
	 * @param solution
	 * @return
	 */
	@RequestMapping("/insertFaultSolutionResult")
	@ResponseBody
	public Result insertFaultSolutionResult(Bfault fault, String solution) {
		try {
			// 如果是来自于巡检的故障,则更新其故障的状态
			if (fault.getInpectid() != null) {
				Bpersoninspection personinspection = this.ibpersoninspectionService.selectById(fault.getInpectid());
				personinspection.setIsfault((byte) 2);
				this.ibpersoninspectionService.updateById(personinspection);
			}
			fault.setState((byte) 2);
			this.ibfaultService.updateById(fault);
			return new Result(true);
		} catch (Exception e) {
			return new Result(false);
		}
	}
}
