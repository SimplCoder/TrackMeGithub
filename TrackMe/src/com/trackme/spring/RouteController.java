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
import com.trackme.spring.model.DriverMaster;
import com.trackme.spring.model.Route;
import com.trackme.spring.service.DriverMasterService;
import com.trackme.spring.service.RouteService;

@Controller
public class RouteController {

private RouteService routeService;
	
	@Autowired(required=true)
	@Qualifier(value="routeService")
	public void setRouteService(RouteService routeService) {
		this.routeService = routeService;
	}

	
	@RequestMapping(value = "/ViewRouteDetails", method = RequestMethod.GET)
	public String ViewRouteDetails(Model model) {	
		model.addAttribute("Route", new Route());
	    List<Route> routeList=this.routeService.listRouteDetails();		
		ObjectMapper objectMapper = new ObjectMapper();
		String routeJSON=null;
		try {
			routeJSON = objectMapper.writeValueAsString(routeList);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("RouteJSON", routeJSON);
		return "route_view";
	}
	
}
