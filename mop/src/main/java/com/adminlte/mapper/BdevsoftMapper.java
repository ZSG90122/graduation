package com.adminlte.mapper;

import com.adminlte.pojo.Bdevsoft;
import com.adminlte.pojo.vo.BdevsoftVo;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BdevsoftMapper extends BaseMapper<Bdevsoft> {
	List<Bdevsoft> selectListWapper(@Param("ew") Wrapper<Bdevsoft> wrapper);

	List<BdevsoftVo> selectVoListWrapper(@Param("ew") EntityWrapper<Bdevsoft> wrapper);
}