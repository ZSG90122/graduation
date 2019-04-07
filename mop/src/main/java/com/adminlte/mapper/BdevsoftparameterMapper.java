package com.adminlte.mapper;

import com.adminlte.pojo.Bdevsoftparameter;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BdevsoftparameterMapper extends BaseMapper<Bdevsoftparameter>{
	List<Bdevsoftparameter> selectListWapper(@Param("ew") Wrapper<Bdevsoftparameter> wrapper);
}