package com.adminlte.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.http.ResponseEntity;

import com.adminlte.pojo.Udepartment;
import com.adminlte.pojo.Urole;
import com.adminlte.pojo.User;
import com.adminlte.pojo.vo.UserVo;
import com.adminlte.result.DatatablesResult;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;

public interface IUserService extends IService <User>{
	List<User> selectByLoginName(UserVo uservo);
	
	DatatablesResult<UserVo> selectUserVo(UserVo userVo, Integer page, Integer rows, Integer draw);
	DatatablesResult<UserVo> selectUserVoWrapper(UserVo userVo, Integer page, Integer rows, Integer draw,Wrapper wrapper);

	Boolean deleteUserById(String id);
	
	User getUserIDByNameAndPassword(String name,String Password);
	List<Urole> getAllRoles();
	List<Udepartment> getAllOrganizations();
	boolean addUserVoInfo(UserVo userVo);
	boolean updateUserVoInfo(UserVo userVo);
	Boolean updateUserInfoBySuper(UserVo userVo);
	boolean delectUserInfo(List<Long> user_id);
	UserVo findPasswordByBaseInfo(UserVo userVo);
	List<UserVo> getAllUsers();
	UserVo selectUserVoById(Long id);
	//查询给定部门及子部门下的所有用户
	List<UserVo> selectUserVoByDepId(Long depid);
	//根据名字模糊查询
	List<UserVo> selectUserVoByName(String userName);
	
}
