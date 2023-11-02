package apc.sl.facility.failReport.service.impl;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("FailReportMapper")
public interface FailReportMapper {

	int selectFailReportListToCnt(SearchVO searchVO);

	List<?> selectFailReportList(SearchVO searchVO);

	List<?> selectFacMasterList();

	List<?> selectWorkOrderInfo(Map<String, Object> map);

	int selectExistsWorkOrderIdx(Map<String, Object> map);

	int selectExistsFailReport(Map<String, Object> map);

	void registFailReport(Map<String, Object> map);

	Map<String, Object> selectProcessSeqInfo(Map<String, Object> map);

	void updateProcess(Map<String, Object> map);

	Map<String, Object> selectFailReportInfo(Map<String, Object> map);

	void modifyFailReport(Map<String, Object> map);

	String selectLastProcessNm(Map<String, Object> map);

	void updateWorkOrder(Map<String, Object> map);

	void deleteFailReport(Map<String, Object> map);

	void updateOrders(Map<String, Object> map);

	void addItemStock(Map<String, Object> map);

	String selectItemCd(Map<String, Object> map);

	Map<String, Object> selectMaterialList(Map<String, Object> map);

	void updateInMaterial(Map<String, Object> temp);

	void updateMaterialStock(Map<String, Object> temp2);

}
