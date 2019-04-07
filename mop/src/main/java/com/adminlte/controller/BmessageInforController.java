package com.adminlte.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.adminlte.commons.scan.Achievetype;
import com.adminlte.pojo.Bmessagedispatch;
import com.adminlte.pojo.Bmessageinfor;
import com.adminlte.pojo.Bmessageinforattach;
import com.adminlte.pojo.vo.BmessageinforVo;
import com.adminlte.pojo.vo.Result;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IBmessagedispatchService;
import com.adminlte.service.IBmessageinforService;
import com.adminlte.service.IBmessageinforattachService;
import com.adminlte.service.IUachievementService;
import com.adminlte.service.IWebsocketService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
/**
 * 消息控制
 * @author CGP
 */
@Controller
@RequestMapping("/message")
public class BmessageInforController extends BaseController {

	@Autowired
	IBmessageinforService messageService;
	@Autowired
	IBmessageinforattachService messageAttachService;
	@Autowired
	IBmessagedispatchService messageDisapathService;
	@Autowired
	IWebsocketService websocketService;
	@Autowired
	private IUachievementService achievementService;
	
	
	@RequestMapping("/sendView")
	public String sendView(Model model,@RequestParam("querystr") String querystr) {
		model.addAttribute("querystr", querystr);
		return "BmessageInfor/sendmessageManager";
	}
	@RequestMapping("/delView")
	public String delView(Model model,@RequestParam("querystr") String querystr) {
		model.addAttribute("querystr", querystr);
		return "BmessageInfor/processmessageManager";
	}
	@RequestMapping("/manager")
	public String manager() {
		return "BmessageInfor/sendmessageManager"; 
	}
	@RequestMapping("/processManger")
	public String processManger() {
		return "BmessageInfor/processmessageManager";
	}
	//跳转到发送信息查看界面
	@RequestMapping("/SendMessageDetail")
	public String SendMessageDetail(@RequestParam("messageid") String messageid,Model model) {
		model.addAttribute("messageid", messageid);
		return "BmessageInfor/SendMessageDetail";
	}
	//跳转到处理信息查看界面
	@RequestMapping("/DealMessageDetail")
	public String DealMessageDetail(@RequestParam("messageid") String messageid,Model model) {
		model.addAttribute("messageid", messageid);
		return "BmessageInfor/DealMessageDetail";
	}
	//跳转到处理信息处理界面
	@RequestMapping("/DealMessageEdit")
	public String DealMessageEdit(@RequestParam("messageid") String messageid,Model model) {
		model.addAttribute("messageid", messageid);
		return "BmessageInfor/DealMessageEdit";
	}
	
