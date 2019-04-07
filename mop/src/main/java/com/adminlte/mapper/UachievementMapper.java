package com.adminlte.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.adminlte.commons.utils.achievementUtil;
import com.adminlte.pojo.Uachievement;
import com.adminlte.pojo.vo.UachievementVo;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;

public interface UachievementMapper extends BaseMapper<Uachievement>{
	List<UachievementVo> selectUachievementVoByWrapper(@Param("ew") Wrapper<UachievementVo> wrapper);

	achievementUtil getAllOptionNum();
	
}
