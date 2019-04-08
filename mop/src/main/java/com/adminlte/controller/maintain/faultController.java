package com.adminlte.controller.maintain;

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
import com.adminlte.pojo.vo.BfaultVo;
import com.adminlte.pojo.vo.Result;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IBfaultService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;

@Controller
@RequestMapping("/fault")
public class faultController extends BaseController {
	@Autowired
	IBfaultService ibfaultService;

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
	 * 新增一条数据
	 * 
	 * @param fault
	 * @return
	 */
	@RequestMapping("/insertOneFault")
	@ResponseBody
	public Result insertOneFault(Bfault fault) {
		try {
			fault.setFillperson(getShiroUser().getId());
			this.ibfaultService.insert(fault);
			return new Result(true);
		} catch (Exception e) {
			return new Result(false);
		}
	}
}
