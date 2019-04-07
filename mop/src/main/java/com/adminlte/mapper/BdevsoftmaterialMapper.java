package com.adminlte.mapper;

import com.adminlte.pojo.Bdevsoftmaterial;
import com.baomidou.mybatisplus.mapper.Wrapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BdevsoftmaterialMapper {
	List<Bdevsoftmaterial> selectListWapper(@Param("ew") Wrapper<Bdevsoftmaterial> wrapper);
}