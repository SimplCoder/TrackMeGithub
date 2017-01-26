package com.trackme.spring;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.trackme.spring.model.RouteSchedule;
import com.trackme.spring.service.RouteScheduleService;


@Controller
public class RouteScheludeController {

	private RouteScheduleService routeScheduleService;
	
	@Autowired(required=true)
	@Qualifier(value="routeScheduleService")
	public void setRouteScheduleService(RouteScheduleService routeScheduleService) {
		this.routeScheduleService = routeScheduleService;
	}

	
	
	@RequestMapping(value = "/ViewRouteScheduleDetails", method = RequestMethod.GET)
	public String viewRouteScheduleDetails(Model model) {	
		model.addAttribute("RouteSchedule", new RouteSchedule());
	    List<RouteSchedule> routeSchedule=this.routeScheduleService.listRouteScheduleDetails();	
		ObjectMapper objectMapper = new ObjectMapper();
		String routeScheduleJSON=null;
		try {
			routeScheduleJSON = objectMapper.writeValueAsString(routeSchedule);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("RouteScheduleJSON", routeScheduleJSON);
		return "routeschedule_details";
	}
	
}
