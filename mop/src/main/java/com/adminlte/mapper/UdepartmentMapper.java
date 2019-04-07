package com.adminlte.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.adminlte.pojo.Udepartment;
import com.adminlte.pojo.vo.UdepartmentVo;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;

public interface UdepartmentMapper extends BaseMapper<Udepartment>{
	
	List<Udepartment> selectOffsprings(@Param("depid") Long depid); //前面不加参数说明，会报没有getter错误，好像id可以

	List<UdepartmentVo> selectContactsNameByDepId(long id);
	
	List<Udepartment> selectListWapper(@Param("ew") Wrapper<Udepartment> wrapper);
	
}
