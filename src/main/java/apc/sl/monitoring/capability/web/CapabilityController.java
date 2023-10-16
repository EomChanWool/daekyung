package apc.sl.monitoring.capability.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import apc.sl.monitoring.capability.service.CapabilityService;

@Controller
public class CapabilityController {
	
	@Autowired
	CapabilityService capabilityService;
	
	@RequestMapping("/sl/monitoring/capability/capabilityList.do")
	public String capabilityList() {
		
		return "sl/monitoring/capability/capabilityList";
	}

}
