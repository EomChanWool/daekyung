package apc.sl.basicInfo.userAuthority.service.impl;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("UserAuthorityMapper")
public interface UserAuthorityMapper {

	int selectUserAuthorityListToCnt(SearchVO searchVO);

	List<?> selectUserAuthorityList(SearchVO searchVO);

	void registUserAuthority(Map<String, Object> map);

	Map<String, Object> selectUserAuthorityInfo(Map<String, Object> map);

	void modifyUserAuthority(Map<String, Object> map);

	void deleteUserAuthority(Map<String, Object> map);
	
	int selectAccess(String str);
	
	int menuState(String str);
	
	int selectExistAuth(Map<String, Object> map);
	
	List<?> selectNotPro();
	
	List<?> selectNotInfo(Map<String, Object> map);

}
