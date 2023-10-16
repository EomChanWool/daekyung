package apc.sl.basicInfo.actualResult.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.basicInfo.actualResult.service.ActualResultService;
import apc.util.SearchVO;
@Service
public class ActualResultImpl implements ActualResultService {
	@Resource
	private ActualResultMapper actualResultMapper;

	@Override
	public Map<String, Object> selectActualResult(Map<String, Object> map) {
		return actualResultMapper.selectActualResult(map);
	}

	@Override
	public int selectActualResultListToCnt(SearchVO searchVO) {
		return actualResultMapper.selectActualResultListToCnt(searchVO);
	}

	@Override
	public List<?> selectActualResultList(SearchVO searchVO) {
		return actualResultMapper.selectActualResultList(searchVO);
	}

	@Override
	public String selectId(Map<String, Object> map) {
		return actualResultMapper.selectId(map);
	}

	@Override
	public void registMemberOk(Map<String, Object> map) {
		actualResultMapper.registMemberOk(map);
	}

	@Override
	public Map<String, Object> selectMemberInfo(Map<String, Object> map) {
		return actualResultMapper.selectMemberInfo(map);
	}

	@Override
	public void modifyMember(Map<String, Object> map) {
		actualResultMapper.modifyMember(map);
	}

	@Override
	public void deleteMember(Map<String, Object> map) {
		actualResultMapper.deleteMember(map);
	}

	@Override
	public void insertSystemLog(Map<String, Object> member) {
		actualResultMapper.insertSystemLog(member);
	}

	@Override
	public List<?> selectMenuLevel() {
		return actualResultMapper.selectMenuLevel();
	}

}
