package com.adminlte.controller.maintain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.adminlte.controller.BaseController;
import com.adminlte.pojo.Bfault;
import com.adminlte.pojo.Bpersoninspection;
import com.adminlte.pojo.Bpersoninspectionattach;
import com.adminlte.pojo.Btask;
import com.adminlte.pojo.vo.BpersoninspectionVo;
import com.adminlte.pojo.vo.Result;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IBfaultService;
import com.adminlte.service.IBpersoninspectionService;
import com.adminlte.service.IBpersoninspectionattachService;
import com.adminlte.service.IBtaskService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/inspect")
public class inspectController extends BaseController {
	@Autowired
	IBpersoninspectionService ibpersoninspectionService;

	@Autowired
	IBtaskService ibtaskService;

	@Autowired
	IBfaultService ibfaultService;

	@Autowired
	IBpersoninspectionattachService ibpersoninspectionattachService;

	@RequestMapping("/inspectManage")
	public String inspectManage(Model model) {
		return "maintain/inspectManage";
	}

	/**
	 * 在巡检界面点击故障录入按钮进入故障录入界面
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/goTofaultManagePage")
	public String goTofaultManagePage(Model model, @RequestParam Long inspectid) {
		Bpersoninspection personinspection = this.ibpersoninspectionService.selectById(inspectid);
		model.addAttribute("inspectid", personinspection.getId());
		model.addAttribute("stationid", personinspection.getRedevid());
		return "maintain/faultManage";
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
			wrapper.orderBy("p.id");
			DatatablesResult<BpersoninspectionVo> datatablesResult = this.ibpersoninspectionService
					.selecDataGridWrapper(page, rows, Integer.parseInt(draw), wrapper);
			return ResponseEntity.ok(datatablesResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	@RequestMapping("/getInspectList")
	@ResponseBody
	public List<Bpersoninspection> getInspectList() {
		EntityWrapper<Bpersoninspection> wrapper = new EntityWrapper<Bpersoninspection>();
		wrapper.orderBy("id");
		return this.ibpersoninspectionService.selectList(wrapper);
	}

	@RequestMapping("/getInspectWithFaultList")
	@ResponseBody
	public List<Bpersoninspection> getInspectWithFaultList() {
		EntityWrapper<Bpersoninspection> wrapper = new EntityWrapper<Bpersoninspection>();
		wrapper.eq("isfault", 1);
		wrapper.orderBy("id");
		return this.ibpersoninspectionService.selectList(wrapper);
	}

	/**
	 * 插入一条巡检信息
	 * 
	 * @param bpersoninspection
	 * @return
	 */
	@RequestMapping("/insertOneInspect")
	@ResponseBody
	public Result insertOneInspect(Bpersoninspection bpersoninspection, @RequestParam String fileliststr) {
		try {
			bpersoninspection.setFillpersonid(getShiroUser().getId());
			bpersoninspection.setFilltime(new Date());
			// 当巡检类型为任务巡检时才置为未审核状态
			if (bpersoninspection.getTypeid() == 1) {
				// 任务巡检的状态置为未审核状态
				bpersoninspection.setState((byte) 0);
				// 以下将任务的状态置为填入状态
				Btask task = this.ibtaskService.selectById(bpersoninspection.getTaskid());
				task.setState((byte) 1);
				this.ibtaskService.updateById(task);
			} else
				// 非任务巡检无需审核
				bpersoninspection.setState((byte) 2);
			this.ibpersoninspectionService.insert(bpersoninspection);
			// 同时插入图片
			if (fileliststr.length() > 0) {
				fileliststr = fileliststr.replaceAll("&quot;", "\""); //
				ObjectMapper mapper = new ObjectMapper();
				JavaType jt = mapper.getTypeFactory().constructParametricType(ArrayList.class,
						Bpersoninspectionattach.class);
				List<Bpersoninspectionattach> bpersoninspectionattachList = mapper.readValue(fileliststr, jt);
				for (Bpersoninspectionattach bpersoninspectionattach : bpersoninspectionattachList) {
					bpersoninspectionattach.setInpectid(bpersoninspection.getId());
					this.ibpersoninspectionattachService.insert(bpersoninspectionattach);
				}
			}

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
	public Result updateOneTask(Bpersoninspection personinspection, @RequestParam String fileliststr) {
		try {
			this.ibpersoninspectionService.updateById(personinspection);
			if (fileliststr.length() > 0) {
				fileliststr = fileliststr.replaceAll("&quot;", "\""); //
				ObjectMapper mapper = new ObjectMapper();
				JavaType jt = mapper.getTypeFactory().constructParametricType(ArrayList.class,
						Bpersoninspectionattach.class);
				List<Bpersoninspectionattach> bpersoninspectionattachList = mapper.readValue(fileliststr, jt);
				for (Bpersoninspectionattach bpersoninspectionattach : bpersoninspectionattachList) {
					if (bpersoninspectionattach.getId() == null) {
						bpersoninspectionattach.setInpectid(personinspection.getId());
						this.ibpersoninspectionattachService.insert(bpersoninspectionattach);
					}
				}
			}
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
	public Result deleteOneInspect(Bpersoninspection personinspection) {
		try {
			// 获取待删除的巡检的完整信息
			Bpersoninspection personinspectionFullm = this.ibpersoninspectionService.selectById(personinspection);
			// 如果是任务巡检
			if (personinspectionFullm.getTypeid() == 1) {
				Btask task = this.ibtaskService.selectById(personinspectionFullm.getTaskid());
				// 任务巡检删除之后取消填入状态，置为下达状态
				task.setState((byte) 0);
				this.ibtaskService.updateById(task);
			}
			// 同时删除该巡检发现的故障
			EntityWrapper<Bfault> wrapper = new EntityWrapper<Bfault>();
			wrapper.eq("inpectid", personinspection.getId());
			this.ibfaultService.delete(wrapper);
			// 同时删除该巡检的图片，暂时不讨论删除本地的文件
			EntityWrapper<Bpersoninspectionattach> personinspectionattachwrapper = new EntityWrapper<Bpersoninspectionattach>();
			personinspectionattachwrapper.eq("inpectid", personinspection.getId());
			this.ibpersoninspectionattachService.delete(personinspectionattachwrapper);
			// 最后删除该巡检
			this.ibpersoninspectionService.deleteById(personinspection);
			return new Result(true);
		} catch (Exception e) {
			return new Result(false);
		}
	}

	/**
	 * 批量删除
	 * 
	 * @param personinspection
	 * @return
	 */
	@RequestMapping(value = "/deleteInspectByBatch", method = RequestMethod.POST)
	@ResponseBody
	public Result deleteInspectByBatch(@RequestBody List<Bpersoninspection> personinspectionList) {
		try {
			for (Bpersoninspection personinspection : personinspectionList) {
				// 如果删除的是任务巡检，那么需要更新任务的状态为下达状态
				Bpersoninspection personinspectionFullm = this.ibpersoninspectionService.selectById(personinspection);
				if (personinspectionFullm.getTypeid() == 1) {
					Btask task = this.ibtaskService.selectById(personinspectionFullm.getTaskid());
					// 任务巡检删除之后取消填入状态，置为下达状态
					task.setState((byte) 0);
					this.ibtaskService.updateById(task);
					EntityWrapper<Bfault> wrapper = new EntityWrapper<Bfault>();
					wrapper.eq("inpectid", personinspection.getId());
					this.ibfaultService.delete(wrapper);
				}
				EntityWrapper<Bpersoninspectionattach> personinspectionattachwrapper = new EntityWrapper<Bpersoninspectionattach>();
				personinspectionattachwrapper.eq("inpectid", personinspection.getId());
				this.ibpersoninspectionattachService.delete(personinspectionattachwrapper);
				this.ibpersoninspectionService.deleteById(personinspection);
			}
			return new Result(true);
		} catch (Exception e) {
			return new Result(false);
		}
	}

	/**
	 * 审核巡检的逻辑
	 * 
	 * @param personinspection
	 * @param finishcontent
	 * @return
	 */
	@RequestMapping(value = "/verify", method = RequestMethod.POST)
	@ResponseBody
	public Result verify(Bpersoninspection personinspection, String finishcontent) {
		try {
			// 审核通过
			personinspection.setState((byte) 1);
			personinspection.setVerifypersonid(getShiroUser().getId());
			// System.out.println("!!!!"+personinspection);
			// 暂定为任务巡检
			this.ibpersoninspectionService.updateById(personinspection);
			// 只有当是任务巡检的时候才需要同步更新任务的内容
			if (personinspection.getTaskid() != null) {
				Btask task = ibtaskService.selectById(personinspection.getTaskid());
				// 任务置为完成状态
				task.setState((byte) 2);
				task.setFilltime(personinspection.getFilltime());
				task.setFillperson(personinspection.getFillpersonid());
				task.setFinishcontent(finishcontent);
				this.ibtaskService.updateById(task);
			}
			return new Result(true);
		} catch (Exception e) {
			return new Result(false);
		}
	}

	/**
	 * 返回多表连接后的某一巡检的信息，主要目的是去获取图片信息
	 * 
	 * @param inspectid
	 * @return
	 */
	@RequestMapping("/getImageResourceOfThisInspect")
	public ResponseEntity<List<BpersoninspectionVo>> getImageResourceOfThisInspect(@RequestParam Long inspectid) {
		EntityWrapper<Bpersoninspection> wrapper = new EntityWrapper<Bpersoninspection>();
		wrapper.isWhere(true);
		wrapper.eq("p.id", inspectid);
		return ResponseEntity.ok(this.ibpersoninspectionService.getInspectVoList(wrapper));
	}

	@RequestMapping(value = "/deleteOneAttach", method = RequestMethod.POST)
	@ResponseBody
	@Transactional
	public Result deleteOneAttach(Bpersoninspectionattach bpersoninspectionattach) {
		try {
			this.ibpersoninspectionattachService.deleteById(bpersoninspectionattach);
			return new Result(true);
		} catch (Exception e) {
			return new Result(false);
		}
	}

	/**
	 * 跳转到修改页面
	 * 
	 * @param inspectid
	 * @param preurl
	 * @return
	 */
	@RequestMapping("/inspectEdit")
	public String gotoInspectEditPage(Model model, @RequestParam Long inspectid, @RequestParam String preurl) {
		model.addAttribute("inspectid", inspectid);
		model.addAttribute("preurl", preurl);
		return "maintain/inspectEdit";
	}

	/**
	 * 获取指定编号的巡检的信息
	 * 
	 * @param inspectid
	 * @return
	 */
	@RequestMapping("/getInspectVobyid")
	@ResponseBody
	public List<BpersoninspectionVo> getInspectVobyid(@RequestParam Long inspectid) {
		EntityWrapper<Bpersoninspection> wrapper = new EntityWrapper<Bpersoninspection>();
		wrapper.isWhere(true);
		wrapper.eq("p.id", inspectid);
		return this.ibpersoninspectionService.getInspectVoList(wrapper);
	}

	/**
	 * 在修改界面点击取消按钮后退回到上一个界面
	 * 
	 * @param model
	 * @param querystr
	 * @return
	 */
	@RequestMapping("/gotoInspectPageWithQuestr")
	public String gotoInspectPageWithQuerystr() {
		return "maintain/inspectManage";
	}
}
