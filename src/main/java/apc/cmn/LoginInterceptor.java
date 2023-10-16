package apc.cmn;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import apc.sl.basicInfo.actualResult.service.ActualResultService;


public class LoginInterceptor extends HandlerInterceptorAdapter  {
	@Inject
	private ActualResultService actualResultService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		Object obj = session.getAttribute("memberVO");
		
		return true;
	}
}
