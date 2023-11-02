package apc.sl.basicInfo.goal.service.impl;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("GoalMapper")
public interface GoalMapper {

	int selectGoalToCnt(SearchVO searchVO);
	
	int selectGoalExists(Map<String,Object> map);

	List<?> selectGoalList(SearchVO searchVO);
	
	Map<String, Object> selectGoalInfo(Map<String,Object> map);
	
	void registGoal(Map<String,Object> map);
	
	void modifyGoal(Map<String, Object> map);
	
	void deleteGoal(Map<String, Object> map);

}
