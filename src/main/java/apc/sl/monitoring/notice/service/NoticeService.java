package apc.sl.monitoring.notice.service;

import java.util.List;
import java.util.Map;

import apc.util.SearchVO;

public interface NoticeService {

	int selectNoticeListToCnt(SearchVO searchVO);

	List<?> selectNoticeList(SearchVO searchVO);

	void registNotice(Map<String, Object> map);

	Map<String, Object> selectNoticeInfo(Map<String, Object> map);

	void modifyNotice(Map<String, Object> map);

	void deleteNotice(Map<String, Object> map);

}
