package apc.sl.facility.failReport.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.facility.failReport.service.FailReportService;
import apc.util.SearchVO;
@Service
public class FailReportServieImpl implements FailReportService {
	@Resource
	private FailReportMapper failReportMapper;

	@Override
	public int selectFailReportListToCnt(SearchVO searchVO) {
		return failReportMapper.selectFailReportListToCnt(searchVO);
	}

	@Override
	public List<?> selectFailReportList(SearchVO searchVO) {
		return failReportMapper.selectFailReportList(searchVO);
	}

	@Override
	public List<?> selectFacMasterList() {
		return failReportMapper.selectFacMasterList();
	}

	@Override
	public List<?> selectWorkOrderInfo(Map<String, Object> map) {
		return failReportMapper.selectWorkOrderInfo(map);
	}

	@Override
	public int selectExistsWorkOrderIdx(Map<String, Object> map) {
		return failReportMapper.selectExistsWorkOrderIdx(map);
	}

	@Override
	public int selectExistsFailReport(Map<String, Object> map) {
		return failReportMapper.selectExistsFailReport(map);
	}

	@Override
	public void registFailReport(Map<String, Object> map) {
		failReportMapper.registFailReport(map);
	}

	@Override
	public Map<String, Object> selectProcessSeqInfo(Map<String, Object> map) {
		return failReportMapper.selectProcessSeqInfo(map);
	}

	@Override
	public void updateProcess(Map<String, Object> map) {
		failReportMapper.updateProcess(map);
	}

	@Override
	public Map<String, Object> selectFailReportInfo(Map<String, Object> map) {
		return failReportMapper.selectFailReportInfo(map);
	}

	@Override
	public void modifyFailReport(Map<String, Object> map) {
		failReportMapper.modifyFailReport(map);
	}

	@Override
	public String selectLastProcessNm(Map<String, Object> map) {
		return failReportMapper.selectLastProcessNm(map);
	}

	@Override
	public void updateWorkOrder(Map<String, Object> map) {
		failReportMapper.updateWorkOrder(map);
	}

	@Override
	public void deleteFailReport(Map<String, Object> map) {
		failReportMapper.deleteFailReport(map);
	}

	@Override
	public void updateOrders(Map<String, Object> map) {
		failReportMapper.updateOrders(map);
	}

	@Override
	public void addItemStock(Map<String, Object> map) {
		failReportMapper.addItemStock(map);
	}

	@Override
	public String selectItemCd(Map<String, Object> map) {
		return failReportMapper.selectItemCd(map);
	}

	@Override
	public Map<String, Object> selectMaterialList(Map<String, Object> map) {
		return failReportMapper.selectMaterialList(map);
	}

	@Override
	public void updateInMaterial(Map<String, Object> temp) {
		failReportMapper.updateInMaterial(temp);
	}

	@Override
	public void updateMaterialStock(Map<String, Object> temp2) {
		failReportMapper.updateMaterialStock(temp2);
	}

	

}
