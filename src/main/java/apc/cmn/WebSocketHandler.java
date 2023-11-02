package apc.cmn;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Repository
public class WebSocketHandler extends TextWebSocketHandler {
	private final Logger logger = LoggerFactory.getLogger(WebSocketHandler.class);
	//모든 로그인 유저
	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	//1대1
//	private Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessions.add(session);
//		logger.info("소켓연결성공 " + session);
	}
	//클라이언트가 서버로 메세지 전송시 실행
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//모든 유저에게 보낸다 - 브로드 캐스팅
		for (WebSocketSession sess : sessions) {
//			String senderId = sess.getId();
			sess.sendMessage(new TextMessage(message.getPayload()));
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessions.remove(session);
//		userSessionsMap.remove(session.getId());
//		logger.info("소켓연결종료 " + session + ", " + status);
	}
	
}