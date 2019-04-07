package com.adminlte.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminlte.mapper.BdevsoftparameterMapper;
import com.adminlte.pojo.Bdevsoftparameter;
import com.adminlte.service.IBdevsoftparameterService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

@Service
public class BdevsoftparameterServiceImpl extends ServiceImpl<BdevsoftparameterMapper, Bdevsoftparameter> implements IBdevsoftparameterService{
	@Autowired
	BdevsoftparameterMapper bdevsoftparameterMapper;
}
