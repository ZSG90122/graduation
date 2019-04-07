package com.adminlte.mapper;

import com.adminlte.pojo.Benterprise;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BenterpriseMapper extends BaseMapper<Benterprise>{
	List<Benterprise> selectListWapper(@Param("ew") Wrapper<Benterprise> wrapper);
}