	//https://www.cnblogs.com/fingerboy/p/6657118.html
	@RequestMapping(value = "/dataGrid", method = RequestMethod.POST)
	public ResponseEntity<DatatablesResult> manager(String querystring,
			@RequestParam(value = "draw") String draw,
			@RequestParam(value = "start") String start,
			@RequestParam(value = "length") String length) {
		int rows = Integer.parseInt(length);
		int page = (Integer.parseInt(start) / rows) + 1;
		try {
			String name = null;
			if(null != querystring){
				name = querystring;
			}
			//对消息进行一个倒排序，并根据当前登录用户的id遍历出其发送的消息
			EntityWrapper<BmessageinforVo> wrapper = new EntityWrapper<BmessageinforVo>();
	        //根据当前选定的条件id，来筛选出数据。
	        Long useId = this.getUserId();
	        if(null!=name && !name.equals("kong")){
	        	wrapper.isWhere(true).like("m.title", name);
	        }
	        wrapper.isWhere(true).where("m.user_id={0}", useId);
	        wrapper.orderBy("createtime",false);
			DatatablesResult datatablesResult = this.messageService.selectDataGridWrapper(page, rows, Integer.parseInt(draw),wrapper );
			return ResponseEntity.ok(datatablesResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	
	/**
	 * By CGP
	 * 加载发送预览界面需要填充的数据
	 * */
		@RequestMapping(value = "/getMessagebyid/{messageid}", method = RequestMethod.POST)
		@ResponseBody
		@Transactional
		public ResponseEntity<List<BmessageinforVo>> getMessagebyid(Long messageid)
		{
			try {
				System.out.println(messageService.selectMessageByMessageId(messageid)+"AAAAAAAAAAA");
				return ResponseEntity.ok(messageService.selectMessageByMessageId(messageid));
			}catch(Exception e){
				System.out.println(e.toString());
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
			}
		}
		/**
		 * By CGP
		 * 加载处理预览界面需要填充的数据
		 * */
			@RequestMapping(value = "/getDisMessagebyid/{messageid}", method = RequestMethod.POST)
			@ResponseBody
			@Transactional
			public ResponseEntity<List<BmessageinforVo>> getDisMessagebyid(Long messageid)
			{
				try {
			        Bmessagedispatch bmessagedispatch = messageDisapathService.selectById(messageid);
					Long msid = bmessagedispatch.getMessageId();
					Integer state = bmessagedispatch.getState();
					List<BmessageinforVo> bmessageinforvo= messageService.selectMessageByMessageId(msid);
					bmessageinforvo.get(0).setState(state);
					return ResponseEntity.ok(bmessageinforvo);
			        
				}catch(Exception e){
					System.out.println(e.toString());
					return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
				}
			}
	
	/**
	 *by CGP
	 * 根据标题查询发送的信息
	 */
	@RequestMapping(value = "/getMessageInfoByTitle/{querystring}", method = RequestMethod.POST)
    @ResponseBody
	public ResponseEntity<DatatablesResult> getMessageInfoByTitle(
			@PathVariable("querystring") String querystring,
			@RequestParam(value = "draw") String draw,
			@RequestParam(value = "start") String start,
			@RequestParam(value = "length") String length) {
		int rows = Integer.parseInt(length);
		int page = (Integer.parseInt(start) / rows) + 1;
		try {
			EntityWrapper<BmessageinforVo> wrapper = new EntityWrapper<BmessageinforVo>();
	        Long useId = this.getUserId();
	        wrapper.orderBy("createtime",false);
			DatatablesResult datatablesResult = null;
			if(querystring.equals("kong")==false){
				wrapper.isWhere(true).eq("m.user_id={0}", useId);
				wrapper.isWhere(true).like("m.title", querystring);
				datatablesResult = this.messageService.selectDataGridWrapper(page, rows, Integer.parseInt(draw),wrapper );
			}else{
				wrapper.isWhere(true).eq("m.user_id={0}", useId);
				datatablesResult = this.messageService.selectDataGridWrapper(page, rows, Integer.parseInt(draw),wrapper );
			}
			return ResponseEntity.ok(datatablesResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	
	/**
	 *by CGP
	 * 添加发送的信息
	 * 将附件和接收人员分别填充到bmessageinfoattach和bmessagedispath表中
	 */
	@RequestMapping(value = "/addMessageInfo", method = RequestMethod.POST)
	@ResponseBody
	@Transactional //没有弄起，需要研究
	public Result addMessageInfo(Bmessageinfor messageinfors,String fileliststr,String receiveuserId)
	{
		try {
			//获取当前用户
			messageinfors.setUserId(this.getUserId());
			//获取当前时间
			Date createTime=new Date();
			messageinfors.setCreatetime(createTime);
			Long messageId = messageinfors.getId();
			//将附件的内容，填充到bmessageinfoattach表中
			List<Bmessageinforattach> attachList=null;
			List<Bmessageinforattach> attachListnew=null;
			if(fileliststr.length() > 0){
				fileliststr = fileliststr.replaceAll("&quot;","\""); //
				ObjectMapper mapper = new ObjectMapper();
				JavaType jt = mapper.getTypeFactory().constructParametricType(ArrayList.class, Bmessageinforattach.class);
				attachList = (List<Bmessageinforattach>)mapper.readValue(fileliststr,jt);
				attachListnew = new ArrayList<Bmessageinforattach>();	
			}else{
			}
			//如果消息不为空，则进行更新操作
			if (messageId != null && messageService.selectById(messageId) != null) {
				messageService.updateById(messageinfors);
				EntityWrapper<Bmessageinforattach> wrapper = new EntityWrapper<Bmessageinforattach>();
				wrapper.where("message_id={0}", messageId);
				messageAttachService.delete(wrapper);	
				if(attachList !=null){
					messageAttachService.insertBatch(attachList);
				}else{
				}
			} else {
				//如果消息为空，则将消息添加进来，并分别添加接收人员和附件
				//1.添加消息
				messageService.insert(messageinfors);
				//2.添加附件的内容(如果一个附件都没有的话)
				if (attachList.size() > 0) {
					for (Bmessageinforattach bmessageinfoattach : attachList) {
						/*bmessageinfoattach.setId(messageinfors.getId());*/
						bmessageinfoattach.setMessageId(messageinfors.getId());//将消息的id传入到bmessageinfoattach的message_id
						bmessageinfoattach.setRemark(messageinfors.getRemark());
						attachListnew.add(bmessageinfoattach);
					}
					System.out.println("ppp:" + attachListnew.size());
					messageAttachService.insertBatch(attachListnew);
				}else{
				}
				//3.添加接收人员
				Bmessagedispatch bmessagedispath = new Bmessagedispatch();
						//解析前台传过来的字符串receiveuserI，将其转化为字符串数组，并遍历该数组对应的存入到表中
				if(receiveuserId.length()>0){
					String str = receiveuserId;
					String[] result = str.split(",");
					for(int i=0;i<result.length;i++) {
						bmessagedispath.setReceiveuserId(Long.parseLong(result[i]));
						System.out.println(Long.parseLong(result[i])+"MMMMMMMMM");
						bmessagedispath.setMessageId(messageinfors.getId());
						bmessagedispath.setState(0);
						System.out.println("aaaaaaaaaaaaaaaaaaaaaaa"+messageinfors.getId()+"aaaaaaaaaaaaaaaaaaaaaaa");
						messageDisapathService.insert(bmessagedispath);
					}
				}else{
				}
				
			}
			achievementService.updatedata(Achievetype.NEWMESSAGE, this.getUserId());
		} catch (Exception e) {
			System.out.println(e.toString());
			return new Result(false);
		}

		return new Result(true);
	}
	/**
	 *by CGP
	 * 通过id删除消息中的bmessageattach
	 */
	@RequestMapping(value = "/deleteMessageAttachById", method = RequestMethod.POST)
	@ResponseBody
	@Transactional
	public Result deletemilestoneattachbyid(Long id){
		try {
			//System.out.println("dddddddddddddddd:"+id);
			messageAttachService.deleteById(id);
			return new Result(true);
		}catch(Exception e){
			System.out.println(e.toString());
			return new Result(false);
		}
	}
	/**
	 * by CGP
	 * 删除一个或多个信息
	 */
	@RequestMapping(value = "/delectMessage", method = RequestMethod.POST) 
	public ResponseEntity<Map<String, Object>> delectOneOrMoreMessageInfo(Long[] message_id){
		Map<String, Object> result = new HashMap<String, Object>();
		List<Long> message_ids = Arrays.asList(message_id);
		try {
			Boolean bool = messageService.delectMessageInfo(message_ids);
			if (bool) {
				result.put("msg", "删除成功");
			}else{
				System.out.println("aaaaa");
				result.put("msg", "删除失败");
			}
			achievementService.updatedata(Achievetype.DELETEMESSAGE, this.getUserId());
		} catch (Exception e) {
			System.out.println("bbbb");
			result.put("msg", "删除失败");
			e.printStackTrace();
		}
		return ResponseEntity.ok(result);
	}	
	/**
	 * by CGP(由于是根据消息的id从表中去选择数据，需要对选择的数据进行一个重新的排序。还没理解到)
	 * 首先遍历出BmessagedispatchVo的值，然后通过登录用户的id与receiveUserid的配对，
	 * 查出BmessageinforVo里的信息，添加到消息处理的相关表格中
	 * @param BmessagedispatchVo 
	 */
	@RequestMapping(value = "/dataMessageGrid", method = RequestMethod.POST)
    @ResponseBody
    @Transactional
	public ResponseEntity<DatatablesResult> getMessageInfoByUserId(String querystring,
			@RequestParam(value = "draw") String draw,
			@RequestParam(value = "start") String start,
			@RequestParam(value = "length") String length) {
		int rows = Integer.parseInt(length);
		int page = (Integer.parseInt(start) / rows) + 1;
		try {
			//1.获取当前用户的id
			Long userId = this.getUserId();
			//2.首先获取所有的Bmessagedispatch
			List<Bmessagedispatch> bmessagedispatch = messageDisapathService.selectAllBmessagedispatch();
			//想要接收什么样的数据类型，声明对象的时候就要指定其类型
			List<BmessageinforVo> list1=new ArrayList<BmessageinforVo>();
			for(int i=0;i<bmessagedispatch.size();i++){//i要从0开始遍历，因为table的行是从0开始的
				Long user_id=bmessagedispatch.get(i).getReceiveuserId();
				System.out.println(user_id+"adaddd");
				if(user_id!=null && user_id==userId){
					System.out.println(user_id+"adaddd");
					//3.将获取的用户id与BmessagedispatchVo中的receiveuserId进行匹对
					//如果存在相等的用户id，得到当前id的message_id
					Long message_id = bmessagedispatch.get(i).getMessageId();
					Integer state = bmessagedispatch.get(i).getState();
					Long id = bmessagedispatch.get(i).getId();
					System.out.println(message_id);
					//根据message_id从messageinfo中查出对应的消息，并将相应的字段填到消息处理表中
					List<BmessageinforVo> bmessageinforVo = messageService.selectMessageByMessageId(message_id);
					/*bmessageinforVo.get(3).setState(state);*/
					//应该准确的找出每一个参数对应的index，然后将dispath的state赋值给它,bmessageinforVo的长度用size()获得
					if(!querystring.equals("kong")){
						if(bmessageinforVo.get(0).getUserName().indexOf(querystring)!=-1){
							for(int j=0;j<bmessageinforVo.size();j++){
								bmessageinforVo.get(j).setState(state);
								bmessageinforVo.get(j).setId(id);
							}
							list1.addAll(bmessageinforVo);
						}
					}else{
						for(int j=0;j<bmessageinforVo.size();j++){
							bmessageinforVo.get(j).setState(state);
							bmessageinforVo.get(j).setId(id);
						}
						list1.addAll(bmessageinforVo);
					}	
				}
			}
			Collections.reverse(list1);//将list进行倒叙排列
			List<BmessageinforVo> list2=new ArrayList<BmessageinforVo>();
			for(int i=0;i<list1.size();i++)
			{
				list2.add(i,list1.get(i));
			}
			DatatablesResult datatablesResult = this.messageService.selectDataGrid(page, rows, Integer.parseInt(draw) );
			datatablesResult.setData(list2);
			
			return ResponseEntity.ok(datatablesResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	
	/*By cgp
	 * 消息处理页面进行删除
	 */
	@RequestMapping(value = "/deleteDealMessage",method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> delectOneOrMoreDealMessage(Long[] id){
		Map<String, Object> result = new HashMap<String, Object>();
		List<Long> ids = Arrays.asList(id);
		try {
			Boolean bool = messageDisapathService.delectDealMessage(ids);
			if (bool) {
				result.put("msg", "删除成功");
			}else{
				result.put("msg", "删除失败");
			}
		} catch (Exception e) {
			result.put("msg", "删除失败");
			e.printStackTrace();
		}
		return ResponseEntity.ok(result);
	}
	/*by cgp
	 * 保存消息处理后的状态
	 */
	@RequestMapping(value = "/addDealMessageInfo", method = RequestMethod.POST)
	@ResponseBody
	public Result addDealMessageInfo(Bmessagedispatch bmessagedispatch,Integer state){
			//根据id得到当前的dispath
			if(bmessagedispatch.getId() != null){
				bmessagedispatch.setState(state);
				messageDisapathService.updateById(bmessagedispatch);
			}else{
				messageDisapathService.insert(bmessagedispatch);
			}
			return new Result(true);
	}
	/*by cgp
	 * 根据发送人查询处理的信息
	 */
	@RequestMapping(value = "/getDealMessageInfoByuserName/{querystring}", method = RequestMethod.POST)
    @ResponseBody
	public ResponseEntity<DatatablesResult> getDealMessageInfoByTitle(
			@PathVariable("querystring") String querystring,
			@RequestParam(value = "draw") String draw,
			@RequestParam(value = "start") String start,
			@RequestParam(value = "length") String length) {
		int rows = Integer.parseInt(length);
		int page = (Integer.parseInt(start) / rows) + 1;
		try {
			//1.获取用户id
			DatatablesResult datatablesResult = null;
			Long userId = this.getUserId();
			//2.查询用户接收的消息，根据消息的id，获取消息
			List<Bmessagedispatch> bmessagedispatch = messageDisapathService.selectAllBmessagedispatch();
			List<BmessageinforVo> list1=new ArrayList<BmessageinforVo>();
				for(int i=0;i<bmessagedispatch.size();i++){//i要从0开始遍历，因为table的行是从0开始的
					Long user_id=bmessagedispatch.get(i).getReceiveuserId();
					System.out.println(user_id+"adaddd");
					if(user_id!=null && user_id==userId){
						System.out.println(user_id+"adaddd");
						//3.将获取的用户id与BmessagedispatchVo中的receiveuserId进行匹对
						//如果存在相等的用户id，得到当前id的message_id
						Long message_id = bmessagedispatch.get(i).getMessageId();
						Integer state = bmessagedispatch.get(i).getState();
						Long id = bmessagedispatch.get(i).getId();
						//根据message_id从messageinfo中查出对应的消息，并将相应的字段填到消息处理表中
						List<BmessageinforVo> bmessageinforVo = messageService.selectMessageByMessageId(message_id);
						//根据筛选框中的值是否为空，加载查询后和未查询后的界面
						if(!querystring.equals("kong")){
							if(bmessageinforVo.get(0).getUserName().indexOf(querystring)!=-1){
								for(int j=0;j<bmessageinforVo.size();j++){
									bmessageinforVo.get(j).setState(state);
									bmessageinforVo.get(j).setId(id);
								}
								list1.addAll(bmessageinforVo);
							}
						}else{
							for(int j=0;j<bmessageinforVo.size();j++){
								bmessageinforVo.get(j).setState(state);
								bmessageinforVo.get(j).setId(id);
							}
							list1.addAll(bmessageinforVo);
						}
					}
				}
				Collections.reverse(list1);//将list进行倒叙排列
				List<BmessageinforVo> list2=new ArrayList<BmessageinforVo>();
				for(int i=0;i<list1.size();i++)
				{
					list2.add(i,list1.get(i));
				}
				datatablesResult = this.messageService.selectDataGrid(page, rows, Integer.parseInt(draw) );
				datatablesResult.setData(list2);
			return ResponseEntity.ok(datatablesResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	

	
}
