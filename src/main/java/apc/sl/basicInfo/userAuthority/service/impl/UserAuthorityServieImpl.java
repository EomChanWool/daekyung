package apc.sl.basicInfo.userAuthority.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.basicInfo.userAuthority.service.UserAuthorityService;
import apc.util.SearchVO;
@Service
public class UserAuthorityServieImpl implements UserAuthorityService {
	@Resource
	private UserAuthorityMapper userAuthorityMapper;

	@Override
	public int selectUserAuthorityListToCnt(SearchVO searchVO) {
		return userAuthorityMapper.selectUserAuthorityListToCnt(searchVO);
	}

	@Override
	public List<?> selectUserAuthorityList(SearchVO searchVO) {
		return userAuthorityMapper.selectUserAuthorityList(searchVO);
	}

	@Override
	public void registUserAuthority(Map<String, Object> map) {
		userAuthorityMapper.registUserAuthority(map);
	}

	@Override
	public Map<String, Object> selectUserAuthorityInfo(Map<String, Object> map) {
		return userAuthorityMapper.selectUserAuthorityInfo(map);
	}

	@Override
	public void modifyUserAuthority(Map<String, Object> map) {
		userAuthorityMapper.modifyUserAuthority(map);
	}

	@Override
	public void deleteUserAuthority(Map<String, Object> map) {
		userAuthorityMapper.deleteUserAuthority(map);
	}

	@Override
	public int selectAccess(String str) {
		return userAuthorityMapper.selectAccess(str);
	}

	@Override
	public List<?> selectNotPro() {
		return userAuthorityMapper.selectNotPro();
	}

	@Override
	public List<?> selectNotInfo(Map<String, Object> map) {
		return userAuthorityMapper.selectNotInfo(map);
	}

	@Override
	public int menuState(String str) {
		return userAuthorityMapper.menuState(str);
	}

	@Override
	public int selectExistAuth(Map<String, Object> map) {
		return userAuthorityMapper.selectExistAuth(map);
	}
}
