package com.adminlte.mapper;

import java.util.List;

import com.adminlte.pojo.Bpersoninspection;
import com.adminlte.pojo.vo.BpersoninspectionVo;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.EntityWrapper;

public interface BpersoninspectionMapper extends BaseMapper<Bpersoninspection>{

	List<BpersoninspectionVo> selectVoListWrapper(EntityWrapper<Bpersoninspection> wrapper);
    
}