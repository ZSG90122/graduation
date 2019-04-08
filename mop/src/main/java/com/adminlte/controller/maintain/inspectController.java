package com.adminlte.controller.maintain;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.adminlte.controller.BaseController;
import com.adminlte.pojo.Bpersoninspection;
import com.adminlte.pojo.vo.BpersoninspectionVo;
import com.adminlte.pojo.vo.Result;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IBpersoninspectionService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;

@Controller
@RequestMapping("/inspect")
public class inspectController extends BaseController {
	@Autowired
	IBpersoninspectionService ibpersoninspectionService;

	@RequestMapping("/inspectManage")
	public String inspectManage(Model model) {
		return "maintain/inspectManage";
	}

	@RequestMapping("/getInspectDataGrid")
	public ResponseEntity<DatatablesResult<BpersoninspectionVo>> getInspectDataGrid(String querystring,
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
			EntityWrapper<Bpersoninspection> wrapper = new EntityWrapper<Bpersoninspection>();
			if (null != taskcontent && taskcontent.length() > 0) {
				wrapper.like("taskcontent", taskcontent);
			}
			wrapper.orderBy("id");
			DatatablesResult<BpersoninspectionVo> datatablesResult = this.ibpersoninspectionService
					.selecDataGridWrapper(page, rows, Integer.parseInt(draw), wrapper);
			return ResponseEntity.ok(datatablesResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 插入一条巡检信息
	 * 
	 * @param bpersoninspection
	 * @return
	 */
	@RequestMapping("/insertOneInspect")
	@ResponseBody
	public Result insertOneInspect(Bpersoninspection bpersoninspection) {
		try {
			bpersoninspection.setFillpersonid(getShiroUser().getId());
			// 默认为未审核
			bpersoninspection.setState((byte) 0);
			bpersoninspection.setFilltime(new Date());
			this.ibpersoninspectionService.insert(bpersoninspection);
			return new Result(true);
		} catch (Exception e) {
			return new Result(false);
		}
	}

	/**
	 * 更新一条巡检信息
	 * 
	 * @param personinspection
	 * @return
	 */
	@RequestMapping(value = "/updateOneInspect", method = RequestMethod.POST)
	@ResponseBody
	public Result updateOneTask(Bpersoninspection personinspection) {
		try {
			this.ibpersoninspectionService.updateById(personinspection);
			return new Result(true);
		} catch (Exception e) {
			return new Result(false);
		}
	}

	/**
	 * 删除一条巡检信息
	 * 
	 * @param personinspection
	 * @return
	 */
	@RequestMapping(value = "/deleteOneInspect", method = RequestMethod.POST)
	@ResponseBody
	public Result deleteOneTask(Bpersoninspection personinspection) {
		try {
			this.ibpersoninspectionService.deleteById(personinspection);
			return new Result(true);
		} catch (Exception e) {
			return new Result(false);
		}
	}
}
