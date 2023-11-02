package apc.sl.monitoring.capability.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import apc.sl.monitoring.capability.service.CapabilityService;

@Service
public class CapabilityServieImpl implements CapabilityService {

	@Resource CapabilityMapper capabilityMapper;
}
