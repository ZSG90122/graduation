package com.adminlte.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.http.ResponseEntity;

import com.adminlte.pojo.Docdepdoc;
import com.adminlte.pojo.vo.UserVo;
import com.adminlte.pojo.vo.docdepVo;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;

public interface DocdepdocMapper extends BaseMapper<Docdepdoc>{


	void delectOneOrmoreDocdepRole(List<Long> doc_id);
	void delectOneOrmoreProfile(List<Long> doc_id);
	void delectOneOrmoreDocdepInfo(List<Long> doc_id);
	boolean delectDocInfo(List<Long> doc_id);
	List<Docdepdoc>getAllRoles();
	List<Docdepdoc> selectAllRole();
	void updateDocInfo(Docdepdoc docdep);
	void updateRoleInfo(Docdepdoc docdep);
	void updateProfile(Docdepdoc docdep);
	Boolean updateDocInfoBySuper(Docdepdoc docdep);
	List<docdepVo> listdocdepVo(@Param("ew") Wrapper<docdepVo> wrapper);
	List<docdepVo> selectDocdepVo();
	List<docdepVo> listdocInfoVos(@Param("ew") Wrapper<docdepVo> wrapper);
	void updateDownLoadNumber(String id);
}
