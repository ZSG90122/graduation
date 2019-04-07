package com.adminlte.controller.devmng;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.adminlte.controller.BaseController;
import com.adminlte.pojo.Bdevsystem;
import com.adminlte.pojo.Brcstationdevhouse;
import com.adminlte.pojo.vo.BdevsystemVo;
import com.adminlte.pojo.vo.Result;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IBdevsystemService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;

/**
 * 遥控站配套系统Controller
 * 
 * @author zsg
 *
 */
@Controller
@RequestMapping("/devsystem")
public class DevsystemController extends BaseController {

	@Autowired
	IBdevsystemService bdevsystemService;

	/**
	 * 多表查询得到的所有设备配套系统的数据(List集合)
	 * 
	 * @return
	 */
	@RequestMapping("/getbdevsystemvolist")
	@ResponseBody
	public List<BdevsystemVo> getBdevsystemVoList() {
		EntityWrapper<BdevsystemVo> wrapper = new EntityWrapper<BdevsystemVo>();
		return this.bdevsystemService.selectBDevsystemVoListWrapper(wrapper);
	}

	/**
	 * 查询得到用于填充前端表格的对象并返回
	 * 
	 * @param querystring
	 * @param draw
	 * @param start
	 * @param length
	 * @return
	 */
	@RequestMapping(value = "/devsystemvodataGrid", method = RequestMethod.POST)
	public ResponseEntity<DatatablesResult> devsystemvodataGrid(String querystring,
			@RequestParam(value = "draw") String draw, @RequestParam(value = "start") String start,
			@RequestParam(value = "length") String length) {
		int rows = Integer.parseInt(length);
		int page = (Integer.parseInt(start) / rows) + 1;
		// 当querystring附带查询条件时，以下变量将起到一个过滤的作用，等到做
		// 查询按钮的时候这些变量才会起到作用，目前先暂时不用管
		// 这个type在查询遥控站的时候强制它在默认的情况下为0
		// 只管监测系统，而它的type正好是0
		String depid = null;
		String stationdevhouseid = null;
		String systemname = null;// 搜索框内的条件
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
				case "depid":
					depid = str2[1];
					break;
				case "stationdevhouseid":
					stationdevhouseid = str2[1];
					break;
				case "name":
					systemname = str2[1];
					break;
				}
			}
		}
		try {
			EntityWrapper<Brcstationdevhouse> wrapper = new EntityWrapper<Brcstationdevhouse>();
			if (null != depid && !depid.equals("-1")) {
				wrapper.isWhere(true);
				wrapper.eq("s.depid", depid);
			}
			if (null != stationdevhouseid && !stationdevhouseid.equals("-1")) {
				wrapper.isWhere(true);
				wrapper.eq("s.rchouseid", stationdevhouseid);
			}
			if (null != systemname && systemname.length() > 0) {
				wrapper.isWhere(true);
				wrapper.like("s.name", systemname);
			}
			wrapper.orderBy("id");
			DatatablesResult datatablesResult = bdevsystemService.selectVoDataGridWrapper(page, rows,
					Integer.parseInt(draw), wrapper);
			return ResponseEntity.ok(datatablesResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 根据传过来的参数向数据库插入一条数据
	 * 
	 * @param bdevsystem
	 * @return
	 */
	@RequestMapping(value = "/insertdevsystem", method = RequestMethod.POST)
	@ResponseBody
	public Result insertDevsystem(Bdevsystem bdevsystem) {
		try {
			this.bdevsystemService.insert(bdevsystem);
			return new Result(true);
		} catch (Exception e) {
			return new Result(false);
		}
	}

	/**
	 * 根据传过来的参数（配套系统对象）删除单项数据
	 * 
	 * @param bdevsystem
	 * @return
	 */
	@RequestMapping(value = "/deletedevsystem", method = RequestMethod.POST)
	@ResponseBody
	public Result deleteDevsystem(Bdevsystem bdevsystem) {
		try {
			bdevsystemService.deleteById(bdevsystem.getId());
			return new Result(true);
		} catch (Exception e) {
			return new Result(false);
		}
	}

	/**
	 * 批量删除，根据复选框选中的编号的列表
	 * 
	 * @param bdevsystemList
	 * @return
	 */
	@RequestMapping(value = "/deletedevsystemBatch", method = RequestMethod.POST)
	@ResponseBody
	public Result deleteDevsystemBatch(@RequestBody List<Bdevsystem> bdevsystemList) {

		try {
			for (Bdevsystem bdevsystem : bdevsystemList) {
				this.bdevsystemService.deleteById(bdevsystem.getId());
			}
			return new Result(true);
		} catch (Exception e) {
			return new Result(true);
		}
	}

	/**
	 * 根据传过来的参数修改数据库中的参数
	 * 
	 * @param bdevsystem
	 * @return
	 */
	@RequestMapping(value = "/updateOnedevsystemValue", method = RequestMethod.POST)
	@ResponseBody
	public Result updateOnedevsystemValue(Bdevsystem bdevsystem) {
		try {
			this.bdevsystemService.updateById(bdevsystem);
			return new Result(true);
		} catch (Exception e) {
			return new Result(false);
		}
	}

}
