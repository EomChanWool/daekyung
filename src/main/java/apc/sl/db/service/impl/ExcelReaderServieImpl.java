package apc.sl.db.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.db.service.ExcelReaderService;

@Service
public class ExcelReaderServieImpl implements ExcelReaderService {
	
	@Resource ExcelReaderMapper excelReaderMapper;

	@Override
	public void registdb(Map<String, Object> map) {
		excelReaderMapper.registdb(map);
	}

	@Override
	public void deletedb() {
		excelReaderMapper.deletedb();
		
	}

	@Override
	public void registPi(Map<String, String> map) {
		excelReaderMapper.registPi(map);
	}

	@Override
	public void registMm(Map<String, String> map) {
		excelReaderMapper.registMm(map);
	}

	@Override
	public void deleteMm() {
		excelReaderMapper.deleteMm();
	}

	@Override
	public void updateMm(Map<String, Object> map) {
		excelReaderMapper.updateMm(map);
	}

	@Override
	public void registOrder(Map<String, String> map) {
		excelReaderMapper.registOrder(map);
	}

	@Override
	public void registRelease(Map<String, String> map) {
		excelReaderMapper.registRelease(map);
	}

	@Override
	public void testRegist(Map<String,String> map) {
		excelReaderMapper.testRegist(map);
	}

	@Override
	public Map<String, Object> inspCount(String edDate) {
		return excelReaderMapper.inspCount(edDate);
	}

	@Override
	public List<Map<String, Object>> noUpList(String edDate) {
		return excelReaderMapper.noUpList(edDate);
	}

	@Override
	public Map<String, Object> mfProc(String str) {
		return excelReaderMapper.mfProc(str);
	}

	@Override
	public void registinspData(Map<String, Object> map) {
		excelReaderMapper.registinspData(map);
	}

	@Override
	public void registProc(Map<String, String> map) {
		excelReaderMapper.registProc(map);
	}
	
	@Override
	public Map<String, Object> sublList(Map<String, String> map) {
		return excelReaderMapper.sublList(map);
	}

	@Override
	public Map<String, Object> clgoList(Map<String, String> map) {
		return excelReaderMapper.clgoList(map);
	}

}
