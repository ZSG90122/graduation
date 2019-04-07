package com.adminlte.mapper;

import com.adminlte.pojo.Bdevsoftparts;
import com.baomidou.mybatisplus.mapper.Wrapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BdevsoftpartsMapper {
	List<Bdevsoftparts> selectListWapper(@Param("ew") Wrapper<Bdevsoftparts> wrapper);
}