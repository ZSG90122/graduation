package com.adminlte.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.adminlte.pojo.Bfault;
import com.adminlte.pojo.vo.BfaultVo;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.EntityWrapper;

public interface BfaultMapper extends BaseMapper<Bfault> {

	List<BfaultVo> selectVoList(@Param("ew") EntityWrapper<Bfault> wrapper);

}