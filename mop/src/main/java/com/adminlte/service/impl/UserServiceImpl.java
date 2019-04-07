package com.adminlte.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.adminlte.mapper.UserMapper;
import com.adminlte.mapper.UserRoleMapper;
import com.adminlte.pojo.Udepartment;
import com.adminlte.pojo.Urole;
import com.adminlte.pojo.User;
import com.adminlte.pojo.vo.UserVo;
import com.adminlte.result.DatatablesResult;
import com.adminlte.service.IUserService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service("UserServiceImpl")
@Transactional
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private UserRoleMapper userRoleMapper;

	@Override
	public List<User> selectByLoginName(UserVo userVo) {
		User user = new User();
		user.setLoginName(userVo.getLoginName());
		EntityWrapper<User> wrapper = new EntityWrapper<User>(user);
		if (null != userVo.getId()) {
			wrapper.where("id != {0}", userVo.getId());
		}
		List<User> selectList = userMapper.selectList(wrapper);
		return selectList;
	}
	
	@Override
	public DatatablesResult<UserVo> selectUserVo(UserVo userVo, Integer page, Integer rows, Integer draw) {
		PageHelper.startPage(page, rows);
		List<UserVo> userVos = this.userMapper.selectUserVo();
		//System.out.println(userVos.get(2).toString()+"========================================");
		PageInfo<UserVo> pageInfo = new PageInfo<UserVo>(userVos);
		DatatablesResult<UserVo> pageResult = new DatatablesResult<UserVo>();
		pageResult.setData(userVos);
		pageResult.setDraw(draw);
		pageResult.setRecordsTotal((int)pageInfo.getTotal());
		pageResult.setRecordsFiltered(pageResult.getRecordsTotal());
		return pageResult;
	}
	@Override
	public 	DatatablesResult<UserVo> selectUserVoWrapper(UserVo userVo, Integer page, Integer rows, Integer draw,Wrapper wrapper){
		PageHelper.startPage(page, rows);
		List<UserVo> userVos = this.userMapper.selectUserVoByWrapper(wrapper);
		//System.out.println(userVos.get(2).toString()+"========================================");
		PageInfo<UserVo> pageInfo = new PageInfo<UserVo>(userVos);
		DatatablesResult<UserVo> pageResult = new DatatablesResult<UserVo>();
		pageResult.setData(userVos);
		pageResult.setDraw(draw);
		pageResult.setRecordsTotal((int)pageInfo.getTotal());
		pageResult.setRecordsFiltered(pageResult.getRecordsTotal());
		return pageResult;
	}

	@Override
	public Boolean deleteUserById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User getUserIDByNameAndPassword(String name, String Password) {
		return userMapper.SelectUsrIDByNP(name,Password);
	}

	//获取所有role对象信息
		@Override
		public List<Urole> getAllRoles() {
			return userMapper.selectAllRole();
		}
	//获取所有Organization对象所有信息
		@Override
		public List<Udepartment> getAllOrganizations() {
			return userMapper.selectAllOrgnization();
		}
		
	@Override
	public boolean addUserVoInfo(UserVo userVo) {
		
		try{
			userMapper.addUserVoInfo(userVo);
			User user=userMapper.selectoneUser(userVo);
			Long user_id=user.getId();
			if(user_id!=null){
				userVo.setId(user_id);
				userMapper.addUserRole(userVo);
				userMapper.addProfile(userVo);
			}
			return true;
		}catch (Exception e) {
			return false;
		}
		
	}

	@Override
	public boolean updateUserVoInfo(UserVo userVo) {
		try{
			userMapper.updateUserInfo(userVo);
			userMapper.updateProfile(userVo);
			return true;
		}catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean delectUserInfo(List<Long> user_id) {
		try{
			userMapper.delectOneOrmoreUserRole(user_id);
			userMapper.delectOneOrmoreProfile(user_id);
			userMapper.delectOneOrmoreUserInfo(user_id);
			return true;
		}catch (Exception e) {
			return false;
		}
	}

	@Override
	public UserVo findPasswordByBaseInfo(UserVo userVo) {
		UserVo userVO=null;
		try{
			User user= userMapper.findPasswordByBaseInfo(userVo);
			if(user!=null){
				userVO = userMapper.selectUserVoById(user.getId());
				userVO.setRoleIds(userVO.getRolesList().get(0).getId());
				return userVO;
			}
			return userVO;
		}catch (Exception e) {
			return userVO;
		}
	}
	@Override
	public List<UserVo> getAllUsers() {
		List<UserVo> selectList = userMapper.selectUserVo();
		return selectList;
	}

	@Override
	public UserVo selectUserVoById(Long id) {
		// TODO Auto-generated method stub
		return userMapper.selectUserVoById(id);
	}
	@Override
	public Boolean updateUserInfoBySuper(UserVo userVo) {
				userMapper.updateProfile(userVo);
				userMapper.updateRoleInfo(userVo);
			return userMapper.updateUserInfoBySuper(userVo);
	}
	@Override
	public List<UserVo> selectUserVoByDepId(Long depid) {
		// TODO Auto-generated method stub
		return userMapper.selectUserVoByDepId(depid);
	}

	@Override
	public List<UserVo> selectUserVoByName(String userName) {
		// TODO Auto-generated method stub
		UserVo userVo = new UserVo();
		EntityWrapper<UserVo> wrapper = new EntityWrapper<UserVo>(userVo);
	    wrapper.isWhere(true).like("t.name", userName);
		System.out.println("dddd:::"+wrapper.getSqlSegment());
		return userMapper.selectUserVoByWrapper(wrapper);
	}
	
	//https://www.cnblogs.com/fingerboy/p/6657118.html
	/*
	 * ew.setEntity(new User(1));
    ew.where("name={0}", "'zhangsan'").and("id=1")
            .orNew("status={0}", "0").or("status=1")
            .notLike("nlike", "notvalue")
            .andNew("new=xx").like("hhh", "ddd")
            .andNew("pwd=11").isNotNull("n1,n2").isNull("n3")
            .groupBy("x1").groupBy("x2,x3")
            .having("x1=11").having("x3=433")
            .orderBy("dd").orderBy("d1,d2");
	 */
	
}
