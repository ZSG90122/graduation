package com.adminlte.controller.maintain;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.adminlte.controller.BaseController;
import com.adminlte.pojo.Btask;
import com.adminlte.pojo.vo.Result;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IBtaskService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;

@Controller
@RequestMapping("/task")
public class taskController extends BaseController {

	@Autowired
	IBtaskService iBtaskService;

	/**
	 * 跳转到任务管理界面
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/taskManage")
	public String taskManager(Model model) {
		return "maintain/taskManage";
	}

	/**
	 * 获取表格数据
	 * 
	 * @param querystring
	 * @param draw
	 * @param start
	 * @param length
	 * @return
	 */
	@RequestMapping("/getTaskDataGrid")
	public ResponseEntity<DatatablesResult<Btask>> getTaskDataGrid(String querystring,
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
			EntityWrapper<Btask> wrapper = new EntityWrapper<Btask>();
			if (null != taskcontent && taskcontent.length() > 0) {
				wrapper.like("taskcontent", taskcontent);
			}
			wrapper.orderBy("id");
			DatatablesResult<Btask> datatablesResult = this.iBtaskService.selecDataGridWrapper(page, rows,
					Integer.parseInt(draw), wrapper);
			return ResponseEntity.ok(datatablesResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * List形式返回所有处于下达状态的任务信息
	 * 
	 * @return
	 */
	@RequestMapping(value = "/getTransedTaskList")
	@ResponseBody
	public List<Btask> getTransedTaskList() {
		EntityWrapper<Btask> wrapper = new EntityWrapper<Btask>();
		wrapper.eq("state", 0);
		wrapper.orderBy("id");
		return this.iBtaskService.selectList(wrapper);
	}

	/**
	 * 通过任务id获取一条任务
	 * 
	 * @param taskid
	 * @return
	 */
	@RequestMapping(value = "/getFilledOneTaskById")
	@ResponseBody
	public List<Btask> getFilledOneTaskById(@RequestParam Long taskid) {
		EntityWrapper<Btask> wrapper = new EntityWrapper<Btask>();
		wrapper.eq("id", taskid);
		return this.iBtaskService.selectList(wrapper);
	}

	/**
	 * 插入一条数据
	 * 
	 * @param task
	 * @return
	 */
	@RequestMapping(value = "/insertOneTask", method = RequestMethod.POST)
	@ResponseBody
	public Result insertOneTask(Btask task) {
		try {
			task.setState((byte) 0);
			task.setTransperson(getShiroUser().getName());
			task.setTranstime(new Date());
			this.iBtaskService.insert(task);
			return new Result(true);
		} catch (Exception e) {
			return new Result(false);
		}
	}

	/**
	 * 更新一条数据
	 * 
	 * @param task
	 * @return
	 */
	@RequestMapping(value = "/updateOneTask", method = RequestMethod.POST)
	@ResponseBody
	public Result updateOneTask(Btask task) {
		try {
			this.iBtaskService.updateById(task);
			return new Result(true);
		} catch (Exception e) {
			return new Result(false);
		}
	}

	/**
	 * 删除一条数据
	 * 
	 * @param task
	 * @return
	 */
	@RequestMapping(value = "/deleteOneTask", method = RequestMethod.POST)
	@ResponseBody
	public Result deleteOneTask(Btask task) {
		try {
			this.iBtaskService.deleteById(task);
			return new Result(true);
		} catch (Exception e) {
			return new Result(false);
		}
	}

	/**
	 * 批量删除
	 * 
	 * @param taskList
	 * @return
	 */
	@RequestMapping(value = "/deleteTaskByBatch", method = RequestMethod.POST)
	@ResponseBody
	public Result deleteTaskByBatch(@RequestBody List<Btask> taskList) {
		try {
			for (Btask task : taskList) {
				this.iBtaskService.deleteById(task);
				// 可能同时还需要删除相应的巡检和故障信息
			}
			return new Result(true);
		} catch (Exception e) {
			return new Result(false);
		}
	}

}
