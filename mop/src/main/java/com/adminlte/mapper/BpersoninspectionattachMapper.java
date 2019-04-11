package com.adminlte.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.adminlte.pojo.Bpersoninspectionattach;
import com.baomidou.mybatisplus.mapper.BaseMapper;

public interface BpersoninspectionattachMapper extends BaseMapper<Bpersoninspectionattach>{
    List<Bpersoninspectionattach> selectBpersoninspectionattachOfInspectList(@Param("inspectid")Long inspectid);
}