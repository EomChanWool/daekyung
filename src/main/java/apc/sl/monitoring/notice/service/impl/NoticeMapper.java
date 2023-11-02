package apc.sl.monitoring.notice.service.impl;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("NoticeMapper")
public interface NoticeMapper {

	int selectNoticeListToCnt(SearchVO searchVO);

	List<?> selectNoticeList(SearchVO searchVO);

	void registNotice(Map<String, Object> map);

	Map<String, Object> selectNoticeInfo(Map<String, Object> map);

	void modifyNotice(Map<String, Object> map);

	void deleteNotice(Map<String, Object> map);

}
