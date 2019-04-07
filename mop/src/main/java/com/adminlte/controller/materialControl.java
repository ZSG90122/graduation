package com.adminlte.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import com.adminlte.mapper.DocdepdocMapper;
import com.adminlte.pojo.Docdepdoc;
import com.adminlte.pojo.Doctype;
import com.adminlte.pojo.TreeNode;
import com.adminlte.pojo.User;
import com.adminlte.pojo.vo.Result;
import com.adminlte.pojo.vo.docdepVo;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IDocdepdocService;
import com.adminlte.service.IDoctypeService;
import com.adminlte.service.IUachievementService;
import com.adminlte.service.IUserService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
/*
 * 云盘资料管理
 * */
@Controller
@RequestMapping("/datamanager")
public class materialControl extends BaseController{

	@Autowired
	IDoctypeService DoctypeService;
	@Autowired
	IDocdepdocService DocdepdocService;
	@Autowired
    private DocdepdocMapper docdepdocMapper;
	@Autowired
	private IUachievementService achievementService;
	@Autowired
	IUserService userService;
	@RequestMapping("/doceditView")
	public String doceditView(Model model,@RequestParam("querystr") String querystr) {
		model.addAttribute("querystr", querystr);
		return "docmaterial/findAllWord";  //测试页面
	}
	@RequestMapping("/docView")
	public String docView(Model model,@RequestParam("querystr") String querystr) {
		model.addAttribute("querystr", querystr);
		return "docmaterial/showWordType";  //测试页面
	}
	//跳转到word信息修改界面
	@RequestMapping("/wordEdit")
	public String wordEdit(@RequestParam("wordid") String wordid,Model model) {
		model.addAttribute("wordid", wordid);
		return "docmaterial/WordEdit";
	}
	//r跳转到word信息查看界面
	@RequestMapping("/WordDetail")
	public String WordDetail(@RequestParam("wordid") String wordid,Model model) {
		model.addAttribute("wordid", wordid);
		return "docmaterial/WordDetail";
	}	
	/*
	 *  
	 * 文档类别操作
	 * */
	@RequestMapping("/wordTyple")
	public String wordTyple(Model model) {
		return "docmaterial/wordTyple";
	}
	/*
	 * datamanager/findWord
	 * 文档资料操作
	 * */
	@RequestMapping("/findWord")
   public String findWord(Model model) {
		return "docmaterial/findAllWord";
	}
	/*
	 * 文档类型查看
	 * */
	@RequestMapping("/showWordType")
   public String showWordType(Model model) {
		return "docmaterial/showWordType";
	}
	
	/**
	 * 返回文档类别的树结构
	 * 
	 * 
	 * 根据用户的等级来控制其查看的文档机密程度
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/treeData", method = RequestMethod.POST)
		@ResponseBody 
		public List<TreeNode> TreeData()
		{
//		加入权限后 会限制查看文档的类型
		return DoctypeService.getTreeData();
		}
	
	/*
	 * 文档类别的保存和更新
	 * 
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseBody
	public Result save(Doctype doctype)
	{
		System.out.println("文档类型:"+doctype.getName());
		Long doctype_id = doctype.getId();
		if(doctype_id != null){	
			DoctypeService.updateById(doctype);
		}else{
			DoctypeService.insert(doctype);
			achievementService.updatedata(Achievetype.NEWDOCUMENT, this.getUserId());
		}
		return new Result(true);
	}
	/*
	 * 获取文档类别id
	 * 
	 */
	@RequestMapping(value = "/get/{id}", method = RequestMethod.POST)
    @ResponseBody
    public Doctype get(@PathVariable("id") String id) {
		return DoctypeService.selectById(id);
    }
	
