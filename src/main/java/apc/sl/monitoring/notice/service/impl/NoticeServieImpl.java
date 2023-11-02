package apc.sl.monitoring.notice.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.monitoring.notice.service.NoticeService;
import apc.util.SearchVO;
@Service
public class NoticeServieImpl implements NoticeService {
	@Resource
	private NoticeMapper noticeMapper;

	@Override
	public int selectNoticeListToCnt(SearchVO searchVO) {
		return noticeMapper.selectNoticeListToCnt(searchVO);
	}

	@Override
	public List<?> selectNoticeList(SearchVO searchVO) {
		return noticeMapper.selectNoticeList(searchVO);
	}

	@Override
	public void registNotice(Map<String, Object> map) {
		noticeMapper.registNotice(map);
	}

	@Override
	public Map<String, Object> selectNoticeInfo(Map<String, Object> map) {
		return noticeMapper.selectNoticeInfo(map);
	}

	@Override
	public void modifyNotice(Map<String, Object> map) {
		noticeMapper.modifyNotice(map);
	}

	@Override
	public void deleteNotice(Map<String, Object> map) {
		noticeMapper.deleteNotice(map);
	}

}
