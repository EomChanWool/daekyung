package apc.cmn;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.FlashMapManager;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import apc.sl.basicInfo.qualityInfo.service.QualityInfoService;
import apc.sl.basicInfo.userAuthority.service.UserAuthorityService;
import apc.util.ScriptAlert;


public class CommonInterceptor extends HandlerInterceptorAdapter {
	@Inject
	private UserAuthorityService userAuthorityService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		String str1 = request.getRequestURL().toString();
		String[] str2 = str1.split("/");
		System.out.println("str5 : " + str2[5]);
		if(str2[5].equals("dashBoard.do")) {
			
			return true;
		}
		if(str2[5].equals("popMf")) {
			return true;
		}
		int accessLevel = userAuthorityService.selectAccess(str2[5]);
		int menuState = userAuthorityService.menuState(str2[5]);
		Map<String, Object> userMap = (Map<String, Object>) session.getAttribute("memberVO");
		
		
		
		if(menuState == 0) {
			ScriptAlert.alertAndMovePage(response, "등록되지않은 메뉴입니다.","/sl/basicInfo/materialMove/materialMoveList.do");
			return false;
		}
		
		if(session.getAttribute("user_id") == null) {
			ScriptAlert.alertAndMovePage(response, "접근 권한이 없습니다","/sl/main.do");
			return false;
		}else {
			if(accessLevel > Integer.parseInt(userMap.get("miLevel")+"")) {
				ScriptAlert.alertAndMovePage(response, "접근 권한이 없습니다","/sl/basicInfo/materialMove/materialMoveList.do");
				return false;
			}
		}
		return true;
	}
	
	public void goMain(HttpServletRequest request, HttpServletResponse response,String msg,String place) throws Exception {
		FlashMap flashMap = new FlashMap();
		flashMap.put("msg", msg);
		FlashMapManager flashMapManager = RequestContextUtils.getFlashMapManager(request);
		flashMapManager.saveOutputFlashMap(flashMap, request, response);
		response.sendRedirect(request.getContextPath()+"/"+place+"/main.do");
	}
}
