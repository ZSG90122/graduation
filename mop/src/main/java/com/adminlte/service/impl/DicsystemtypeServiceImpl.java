package com.adminlte.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import com.adminlte.mapper.DicsystemtypeMapper;
import com.adminlte.pojo.Dicsystemtype;
import com.adminlte.service.IDicsystemtypeService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

@Service
public class DicsystemtypeServiceImpl extends ServiceImpl<DicsystemtypeMapper, Dicsystemtype> implements IDicsystemtypeService{
	@Autowired
	DicsystemtypeMapper dicsystemtypeMapper;
}
