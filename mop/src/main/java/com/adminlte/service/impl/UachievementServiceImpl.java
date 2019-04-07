package com.adminlte.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.adminlte.commons.scan.Achievetype;
import com.adminlte.commons.utils.achievementUtil;
import com.adminlte.commons.utils.departPageUtil;
import com.adminlte.commons.utils.talentPieUtil;
import com.adminlte.mapper.UachievementMapper;
import com.adminlte.pojo.Uachievement;
import com.adminlte.pojo.vo.UachievementVo;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IUachievementService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class UachievementServiceImpl extends ServiceImpl<UachievementMapper, Uachievement> implements IUachievementService {

	@Autowired
	private UachievementMapper uachievementrMapper;

	private List<Uachievement> selectTreeGrid() {
		EntityWrapper<Uachievement> wrapper = new EntityWrapper<Uachievement>();
		wrapper.orderBy("id");
		return uachievementrMapper.selectList(wrapper);
	}

	@Override
	public DatatablesResult<UachievementVo> selectDataGridWrapper(int page, int rows, int draw,Wrapper wrapper) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page, rows);
		List<UachievementVo> bidsinfors = uachievementrMapper.selectUachievementVoByWrapper(wrapper);
		PageInfo<UachievementVo> pageInfo = new PageInfo<>(bidsinfors);
		DatatablesResult datatablesResult = new DatatablesResult();
		datatablesResult.setData(bidsinfors);
		datatablesResult.setDraw(draw);
		datatablesResult.setRecordsTotal((int)pageInfo.getTotal());
		datatablesResult.setRecordsFiltered(datatablesResult.getRecordsTotal());
		return datatablesResult;
	}

	@Override
	public List<UachievementVo> selectDataListWrapper(Wrapper wrapper) {

		return uachievementrMapper.selectUachievementVoByWrapper(wrapper);
	}

	@Override
	public void updatedata(Achievetype type,long userid) {
		EntityWrapper<Uachievement> wrapper = new EntityWrapper<Uachievement>();
		wrapper.where("user_id={0}", userid);
		List<Uachievement> list = uachievementrMapper.selectList(wrapper);
		System.out.println(list);
		Uachievement achievement = null;
		if(list.size()>0){
			achievement = list.get(0);
		}else{
			achievement = new Uachievement();
			achievement.setUserId(userid);
			achievement.setDeletedocument(0);
			achievement.setDeletemessage(0);
			achievement.setDeletemilestone(0);
			achievement.setDeleteprogress(0);
			achievement.setLogtime(0);
			achievement.setNewbids(0);
			achievement.setNewdocument(0);
			achievement.setNewmessage(0);
			achievement.setNewmilestone(0);
			achievement.setNewprogress(0);
			achievement.setNewproject(0);
			achievement.setUpdatebids(0);
			achievement.setUpdatebids(0);
			achievement.setUpdatemilestone(0);
			achievement.setUpdateproject(0);
		}

		switch(type){
		case LOGIN:
			achievement.setLogtime(achievement.getLogtime()+1);
			break;
		case NEWPROJECT:
			achievement.setNewproject(achievement.getNewproject()+1);
			break;
		case UPDATEPROJECT:
			achievement.setUpdateproject(achievement.getUpdateproject()+1);
			break;
		case NEWBIDS:
			achievement.setNewbids(achievement.getNewbids()+1);
			break;
		case UPDATEBIDS:
			achievement.setUpdatebids(achievement.getUpdatebids()+1);
			break;
		case NEWPROGRESS:
			achievement.setNewprogress(achievement.getNewprogress()+1);
			break;
		case DELETEPROGRESS:
			achievement.setDeleteprogress(achievement.getDeleteprogress()+1);
			break;
		case NEWMILESTONE:
			achievement.setNewmilestone(achievement.getNewmilestone()+1);
			break;
		case DELETEMILESTONE:
			achievement.setDeletemilestone(achievement.getDeletemilestone()+1);
			break;
		case UPDATEMILESTONE:
			achievement.setUpdatemilestone(achievement.getUpdatemilestone()+1);
			break;
		case NEWDOCUMENT:
			achievement.setNewdocument(achievement.getNewdocument()+1);
			break;
		case DELETEDOCUMENT:
			achievement.setDeletedocument(achievement.getDeletedocument()+1);
			break;
		case NEWMESSAGE:
			achievement.setNewmessage(achievement.getNewmessage()+1);
			break;
		case DELETEMESSAGE:
			achievement.setDeletemessage(achievement.getDeletemessage()+1);
			break;
		}
		if (achievement.getId() ==null){
			uachievementrMapper.insert(achievement);
		}else{
			uachievementrMapper.updateById(achievement);
		}
	}

	@Override
	public achievementUtil getAllOptionNum() {

		return uachievementrMapper.getAllOptionNum();
	}

	@Override
	public departPageUtil<UachievementVo> selectDataListPages(String current, String length) {


		double lengths = Double.parseDouble(length);
		double currents = Double.parseDouble(current);
		departPageUtil<UachievementVo> departPageUtil = new departPageUtil<UachievementVo>();

		Integer pageStart = (int) Math.rint((currents-1) * lengths);
		String sql = "LIMIT " +pageStart+ ","+length;
		EntityWrapper<UachievementVo> wrapper = new EntityWrapper<UachievementVo>();
		wrapper.last(sql);

		EntityWrapper<UachievementVo> wrapperSize = new EntityWrapper<UachievementVo>();

		departPageUtil.setCurrent(currents);
		departPageUtil.setLength(length);
		int maxsize = (int) Math.ceil(uachievementrMapper.selectUachievementVoByWrapper(wrapperSize).size()/lengths);

		departPageUtil.setMaxSize(maxsize);
		departPageUtil.setPagesEntity(uachievementrMapper.selectUachievementVoByWrapper(wrapper));
		return departPageUtil;
	}

}
