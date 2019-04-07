package com.adminlte.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.adminlte.pojo.Udepartment;
import com.adminlte.pojo.Urole;
import com.adminlte.pojo.User;
import com.adminlte.pojo.vo.UserVo;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;

public interface UserMapper extends BaseMapper<User> {

	UserVo selectUserVoById(@Param("id") Long id);

	List<UserVo> selectUserVo();
    
	User SelectUsrIDByNP(String name,String paw);
	//注册用户前先获得role和organization信息
	List<Urole> selectAllRole();
	List<Udepartment> selectAllOrgnization();
	User selectoneUser(UserVo userVo);
	//由于插入信息时UserVo包含几张表的内容 所以用以下方法进行逐一插入
	Long addUserVoInfo(UserVo userVo);
	void addProfile(UserVo userVo);
	void addUserRole(UserVo userVo);
	//更新用户信息
	void updateUserInfo(UserVo userVo);
	void updateRoleInfo(UserVo userVo);
	void updateProfile(UserVo userVo);
	Boolean updateUserInfoBySuper(UserVo userVo);
	//删除单个或多个用户信息
	void delectOneOrmoreUserRole(List<Long> user_id);
	void delectOneOrmoreProfile(List<Long> user_id);
	void delectOneOrmoreUserInfo(List<Long> user_id);
	User findPasswordByBaseInfo(UserVo userVo);

	//查询部门及子部门所有的人员
	List<UserVo> selectUserVoByDepId(@Param("depid") Long depid);
	//根据baomidou的Wrapper查找
	List<UserVo> selectUserVoByWrapper(@Param("ew") Wrapper<UserVo> wrapper);
}
