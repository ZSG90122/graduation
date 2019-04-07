package com.adminlte.service;

import com.adminlte.pojo.Bdevsoft;
import com.adminlte.result.DatatablesResult;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.IService;

public interface IBdevsoftService extends IService<Bdevsoft> {

	DatatablesResult selectVoDataGridWrapper(int page, int rows, int parseInt, EntityWrapper<Bdevsoft> wrapper);

}
