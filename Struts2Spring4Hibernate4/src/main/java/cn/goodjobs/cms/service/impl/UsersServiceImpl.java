package cn.goodjobs.cms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.goodjobs.cms.dao.UsersDao;
import cn.goodjobs.cms.domain.Users;
import cn.goodjobs.cms.service.UsersService;

@Service
public class UsersServiceImpl implements UsersService {
	
	@Autowired
	private UsersDao usersDao;
	
	public Long createUsers(Users users){
		Long id =  usersDao.insert(users);
		return id;
	}

	public Long modifyUsers(Users users){
		return usersDao.update(users);
	}

	public Long removeUsers(Long id){
		return usersDao.delete(id);
	}

	public Users getUsers(Long id){
		return usersDao.getUser(id);
	}

	public List<Users> getUsersList(Users users){
		return usersDao.getUsersList(users);
	}

	public int getUsersCount(Users users) {
		return usersDao.getUsersCount(users);
	}

	public List<Users> getUsersPaginatedList(Users users, int first, int count) {
		return usersDao.getUsersPaginatedList(users, first, count);
	}
}