	/*
	 * 根据文档类别id号，删除文档类别
	 */
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.POST)
	@ResponseBody
	@Transactional
	public Result delete(Doctype doctype)
	{
		Long doctype_id = doctype.getId();
		try {
			DoctypeService.deleteById(doctype);
			achievementService.updatedata(Achievetype.DELETEDOCUMENT, this.getUserId());
			return new Result(true);
		}catch(Exception e){
			System.out.println(e.toString());
			return new Result(false);
		}
	}
	/*  
	 * 文档分发管理
	 * */
	@RequestMapping("/sendWord")
	public String sendWord(Model model) {
		return "docmaterial/sendWord";
	}
	/*
	 * 文档详情查看
	 * */
	@RequestMapping("/showWord")
	public String showWord(Model model) {
		return "docmaterial/showWord";
	}
	/* 
	 * 添加文档
	 * */
	@RequestMapping("/addWords")
	public String addWords(Model model) {
		return "docmaterial/addWords";
	}
	/*By CGP
	 * 文档资料管理初始加载界面，获取所有的文档资料信息，显示在页面上（只管理自己所上传的文档信息；如果可以管理整个部门的话会有点混乱）
	 */
	@RequestMapping(value = "/getAllDocInfo", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<DatatablesResult> getAllDocInfo(String querystring,
			@RequestParam(value = "draw") String draw,
			@RequestParam(value = "start") String start,
			/*@RequestParam(value = "userId") String userId,*/
			@RequestParam(value = "length") String length,
			HttpServletRequest request) {
		int rows = Integer.parseInt(length);
		int page = (Integer.parseInt(start) / rows) + 1;
		User user =(User)request.getSession().getAttribute("user");
		long perlevel = user.getLevel();
		try {
			EntityWrapper<docdepVo> wrapper = new EntityWrapper<docdepVo>();
			Long personid = user.getId();
			if(querystring.equals("kong")==false && querystring.equals("")==false){
				String[] querystring1=querystring.split(",");
				
				if(querystring1[0].equals("")==false && !querystring1[0].equals("kong")){
		        	wrapper.isWhere(true).like("title", querystring1[0]);
		        }
				if(querystring1[1].equals("")==false && !querystring1[1].equals("k")){
		        	wrapper.isWhere(true).eq("dtype", querystring1[1]);
		        }
			}
			wrapper.isWhere(true).eq("pubperson", personid);
			DatatablesResult datatablesResult = this.DocdepdocService.selectDataGridVoWrapper(page, rows, Integer.parseInt(draw),wrapper);
			return ResponseEntity.ok(datatablesResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	//文档查看加载页面（此处根据用户与文档的密级进行查看）
	@RequestMapping(value = "/getAllDocInfoView", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<DatatablesResult> getAllDocInfoView(String querystring,
			@RequestParam(value = "draw") String draw,
			@RequestParam(value = "start") String start,
			/*@RequestParam(value = "userId") String userId,*/
			@RequestParam(value = "length") String length,
			HttpServletRequest request) {
		int rows = Integer.parseInt(length);
		int page = (Integer.parseInt(start) / rows) + 1;
		// 前端根据用户等级 限制浏览内容
		User user =(User)request.getSession().getAttribute("user");
		long perlevel = user.getLevel();
		try {
			EntityWrapper<docdepVo> wrapper = new EntityWrapper<docdepVo>();
			List<docdepVo> docdepvonew = new ArrayList<docdepVo>();
			if(querystring.equals("kong")==false && querystring.equals("")==false){
				String[] querystring1=querystring.split(",");
				
				if(querystring1[0].equals("")==false && !querystring1[0].equals("kong")){
		        	wrapper.isWhere(true).like("title", querystring1[0]);
		        }
				if(querystring1[1].equals("")==false && !querystring1[1].equals("k")){
		        	wrapper.isWhere(true).eq("dtype", querystring1[1]);
		        }
			}
			DatatablesResult datatablesResult = this.DocdepdocService.selectDataGridVoWrapper(page, rows, Integer.parseInt(draw),wrapper);
			Long level = userService.selectById(this.getUserId()).getLevel();
			List<docdepVo> docdepVos = datatablesResult.getData();
			if (!"null".equals(docdepVos)) {
				
				for(int i=0;i<docdepVos.size();i++){
					if(docdepVos.get(i).getSeclevel() <= level){
						docdepvonew.add(docdepVos.get(i));
					}
				}
				datatablesResult.setData(docdepvonew);
			} 
			return ResponseEntity.ok(datatablesResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	/*By CGP
	 * 根据用户选择的文档类型的id,获取该id下的文档信息(文档资料管理界面)
	 */
	@RequestMapping(value = "/getAllDocInfoeditById/{docdepId}", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<DatatablesResult> getAllDocInfoeditById(
    		@PathVariable(value = "docdepId") String docdepId,
			@RequestParam(value = "draw") String draw,
			/*@RequestParam(value = "userId") String userId,*/
			@RequestParam(value = "start") String start,
			@RequestParam(value = "length") String length,
			HttpServletRequest request) {
		User user =(User)request.getSession().getAttribute("user");
		long perlevel = user.getLevel();
		int rows = Integer.parseInt(length);
		int page = (Integer.parseInt(start) / rows) + 1;
		try {
			EntityWrapper<docdepVo> wrapper = new EntityWrapper<docdepVo>();
			wrapper.isWhere(true).eq("dtype", docdepId);
			Long personid = user.getId();
			DatatablesResult datatablesResult = this.DocdepdocService.selectDataGridVoWrapper(page, rows, Integer.parseInt(draw),wrapper);
			List<docdepVo> docdepvonew = new ArrayList<docdepVo>();
			List<docdepVo> docdepvo = datatablesResult.getData();
			if (!"null".equals(docdepvo)) {
				for(int i=0;i<docdepvo.size();i++){
					if(docdepvo.get(i).getPubperson()== personid){
						docdepvonew.add(docdepvo.get(i));
					}
				}
					datatablesResult.setData(docdepvonew);
			}
			
			return ResponseEntity.ok(datatablesResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	/*By CGP
	 * 根据用户选择的文档类型的id 获取该id下的文档信息（查看界面）
	 */
	@RequestMapping(value = "/getAllDocInfoById/{docdepId}", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<DatatablesResult> getAllDocInfoById(
    		@PathVariable(value = "docdepId") String docdepId,
			@RequestParam(value = "draw") String draw,
			/*@RequestParam(value = "userId") String userId,*/
			@RequestParam(value = "start") String start,
			@RequestParam(value = "length") String length,
			HttpServletRequest request) {
		// 前端根据用户等级 限制浏览内容
		User user =(User)request.getSession().getAttribute("user");
		long perlevel = user.getLevel();
		int rows = Integer.parseInt(length);
		int page = (Integer.parseInt(start) / rows) + 1;
		try {
			EntityWrapper<docdepVo> wrapper = new EntityWrapper<docdepVo>();
			wrapper.isWhere(true).eq("dtype", docdepId);
			DatatablesResult datatablesResult = this.DocdepdocService.selectDataGridVoWrapper(page, rows, Integer.parseInt(draw),wrapper);
			List<docdepVo> docdepvonew = new ArrayList<docdepVo>();
			List<docdepVo> docdepvo = datatablesResult.getData();
			if (!"null".equals(docdepvo)) {
				long level = userService.selectById(this.getUserId()).getLevel();
				for(int i=0;i<docdepvo.size();i++){
					if(docdepvo.get(i).getSeclevel() <= level){
						docdepvonew.add(docdepvo.get(i));
					}
				}
					datatablesResult.setData(docdepvonew);
			}
			return ResponseEntity.ok(datatablesResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	/*
	 * 文档资源的添加
	 */
	@RequestMapping(value = "/adddateWord/{personid}", method = RequestMethod.POST)
	@ResponseBody
	@Transactional
	public Result addDocdep(Docdepdoc docdepdoc,String fileliststr,@PathVariable(value = "personid") String personid)
	{
		System.out.println("存储修改文档资源信息："+docdepdoc.getTitle());
		System.out.println(personid+"SDSDD");
		//获取当前时间
		try {
			Long depid = docdepdoc.getId();
			Date pubtime=new Date();
			docdepdoc.setPubtime(pubtime);
			Integer persondepid = userService.selectById(personid).getdepartmentId();
			docdepdoc.setPersondepid(persondepid);
			System.out.println(persondepid+"SDSDD");
			//将新加的文档的路径先赋值，然后再将整个数据进行更新
			List<Docdepdoc> attachList=null;
			if(fileliststr.length() > 0){
				fileliststr = fileliststr.replaceAll("&quot;","\""); //
				System.out.println(fileliststr);
				ObjectMapper mapper = new ObjectMapper();
				JavaType jt = mapper.getTypeFactory().constructParametricType(ArrayList.class, Docdepdoc.class);
				attachList = (List<Docdepdoc>)mapper.readValue(fileliststr,jt);
				
				if(attachList.get(0).getAttur() != null){
					docdepdoc.setAttur(attachList.get(0).getAttur());
					docdepdoc.setType(attachList.get(0).getType());
				}else{
				}
			}else{
				
			}
			//如果文档信息已经存在，则进行更新操作
			if(depid != null ){	
				 DocdepdocService.updateById(docdepdoc);
			}else{
				 DocdepdocService.insert(docdepdoc);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
			return new Result(false);
		}
		return new Result("massage","success");
	}
	
	/*
	 * 根据文档资源id删除文档资源（可以同时删除多个文档资源）
	 */
	@RequestMapping(value = "/deleteDocdep", method = RequestMethod.POST) 
	public ResponseEntity<Map<String, Object>> deleteDocdep(Long[] doc_id){
		Map<String, Object> result = new HashMap<String, Object>();	
		List<Long> ids = Arrays.asList(doc_id);
		Boolean bool = false;
		for(int i=0 ;i<ids.size();i++){
			bool = DocdepdocService.deleteById(ids.get(i));
			if (!bool) {
				result.put("msg", "删除失败");
				return ResponseEntity.ok(result);
			} 
		}
		result.put("msg", "删除成功");
		return ResponseEntity.ok(result);
	}
	/*
	 * 查询：资料管理界面
	 */
	@RequestMapping(value = "/getDocInfoBytitle/{querystring}", method = RequestMethod.POST)
    @ResponseBody
	public ResponseEntity<DatatablesResult> getDocInfoBytitle(
			docdepVo docdep,
			@PathVariable("querystring") String querystring,
			@RequestParam(value = "draw") String draw,
			@RequestParam(value = "start") String start,
			@RequestParam(value = "length") String length,
			/*@RequestParam(value = "userId") String userId,*/
			HttpServletRequest request) {
		// 前端根据用户等级 限制浏览内容
		User user =(User)request.getSession().getAttribute("user");
		long perlevel = user.getLevel();
		int rows = Integer.parseInt(length);
		int page = (Integer.parseInt(start) / rows) + 1;
		try {
			EntityWrapper<docdepVo> wrapper = new EntityWrapper<docdepVo>();
			Long personid = user.getId();
			DatatablesResult datatablesResult =null;
			if(personid!=null){
				if(querystring.equals("kong")==true || querystring.equals("")==true){
					wrapper.isWhere(true).eq("pubperson", personid);
					datatablesResult = this.DocdepdocService.selectDataGridVoWrapper(page, rows, Integer.parseInt(draw),wrapper);
				}else{
					wrapper.isWhere(true).like("title", querystring);
					wrapper.isWhere(true).eq("pubperson", personid);
					datatablesResult = this.DocdepdocService.selectDataGridVoWrapper(page, rows, Integer.parseInt(draw),wrapper);
					
				}
			}else{}
			
			return ResponseEntity.ok(datatablesResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	/*
	 * 查询：根据传入的文档名称或者关键字，获取对应的文档信息（文档查看）
	 */
	@RequestMapping(value = "/getDocInfoBytitleOrKeyWord/{data}", method = RequestMethod.POST)
    @ResponseBody
	public ResponseEntity<DatatablesResult> getDocInfoBytitleOrKeyWord(
			docdepVo docdep,
			@PathVariable("data") String data,
			@RequestParam(value = "draw") String draw,
			@RequestParam(value = "start") String start,
			@RequestParam(value = "length") String length,
			@RequestParam(value = "userId") String userId,
			HttpServletRequest request) {
		// 前端根据用户等级 限制浏览内容
		User user =(User)request.getSession().getAttribute("user");
		int rows = Integer.parseInt(length);
		int page = (Integer.parseInt(start) / rows) + 1;
		try {
			EntityWrapper<docdepVo> wrapper = new EntityWrapper<docdepVo>();
			List<docdepVo> docdepvonew = new ArrayList<docdepVo>();
			List<docdepVo> docdepVos = new ArrayList<docdepVo>();
			Long level = userService.selectById(userId).getLevel();
			DatatablesResult datatablesResult  = null;
			if(data.equals("kong")==true){
				datatablesResult = this.DocdepdocService.selectDataGridVoWrapper(page, rows, Integer.parseInt(draw),wrapper);
				docdepVos = datatablesResult.getData();
				if (!"null".equals(docdepVos)) {
					for(int i=0;i<docdepVos.size();i++){
						if(docdepVos.get(i).getSeclevel() <= level){
							docdepvonew.add(docdepVos.get(i));
						}
					}
					datatablesResult.setData(docdepvonew);
				} 
			}else{
				wrapper.isWhere(true).like("title", data);
				datatablesResult = this.DocdepdocService.selectDataGridVoWrapper(page, rows, Integer.parseInt(draw),wrapper);
				docdepVos = datatablesResult.getData();
				if (!"null".equals(docdepVos)) {
					for(int i=0;i<docdepVos.size();i++){
						if(docdepVos.get(i).getSeclevel() <= level){
							docdepvonew.add(docdepVos.get(i));
						}
					}
					datatablesResult.setData(docdepvonew);
				} 
			}
			return ResponseEntity.ok(datatablesResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
	}
	
	/**By CGP
	 * 点击查看和修改事件是加载需要填充的数据
	 * 
	 * */
	@RequestMapping(value = "/getWordbyid/{wordid}", method = RequestMethod.POST)
	@ResponseBody
	@Transactional
	public ResponseEntity<List<docdepVo>> getWordbyid(String wordid){
		try {
			System.out.println(DocdepdocService.selectByWordId(wordid));
			return ResponseEntity.ok(DocdepdocService.selectByWordId(wordid));
		}catch(Exception e){
			System.out.println(e.toString());
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
		}
	}
	/**By CGP
	 * 删除文档附件，只将该文档所在附件的attur值赋值为空
	 * 
	 * */
	@RequestMapping(value = "/deletewordbyid", method = RequestMethod.POST)
	@ResponseBody
	@Transactional
	public Result deletewordbyid(Long id)
	{
		try {
			System.out.println("dddddddddddddddd:"+id);
			Docdepdoc docdepdoc=DocdepdocService.selectById(id);
			System.out.println(docdepdoc+"SSSSSSSSSSSSSSSSS");
			docdepdoc.setAttur("");
			System.out.println(docdepdoc+"SSSSSSSSSSSSSSSSS");
			DocdepdocService.updateById(docdepdoc);
			return new Result(true);
		}catch(Exception e){
			System.out.println(e.toString());
			return new Result(false);
		}
	}
		/**By CGP
		 * 修改文档信息
		 * 
		 * */
		@RequestMapping(value = "/UpdateWord/{Id}", method = RequestMethod.POST)
		@ResponseBody
		@Transactional
		public Result UpdateWord(@PathVariable(value = "Id") Long Id,Docdepdoc docdepdoc,String fileliststr)
		{
			try {
				Date pubtime=new Date();
				docdepdoc.setPubtime(pubtime);
				//将新加的文档的路径先赋值，然后再将整个数据进行更新
				List<Docdepdoc> attachList=null;
				if(fileliststr.length() > 0){
					fileliststr = fileliststr.replaceAll("&quot;","\""); //
					System.out.println(fileliststr);
					ObjectMapper mapper = new ObjectMapper();
					JavaType jt = mapper.getTypeFactory().constructParametricType(ArrayList.class, Docdepdoc.class);
					attachList = (List<Docdepdoc>)mapper.readValue(fileliststr,jt);
					
					if(attachList.get(0).getAttur() != null){
						docdepdoc.setAttur(attachList.get(0).getAttur());
						docdepdoc.setType(attachList.get(0).getType());
					}else{
					}
				}else{
					
				}
				//如果文档信息已经存在，则进行更新操作
				if (Id != null && DocdepdocService.selectById(Id) != null) {
					System.out.println("AAAAAAAAAAAAAAAAAA"+Id+"DDDDDDDDDDDDDDDDDDDDDDDD");
					DocdepdocService.updateById(docdepdoc);
				} else {
					DocdepdocService.insert(docdepdoc);
				}
			} catch (Exception e) {
				System.out.println(e.toString());
				return new Result(false);
			}
			return new Result(true);
		}
	
	
	
}

