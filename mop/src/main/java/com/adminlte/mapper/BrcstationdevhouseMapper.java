package com.adminlte.mapper;

import com.adminlte.pojo.Brcstationdevhouse;
import com.adminlte.pojo.vo.BrcstationdevhouseVo;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BrcstationdevhouseMapper extends BaseMapper<Brcstationdevhouse>{
	//貌似当mapper调用selectList方法的时候会经过相应的逻辑进而转为调用此方法
	List<Brcstationdevhouse> selectListWapper(@Param("ew") Wrapper<Brcstationdevhouse> wrapper);
	List<BrcstationdevhouseVo> selectVoListWapper(@Param("ew") Wrapper<Brcstationdevhouse> wrapper);
}