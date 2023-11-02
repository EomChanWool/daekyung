package apc.sl.monitoring.monitorSetting.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import apc.sl.monitoring.monitorSetting.service.MonitorSettingService;

@Controller
public class MonitorSettingController {

	@Autowired MonitorSettingService monitorSettingService;
	
	@RequestMapping("/sl/monitoring/monitorSetting/monitorSettingList.do")
	public String monitorSettingList(ModelMap model, HttpSession session) {
		
		List<?> list = monitorSettingService.selectSetting();
		
		model.put("msList", list);
		
		return "sl/monitoring/monitorSetting/monitorSetting";
	}
	
	@RequestMapping("/sl/monitoring/monitorSetting/monitorSettingGo.do")
	public String monitorSettingGo(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		
		
		monitorSettingService.settingGo(map);
		redirectAttributes.addFlashAttribute("msg","적용 되었습니다.");
		
		return "redirect:/sl/monitoring/monitorSetting/monitorSettingList.do";
	}
	
	@RequestMapping("/sl/monitoring/monitorSetting/monitorSettingRegist.do")
	public String monitorSettingRegist(ModelMap model) {
		
		List<?> list = monitorSettingService.selectList();
		
		model.put("setList", list);
		
		return "sl/monitoring/monitorSetting/monitorSettingRegist";
	}
	
	@RequestMapping("/sl/monitoring/monitorSetting/monitorSettingRegistOk.do")
	public String monitorSettingRegistOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		
		monitorSettingService.registGo(map);
		redirectAttributes.addFlashAttribute("msg", "등록되었습니다.");
		
		return "redirect:/sl/monitoring/monitorSetting/monitorSettingList.do";
	}
	
	@RequestMapping("/sl/monitoring/monitorSetting/monitorSettingModify.do")
	public String monitorSettingModify(@RequestParam Map<String, Object> map, ModelMap model) {
		
		Map<String,Object> selectList = monitorSettingService.selectMList(map);
		
		model.put("mList", selectList);
		
		
		return "sl/monitoring/monitorSetting/monitorSettingModify";
	}
	
	@RequestMapping("/sl/monitoring/monitorSetting/monitorSettingModifyOk.do")
	public String monitorSetiingModifyOk(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {

		monitorSettingService.modifySet(map);
		
		redirectAttributes.addFlashAttribute("msg","수정되었습니다.");
		
		return "redirect:/sl/monitoring/monitorSetting/monitorSettingList.do";
	}
	
	@RequestMapping("/sl/monitoring/monitorSetting/monitorSettingDelete.do")
	public String monitorSettingDelete(@RequestParam Map<String, Object> map, RedirectAttributes redirectAttributes, HttpSession session) {
		
		monitorSettingService.deleteSet(map);
		
		redirectAttributes.addFlashAttribute("msg", "삭제되었습니다.");
		
		return "redirect:/sl/monitoring/monitorSetting/monitorSettingList.do";
	}
}
