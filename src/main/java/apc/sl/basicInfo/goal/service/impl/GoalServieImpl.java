package apc.sl.basicInfo.goal.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.basicInfo.goal.service.GoalService;
import apc.util.SearchVO;
@Service
public class GoalServieImpl implements GoalService {
	@Resource
	private GoalMapper goalMapper;

	@Override
	public int selectGoalToCnt(SearchVO searchVO) {
		return goalMapper.selectGoalToCnt(searchVO);
	}

	@Override
	public List<?> selectGoalList(SearchVO searchVO) {
		return goalMapper.selectGoalList(searchVO);
	}

	@Override
	public void registGoal(Map<String, Object> map) {
		goalMapper.registGoal(map);
	}

	@Override
	public int selectGoalExists(Map<String, Object> map) {
		return goalMapper.selectGoalExists(map);
	}

	@Override
	public Map<String, Object> selectGoalInfo(Map<String, Object> map) {
		return goalMapper.selectGoalInfo(map);
	}

	@Override
	public void modifyGoal(Map<String, Object> map) {
		goalMapper.modifyGoal(map);
	}

	@Override
	public void deleteGoal(Map<String, Object> map) {
		goalMapper.deleteGoal(map);
	}

}
