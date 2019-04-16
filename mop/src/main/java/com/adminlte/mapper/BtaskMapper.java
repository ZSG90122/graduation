package com.adminlte.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.adminlte.pojo.Btask;
import com.adminlte.pojo.vo.BtaskVo;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.EntityWrapper;

public interface BtaskMapper extends BaseMapper<Btask> {

	List<BtaskVo> selectVoList(@Param("ew") EntityWrapper<Btask> wrapper);

}