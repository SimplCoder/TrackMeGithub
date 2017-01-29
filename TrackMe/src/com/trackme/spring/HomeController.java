package com.trackme.spring;

import java.security.Principal;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.trackme.constants.Constant;
import com.trackme.spring.model.UserMaster;
import com.trackme.spring.service.MapLatlngService;
import com.trackme.spring.service.UserMasterService;




@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private MapLatlngService mapLatlngService;
	
	@Autowired
	UserMasterService userMasterService;
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model,Principal principal,HttpServletRequest request) {
		logger.info("Welcome home! The client locale is {}.", locale);
		if (principal != null) {
			String userName = principal.getName();
			HttpSession session = request.getSession();
			UserMaster currentUser = (UserMaster) session.getAttribute(Constant.CURRENT_USER);
			if (currentUser == null) {
				currentUser = userMasterService.getUserMasterById(userName);
				session.setAttribute(Constant.CURRENT_USER, currentUser);
			}
		}
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG,
				DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		List mapLatlngList = mapLatlngService.getAllVehicleLocation();

		ObjectMapper objectMapper = new ObjectMapper();
		String allVehicleLocationJson = null;
		try {
			allVehicleLocationJson = objectMapper
					.writeValueAsString(mapLatlngList);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// System.out.println("JSON=== "+allVehicleLocationJson);
		model.addAttribute("serverTime", formattedDate);
		model.addAttribute("allVehicleLocation", allVehicleLocationJson);
		return "index";
	}

	@RequestMapping(value = "/Vehicle_DetailedLogs", method = RequestMethod.GET)
	public String getDetailedLogsOfVehicle(HttpServletRequest request,
			Model model) {
		String vehicleNo = request.getParameter("id");
		if (vehicleNo != null || !vehicleNo.isEmpty()) {
			List vehicleLatlngList = mapLatlngService
					.getLatlngDetailsByVehicleNo(vehicleNo);
			ObjectMapper objMapper = new ObjectMapper();
			String vehicleLatlngListJSON = null;
			try {
				vehicleLatlngListJSON = objMapper
						.writeValueAsString(vehicleLatlngList);
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			model.addAttribute("vehicleLatlngDetails", vehicleLatlngListJSON);
		} else {
			model.addAttribute("errorMsg", "Vehicle no. is Empty.");
		}
		return "detailedLogIndex";
	}
	
	@RequestMapping(value = "/emp/get/{id}", method = RequestMethod.GET)
	public String getEmployee(Locale locale, Model model,@PathVariable("id") int id) {
		logger.info("Welcome user! Requested Emp ID is: "+id);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("id", id);
		model.addAttribute("name", "Pankaj");
		
		return "employee";
	}
	
	@RequestMapping(value="/login")
	public String login(HttpServletRequest request, Model model){
		return "login";
	}
	
	@RequestMapping(value="/logout")
	public String logout(){
		return "logout";
	} 
	
	@RequestMapping(value="/denied")
	public String denied( Model model){
		model.addAttribute("message", "You are not authorized to access");
		return "login";
	}
	
	@RequestMapping(value="/help")
	public String redirectOnHelpPage(HttpServletRequest request, Model model){
		return "help";
	}
}
