package com.adminlte.service;

import java.util.List;

import com.adminlte.pojo.Docdepdoc;
import com.adminlte.pojo.vo.docdepVo;
import com.adminlte.result.DatatablesResult;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.IService;

public interface IDocdepdocService extends IService<Docdepdoc>{
	
	DatatablesResult<Docdepdoc> selectDataGrid(int page, int rows, int parseInt);

	DatatablesResult selectDataGridWrapper(int page, int rows, int parseInt, EntityWrapper<docdepVo> wrapper, long perlevel);
	DatatablesResult selectDataGridVoWrapper(int page, int rows, int parseInt, EntityWrapper<docdepVo> wrapper);
	boolean delectDocInfo(List<Long> doc_id);

	List<Docdepdoc> getAllRoles();

	Boolean updateDocdepInfo(Docdepdoc docdep);

	Boolean updateDocInfoBySuper(Docdepdoc docdep);

	List<docdepVo> selectDocdepVoByName(String data, long perlevel);

	List<docdepVo> selectDocdepVoByKeyword(String docName, long perlevel);

	DatatablesResult selectDataGridWrapperById(int page, int rows, int parseInt, long id, long perlevel);
	
	DatatablesResult<docdepVo> selectDocdepVo(List<docdepVo> doc, Integer page, Integer rows, Integer draw);

	List<docdepVo> selectDocInfoVos(long level);

	List<docdepVo> selectAllDocInfoVos();

	List<docdepVo> selectByWordId(String wordid);

	
}
