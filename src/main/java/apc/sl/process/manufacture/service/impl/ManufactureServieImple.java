package apc.sl.process.manufacture.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.process.manufacture.service.ManufactureService;
import apc.util.SearchVO;

@Service
public class ManufactureServieImple implements ManufactureService {
	
	@Resource
	private ManufactureMapper manufactureMapper;

	@Override
	public int selectManufactureListToCnt(SearchVO searchVO) {
		return manufactureMapper.selectManufactureListToCnt(searchVO);
	}

	@Override
	public List<?> selectManufactureList(SearchVO searchVO) {
		return manufactureMapper.selectManufactureList(searchVO);
	}



	@Override
	public Map<String, Object> selectInfo(Map<String, Object> map) {
		return manufactureMapper.selectInfo(map);
	}

	@Override
	public int selctExistsOn(Map<String, Object> map) {
		return manufactureMapper.selctExistsOn(map);
	}

	@Override
	public void registManufacture(Map<String, Object> map) {
		manufactureMapper.registManufacture(map);
		
	}

	@Override
	public Map<String, Object> selectCheck(Map<String, Object> map) {
		return manufactureMapper.selectCheck(map);
	}

	@Override
	public void modifyManufacture(Map<String, Object> map) {
		manufactureMapper.modifyManufacture(map);
		
	}

	@Override
	public void deleteManufacture(Map<String, Object> map) {
		manufactureMapper.deleteManufacture(map);
	}

	@Override
	public Map<String, Object> selectDetailManufacture(Map<String, Object> map) {
		return manufactureMapper.selectDetailManufacture(map);
	}

	@Override
	public int selectExistsLot(Map<String, Object> map) {
		return manufactureMapper.selectExistsLot(map);
	}

	@Override
	public Map<String, Object> selectMfInfo(Map<String, Object> map) {
		return manufactureMapper.selectMfInfo(map);
	}

	@Override
	public void registMfLog(Map<String, Object> map) {
		manufactureMapper.registMfLog(map);
	}

	@Override
	public void updateOrState(Map<String, Object> map) {
		manufactureMapper.updateOrState(map);
	}

	@Override
	public void registMfStopLog(Map<String, Object> map) {
		manufactureMapper.registMfStopLog(map);
	}

	@Override
	public void updateMfStopLog2(Map<String, Object> map) {
		manufactureMapper.updateMfStopLog2(map);
	}

	@Override
	public int selectCheckStop(Map<String, Object> map) {
		return manufactureMapper.selectCheckStop(map);
	}

	@Override
	public void updateProcess3(Map<String, Object> map) {
		manufactureMapper.updateProcess3(map);
	}

	@Override
	public void updateLogEdtime(Map<String, Object> map) {
		manufactureMapper.updateLogEdtime(map);
	}

	@Override
	public List<?> selectMfManager() {
		return manufactureMapper.selectMfManager();
	}

	@Override
	public void modifyMfManager(Map<String, Object> map) {
		manufactureMapper.modifyMfManager(map);
	}

	@Override
	public int countFinish() {
		return manufactureMapper.countFinish();
	}

	@Override
	public Map<String, Object> outData(Map<String, Object> map) {
		return manufactureMapper.outData(map);
	}

}
