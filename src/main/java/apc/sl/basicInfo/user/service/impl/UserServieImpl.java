package apc.sl.basicInfo.user.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.basicInfo.user.service.UserService;
import apc.util.SearchVO;
@Service
public class UserServieImpl implements UserService {
	@Resource
	private UserMapper userMapper;

	@Override
	public int selectUserListToCnt(SearchVO searchVO) {
		return userMapper.selectUserListToCnt(searchVO);
	}
	
	@Override
	public List<?> selectUserList(SearchVO searchVO) {
		return userMapper.selectUserList(searchVO);
	}

	@Override
	public void registUser(Map<String, Object> map) {
		userMapper.registUser(map);
	}

	@Override
	public Map<String, Object> selectUserInfo(Map<String, Object> map) {
		return userMapper.selectUserInfo(map);
	}

	@Override
	public void modifyUser(Map<String, Object> map) {
		userMapper.modifyUser(map);
	}

	@Override
	public void deleteUser(Map<String, Object> map) {
		userMapper.deleteUser(map);
	}

	@Override
	public int checkId(Map<String, Object> map) {
		return userMapper.checkId(map);
	}
}
