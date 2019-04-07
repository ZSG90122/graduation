package com.adminlte.mapper;

import com.adminlte.pojo.Bdevsystem;
import com.adminlte.pojo.vo.BdevsystemVo;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BdevsystemMapper extends BaseMapper<Bdevsystem>{
	List<Bdevsystem> selectListWapper(@Param("ew") Wrapper<Bdevsystem> wrapper);

	/**
	 * 多表查询返回数据给遥控站配套系统进行数据的填充
	 * 
	 * @param wrapper
	 * @return
	 * @author zsg
	 */
	List<BdevsystemVo> selectVoListWrapper(@Param("ew") Wrapper<Bdevsystem> wrapper);
}