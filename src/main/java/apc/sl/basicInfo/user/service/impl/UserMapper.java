package apc.sl.basicInfo.user.service.impl;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("UserMapper")
public interface UserMapper {

	int selectUserListToCnt(SearchVO searchVO);
	
	List<?> selectUserList(SearchVO searchVO);

	void registUser(Map<String, Object> map);
	
	int checkId(Map<String, Object> map);

	Map<String, Object> selectUserInfo(Map<String, Object> map);

	void modifyUser(Map<String, Object> map);

	void deleteUser(Map<String, Object> map);

}
