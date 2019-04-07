package com.adminlte.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminlte.mapper.DocdepdocMapper;
import com.adminlte.pojo.Docdepdoc;
import com.adminlte.pojo.Urole;
import com.adminlte.pojo.User;
import com.adminlte.pojo.vo.UserVo;
import com.adminlte.pojo.vo.docdepVo;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IDocdepdocService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class DocdepdocServiceImpl extends ServiceImpl<DocdepdocMapper, Docdepdoc> implements IDocdepdocService {

	@Autowired
    private DocdepdocMapper depdocMapper;
	@Autowired
    private DocdepdocMapper docdepdocMapper;
	
	private List<Docdepdoc> selectTreeGrid() {
		EntityWrapper<Docdepdoc> wrapper = new EntityWrapper<Docdepdoc>();
        wrapper.orderBy("id");
        return depdocMapper.selectList(wrapper);
	}

	@Override
	public DatatablesResult<Docdepdoc> selectDataGrid(int page, int rows, int draw) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page, rows);
		List<Docdepdoc> depdocs = depdocMapper.selectList(new EntityWrapper<Docdepdoc>());
		PageInfo<Docdepdoc> pageInfo = new PageInfo<>(depdocs);
		DatatablesResult datatablesResult = new DatatablesResult();
		datatablesResult.setData(depdocs);
		datatablesResult.setDraw(draw);
		datatablesResult.setRecordsTotal((int)pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}

	@Override
	public DatatablesResult selectDataGridWrapper(int page, int rows, int draw,
			EntityWrapper<docdepVo> wrapper,long perlevel) {
		PageHelper.startPage(page, rows);
		List<docdepVo> projects;
		if(perlevel<1){
			wrapper.and("seclevel={0}",0);
		}else if(perlevel<2){
			wrapper.and("seclevel<{0}",1);
		}else if(perlevel<3){
			wrapper.and("seclevel<{0}",2);
		}else if(perlevel==3){
			wrapper.and("seclevel<{0}",3);
		}
		wrapper.orderBy("pubtime",false);
		projects = docdepdocMapper.listdocdepVo(wrapper);
		PageInfo<docdepVo> pageInfo = new PageInfo<>(projects);
		DatatablesResult datatablesResult = new DatatablesResult();
		datatablesResult.setData(projects);
		datatablesResult.setDraw(draw);
		datatablesResult.setRecordsTotal((int)pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}
	@Override
	public List<docdepVo> selectDocdepVoByName(String docName,long perlevel) {
		docdepVo docdep = new docdepVo();
		EntityWrapper<docdepVo> wrapper = new EntityWrapper<docdepVo>(docdep);
		if(docName.equals("空")==false){
			wrapper.isWhere(true).like("d.title", docName);
			if (perlevel<1) {
				wrapper.and("seclevel={0}",0);
			}else if(perlevel<2){
				wrapper.and("seclevel<{0}",1);
			}else if(perlevel<3){
				wrapper.and("seclevel<{0}",2);
			}else if(perlevel==3){
				wrapper.and("seclevel<{0}",3);
			}
		}else{
			if (perlevel<1) {
				wrapper.and("seclevel={0}",0);
			}else if(perlevel<2){
				wrapper.and("seclevel<{0}",1);
			}else if(perlevel<3){
				wrapper.and("seclevel<{0}",2);
			}else if(perlevel==3){
				wrapper.and("seclevel<{0}",3);
			}
		}
		wrapper.orderBy("pubtime",false);
		return docdepdocMapper.listdocdepVo(wrapper);
	}
	@Override
	public List<docdepVo> selectDocdepVoByKeyword(String docName,long perlevel) {
		docdepVo docdep = new docdepVo();
		EntityWrapper<docdepVo> wrapper = new EntityWrapper<docdepVo>(docdep);
	    if(docName.equals("空")==false){
	    	wrapper.isWhere(true).like("d.keyword", docName);
	    	if (perlevel<1) {
				wrapper.and("seclevel={0}",0);
			}else if(perlevel<2){
				wrapper.and("seclevel<{0}",1);
			}else if(perlevel<3){
				wrapper.and("seclevel<{0}",2);
			}else if(perlevel==3){
				wrapper.and("seclevel<{0}",3);
			}
	    }else{
	    	if (perlevel<1) {
				wrapper.and("seclevel={0}",0);
			}else if(perlevel<2){
				wrapper.and("seclevel<{0}",1);
			}else if(perlevel<3){
				wrapper.and("seclevel<{0}",2);
			}else if(perlevel==3){
				wrapper.and("seclevel<{0}",3);
			}
	    }
		
	    wrapper.orderBy("pubtime",false);
		return docdepdocMapper.listdocdepVo(wrapper);
	}
	 
	@Override
	public DatatablesResult<docdepVo> selectDocdepVo(List<docdepVo> doc, Integer page, Integer rows, Integer draw) {
		PageHelper.startPage(page, rows);
		PageInfo<docdepVo> pageInfo = new PageInfo<docdepVo>(doc);
		DatatablesResult<docdepVo> pageResult = new DatatablesResult<docdepVo>();
		pageResult.setData(doc);
		pageResult.setDraw(draw);
		pageResult.setRecordsTotal((int)pageInfo.getTotal());
		pageResult.setRecordsFiltered(pageResult.getRecordsTotal());
		return pageResult;
	}

	
	@Override
	public boolean delectDocInfo(List<Long> doc_id) {
		try{
			docdepdocMapper.delectOneOrmoreDocdepRole(doc_id);
			docdepdocMapper.delectOneOrmoreProfile(doc_id);
			docdepdocMapper.delectOneOrmoreDocdepInfo(doc_id);
			return true;
		}catch (Exception e) {
			return false;
		}
	}
	
	public List<Docdepdoc>getAllRoles() {
		return docdepdocMapper.selectAllRole();
	}

	@Override
	public Boolean updateDocdepInfo(Docdepdoc docdep) {
		try{
			docdepdocMapper.updateDocInfo(docdep);
			docdepdocMapper.updateDocInfo(docdep);
			return true;
		}catch (Exception e) {
			return false;
		}
		
	}

	@Override
	public Boolean updateDocInfoBySuper(Docdepdoc docdep) {
		docdepdocMapper.updateProfile(docdep);
		docdepdocMapper.updateRoleInfo(docdep);
		return docdepdocMapper.updateDocInfoBySuper(docdep);
	}

	@Override
	public List<docdepVo> selectDocInfoVos(long level) {
		EntityWrapper<docdepVo> wrappers = new EntityWrapper<docdepVo>();
		wrappers.isWhere(true);
	    wrappers.where("visdep = 1");
	    
	    if (level<1) {
	    	wrappers.and("seclevel= 0");
		} else if(level<3){
			wrappers.and("seclevel <",3);
		} else {
		     
		}
	    wrappers.orderBy("pubtime",false);
	    wrappers.last("LIMIT 0,3");
		return docdepdocMapper.listdocInfoVos(wrappers);
	}

	@Override
	public List<docdepVo> selectAllDocInfoVos() {
		EntityWrapper<docdepVo> wrapper = new EntityWrapper<docdepVo>();
		wrapper.isWhere(true);
	    wrapper.where("visdep = 1");
	    wrapper.and("seclevel= 0");
	    wrapper.orderBy("pubtime",false);
		return docdepdocMapper.listdocInfoVos(wrapper);
	}

	@Override
	public DatatablesResult selectDataGridWrapperById(int page, int rows, int parseInt, long id,long perlevel) {
		PageHelper.startPage(page, rows);
		
		EntityWrapper<docdepVo> wrapper = new EntityWrapper<docdepVo>();
		wrapper.isWhere(true);
		wrapper.where("dtype={0}", id);
		if (perlevel<1) {
			wrapper.and("seclevel={0}",0);
		}else if(perlevel<3){
			wrapper.and("seclevel<{0}",3);
		}
		wrapper.orderBy("pubtime",false);
		List<docdepVo> docdepVos = docdepdocMapper.listdocdepVo(wrapper);
		 
		PageInfo<docdepVo> pageInfo = new PageInfo<docdepVo>(docdepVos);
		DatatablesResult<docdepVo> pageResult = new DatatablesResult<docdepVo>();
		pageResult.setData(docdepVos);
		pageResult.setDraw(parseInt);
		pageResult.setRecordsTotal((int)pageInfo.getTotal());
		pageResult.setRecordsFiltered(pageResult.getRecordsTotal());
		return pageResult;
	}

	@Override
	public List<docdepVo> selectByWordId(String wordid) {
		EntityWrapper<docdepVo> wrapper = new EntityWrapper<docdepVo>();
		wrapper.isWhere(true).eq("d.id", wordid);
		return docdepdocMapper.listdocdepVo(wrapper);
	}

	@Override
	public DatatablesResult selectDataGridVoWrapper(int page, int rows, int parseInt, EntityWrapper<docdepVo> wrapper) {
			PageHelper.startPage(page, rows);
			wrapper.orderBy("pubtime",false);
			List<docdepVo> projects = docdepdocMapper.listdocdepVo(wrapper);
			PageInfo<docdepVo> pageInfo = new PageInfo<>(projects);
			DatatablesResult datatablesResult = new DatatablesResult();
			datatablesResult.setData(projects);
			datatablesResult.setDraw(parseInt);
			datatablesResult.setRecordsTotal((int)pageInfo.getTotal());
			datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
			return datatablesResult;
	}
	 
}
