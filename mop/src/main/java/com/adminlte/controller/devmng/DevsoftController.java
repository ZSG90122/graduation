package com.adminlte.controller.devmng;

import java.util.ArrayList;
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
import com.adminlte.pojo.Bdevsoft;
import com.adminlte.pojo.Bdevsoftparameter;
import com.adminlte.pojo.vo.BdevsoftVo;
import com.adminlte.pojo.vo.Result;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IBdevsoftService;
import com.adminlte.service.IBdevsoftparameterService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;

/**
 * 遥控站配套系统的相关配套设备的Controller
 * 
 * @author zsg
 *
 */
@Controller
@RequestMapping("/devsoft")
public class DevsoftController extends BaseController {

	@Autowired
	IBdevsoftService bdevsoftService;

	@Autowired
	IBdevsoftparameterService bdevsoftparameterService;

	/**
	 * 查询得到用于填充前端表格的对象（包含该表中的所有数据，由多表连接查询得到）
	 * 
	 * @return
	 * 
	 */
	@RequestMapping("/devsoftdataGrid")
	public ResponseEntity<DatatablesResult> devsoftdataGrid(String querystring,
			@RequestParam(value = "draw") String draw, @RequestParam(value = "start") String start,
			@RequestParam(value = "length") String length) {
		int rows = Integer.parseInt(length);
		int page = (Integer.parseInt(start) / rows) + 1;
		String depId = null;// 所属部门（市州）的id，来自于第一个下拉列表
		String rchouseId = null;// 所属遥控站的id，来自于第二个下拉列表
		String systemId = null;// 系统名称，来自于第三个下拉列表
		String devName = null;// 设备名称，来自于搜索框内
		if (querystring != null) {
			String str1[] = querystring.split(",");
			int i;
			for (i = 0; i < str1.length; ++i) {
				String str2[] = str1[i].split(":");
				if (str2.length < 2)
					continue;
				switch (str2[0]) {
				case "depid":
					depId = str2[1];
					break;
				case "stationdevhouseid":
					rchouseId = str2[1];
					break;
				case "systemid":
					systemId = str2[1];
					break;
				case "name":
					devName = str2[1];
					break;
				}
			}
		}
		try {
			EntityWrapper<Bdevsoft> wrapper = new EntityWrapper<Bdevsoft>();
			if (null != depId && !depId.equals("-1")) {
				wrapper.isWhere(true);
				wrapper.eq("depid", depId);
			}
			if (rchouseId != null && !rchouseId.equals("-1")) {
				wrapper.isWhere(true);
				wrapper.eq("rchouseid", rchouseId);
			}
			if (systemId != null && !systemId.equals("-1")) {
				wrapper.isWhere(true);
				wrapper.eq("systemtypeid", systemId);
			}
			if (devName != null && devName.length() > 0) {
				wrapper.isWhere(true);
				wrapper.like("v.name", devName);
			}
			wrapper.orderBy("id");
			DatatablesResult datatablesResult = this.bdevsoftService.selectVoDataGridWrapper(page, rows,
					Integer.parseInt(draw), wrapper);
			return ResponseEntity.ok(datatablesResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}

	/**
	 * 向bdevsoft表中插入一条数据
	 * 
	 * @param bdevsoft
	 * @return
	 */
	@RequestMapping(value = "/insertDevSoft", method = RequestMethod.POST)
	@ResponseBody
	public Result insertDevSoft(Bdevsoft bdevsoft) {
		try {
			this.bdevsoftService.insert(bdevsoft);
			return new Result(true);
		} catch (Exception e) {
			return new Result(false);
		}
	}

	/**
	 * @param bdevsoftVo
	 * @return
	 */
	@RequestMapping(value = "/insertDevSoftVo", method = RequestMethod.POST)
	@ResponseBody
	public Result insertDevSoftVo(@RequestBody BdevsoftVo bdevsoftVo) {
		try {
			// 在此处出现了一个问题，那就是springMVC无法解析复杂的bean
			// http://www.bmchild.com/2014/02/spring-mvc-3-property-referenced-in.html
			// 暂时没有找到合适的方法，待改善
			Bdevsoft bdevsoft = new Bdevsoft(null, bdevsoftVo.getRchouseid(), bdevsoftVo.getDevcode(),
					bdevsoftVo.getName(), bdevsoftVo.getSystemtypeid(), bdevsoftVo.getDevtypeid(),
					bdevsoftVo.getMaintenid(), bdevsoftVo.getTypecode(), bdevsoftVo.getMngpersonid(),
					bdevsoftVo.getDepid(), bdevsoftVo.getApplication(), bdevsoftVo.getProviderenterpriseid(),
					bdevsoftVo.getMadeenterpriseid(), bdevsoftVo.getLeavedate(), bdevsoftVo.getLeavecode(),
					bdevsoftVo.getBuydate(), bdevsoftVo.getBuyaddress(), bdevsoftVo.getDevrevalue(),
					bdevsoftVo.getAssectcode(), bdevsoftVo.getBuyperson(), bdevsoftVo.getQualdate(),
					bdevsoftVo.getRepairdate(), bdevsoftVo.getScrapdate(), bdevsoftVo.getInstallrchouseid(),
					bdevsoftVo.getUsepersonid(), bdevsoftVo.getInstalldate(), bdevsoftVo.getInstallenterpriseid(),
					bdevsoftVo.getInstallreson(), bdevsoftVo.getMainip(), bdevsoftVo.getMainport(),
					bdevsoftVo.getTprotocal1(), bdevsoftVo.getTprotocal2(), bdevsoftVo.getUsername(),
					bdevsoftVo.getPassword(), bdevsoftVo.getRemark());
			this.bdevsoftService.insert(bdevsoft);
			for (Bdevsoftparameter bdevsoftparameter : bdevsoftVo.getParameterList()) {
				bdevsoftparameter.setDevsoftid(bdevsoft.getId());
				this.bdevsoftparameterService.insert(bdevsoftparameter);
			}
			return new Result(true);
		} catch (Exception e) {
			return new Result(false);
		}
	}

	/**
	 * 修改bdevsoft表中的一条数据
	 *
	 * @param bdevsoft
	 * @return
	 */
	@RequestMapping(value = "/updateDevSoft", method = RequestMethod.POST)
	@ResponseBody
	public Result updateDevSoft(Bdevsoft bdevsoft) {
		try {
			System.out.println(bdevsoft);
			this.bdevsoftService.updateById(bdevsoft);
			return new Result(true);
		} catch (Exception e) {
			return new Result(false);
		}
	}

	/**
	 * 涉及到多表修改操作，与bdevsoft表相关的表有bdevsoftmaterial，
	 * bdevsoftparameter，bdevsoftparts
	 * 
	 * @param bdevsoftVo
	 * @return
	 */
	@RequestMapping(value = "/updateDevSoftVo", method = RequestMethod.POST)
	@ResponseBody
	public Result updateDevSoft(@RequestBody BdevsoftVo bdevsoftVo) {
		try {
			// 构造Bdevsoft的那一部分
			Bdevsoft bdevsoft = new Bdevsoft(bdevsoftVo.getId(), bdevsoftVo.getRchouseid(), bdevsoftVo.getDevcode(),
					bdevsoftVo.getName(), bdevsoftVo.getSystemtypeid(), bdevsoftVo.getDevtypeid(),
					bdevsoftVo.getMaintenid(), bdevsoftVo.getTypecode(), bdevsoftVo.getMngpersonid(),
					bdevsoftVo.getDepid(), bdevsoftVo.getApplication(), bdevsoftVo.getProviderenterpriseid(),
					bdevsoftVo.getMadeenterpriseid(), bdevsoftVo.getLeavedate(), bdevsoftVo.getLeavecode(),
					bdevsoftVo.getBuydate(), bdevsoftVo.getBuyaddress(), bdevsoftVo.getDevrevalue(),
					bdevsoftVo.getAssectcode(), bdevsoftVo.getBuyperson(), bdevsoftVo.getQualdate(),
					bdevsoftVo.getRepairdate(), bdevsoftVo.getScrapdate(), bdevsoftVo.getInstallrchouseid(),
					bdevsoftVo.getUsepersonid(), bdevsoftVo.getInstalldate(), bdevsoftVo.getInstallenterpriseid(),
					bdevsoftVo.getInstallreson(), bdevsoftVo.getMainip(), bdevsoftVo.getMainport(),
					bdevsoftVo.getTprotocal1(), bdevsoftVo.getTprotocal2(), bdevsoftVo.getUsername(),
					bdevsoftVo.getPassword(), bdevsoftVo.getRemark());
			// 对Bdevsoft这一部分进行更新
			this.bdevsoftService.updateById(bdevsoft);
			// 对它附带的那部分参数进行修改（这个涉及到多个方面的考虑，要复杂一点）
			for (Bdevsoftparameter bdevsoftparameter : bdevsoftVo.getParameterList()) {
				// 在前端添加进去的行，直接执行插入操作就好，反正id是自增的
				if (bdevsoftparameter.getId() == null) {
					bdevsoftparameter.setDevsoftid(bdevsoftVo.getId());
					this.bdevsoftparameterService.insert(bdevsoftparameter);
				}
			}

			EntityWrapper<Bdevsoftparameter> wrapper = new EntityWrapper<Bdevsoftparameter>();
			wrapper.eq("devsoftid", bdevsoftVo.getId());
			List<Bdevsoftparameter> queryList = this.bdevsoftparameterService.selectList(wrapper);
			List<Bdevsoftparameter> parameterWithIdList = new ArrayList<Bdevsoftparameter>();
			for (Bdevsoftparameter bdevsoftparameter : bdevsoftVo.getParameterList()) {
				if (bdevsoftparameter.getId() != null) {
					parameterWithIdList.add(bdevsoftparameter);
				}
			}
			// 执行了删除操作
			if (parameterWithIdList.size() < queryList.size()) {
				// 判断那些项是不在的，利用List的contains方法，需要重写Bdevsoftparameter的equals()方法
				for (Bdevsoftparameter bdevsoftparameter : queryList) {
					if (!parameterWithIdList.contains(bdevsoftparameter)) {
						this.bdevsoftparameterService.deleteById(bdevsoftparameter);
					} else {
						// 包括就执行更新操作
						this.bdevsoftparameterService.updateById(bdevsoftparameter);
					}
				}
			} else {
				for (Bdevsoftparameter bdevsoftparameter : queryList) {
					// 执行更新操作
					this.bdevsoftparameterService.updateById(bdevsoftparameter);
				}
			}
			return new Result(true);
		} catch (Exception e) {
			return new Result(false);
		}
	}

	/**
	 * 删除一条数据
	 * 
	 * @param bdevsoft
	 * @return
	 */
	@RequestMapping(value = "/deleteDevSoft", method = RequestMethod.POST)
	@ResponseBody
	public Result deleteDevSoft(Bdevsoft bdevsoft) {
		try {
			EntityWrapper<Bdevsoftparameter> wrapper = new EntityWrapper<Bdevsoftparameter>();
			wrapper.eq("devsoftid", bdevsoft.getId());
			this.bdevsoftService.deleteById(bdevsoft.getId());
			this.bdevsoftparameterService.delete(wrapper);
			return new Result(true);
		} catch (Exception e) {
			return new Result(false);
		}
	}

	/**
	 * 批量删除
	 */
	@RequestMapping(value = "/deleteDevSoftBatch", method = RequestMethod.POST)
	@ResponseBody
	public Result deleteDevSoftBatch(@RequestBody List<Bdevsoft> bdevsoftList) {
		try {
			
			for (Bdevsoft bdevsoft : bdevsoftList) {
				EntityWrapper<Bdevsoftparameter> wrapper = new EntityWrapper<Bdevsoftparameter>();
				// 批量删除外键为该devsoftid的参数
				wrapper.eq("devsoftid", bdevsoft.getId());
				boolean tag=bdevsoftparameterService.delete(wrapper);
				bdevsoftService.deleteById(bdevsoft.getId());
			}
			return new Result(true);
		} catch (Exception e) {
			return new Result(false);
		}
	}

	/**
	 * List形式返回得到devsoft表中的所有数据
	 * 
	 * @return
	 */
	@RequestMapping(value = "/getDevSoftList", method = RequestMethod.POST)
	@ResponseBody
	public List<Bdevsoft> getDevSoftList() {
		EntityWrapper<Bdevsoft> wrapper = new EntityWrapper<Bdevsoft>();
		return bdevsoftService.selectList(wrapper);
	}

}
