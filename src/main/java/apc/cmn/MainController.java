package apc.cmn;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MainController {
	
	@RequestMapping(value="/sl/main.do")
	public String saMain(HttpSession session) {
//		if(session.getAttribute("user_id") != null) {
//			return "redirect:";
//		}
		return "sl/main";
	}
	
	@ResponseBody
	@RequestMapping(value="/navCon.ajax")
	public void navCon(HttpSession session,@RequestParam("nav_status") String nav_status) {
		session.setAttribute("nav_status", nav_status);
	}
}
