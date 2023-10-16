package apc.cmn;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
@WebListener
public class SessionConfig implements HttpSessionListener{
	
	private static final Logger LOGGER = LoggerFactory.getLogger(SessionConfig.class);
    private static final Map<String, HttpSession> sessions = new ConcurrentHashMap<>();

    //중복로그인 지우기
    public synchronized static String getSessionidCheck(String type,String compareId){
        String result = "";
        for( String key : sessions.keySet() ){
            HttpSession value = sessions.get(key);
            if(value != null &&  value.getAttribute(type) != null && value.getAttribute(type).toString().equals(compareId) ){
                //System.out.println(value.getAttribute(type).toString());
                result =  key.toString();
            }
        }
        //removeSessionForDoubleLogin(result);
        return result;
    }
    
    private static void removeSessionForDoubleLogin(String userId){    	
    	LOGGER.info("remove userId : " + userId);
        if(userId != null && userId.length() > 0){
        	//sessions.get(userId).removeAttribute("managerVO");
        	sessions.get(userId).setAttribute("loginDup", "loginDup");
        	//sessions.get(userId).invalidate();
            sessions.remove(userId);
        }
    }

    @Override
    public void sessionCreated(HttpSessionEvent hse) {
    	//LOGGER.info(hse.toString());
        sessions.put(hse.getSession().getId(), hse.getSession());
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent hse) {
        if(sessions.get(hse.getSession().getId()) != null){
            sessions.get(hse.getSession().getId()).invalidate();
            sessions.remove(hse.getSession().getId());	
        }
    }
}  
