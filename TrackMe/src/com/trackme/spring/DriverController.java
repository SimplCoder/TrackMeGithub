package com.trackme.spring;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.trackme.spring.model.DriverMaster;
import com.trackme.spring.service.DriverMasterService;


@Controller
public class DriverController {

   private DriverMasterService driverMasterService;
	
	@Autowired(required=true)
	@Qualifier(value="driverMasterService")
	public void setDriverMasterService(DriverMasterService ds){
		this.driverMasterService = ds;
	}
	
	@RequestMapping(value = "/DriverMasters", method = RequestMethod.GET)
	public String listDriverMasters(Model model) {	
		model.addAttribute("DriverMaster", new DriverMaster());
	    List<DriverMaster> driverMaster=this.driverMasterService.getDriverMasterList();		
		ObjectMapper objectMapper = new ObjectMapper();
		String driverMasterJSON=null;
		try {
			driverMasterJSON = objectMapper.writeValueAsString(driverMaster);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("DriverMasterJSON", driverMasterJSON);
		return "driver_master_view";
	}
	
	@RequestMapping(value = "/AddDriverMastersView", method = RequestMethod.GET)
	public String driverMasterMastersView(Model model) {	
		model.addAttribute("DriverMaster", new DriverMaster());
		return "driver_master_entry";
	}
	
	@RequestMapping(value = "/EditDriverMastersView", method = RequestMethod.GET)
	public String editDriverMasterMasters(Model model,@RequestParam("id") String id) {	
		    model.addAttribute("DriverMaster", this.driverMasterService.getDriverMasterById(id));
		return "driver_master_entry";
	}
	
	//For add and update VehicleMaster both
	@RequestMapping(value= "/AddOrUpdateDriverMastersRecord", method = RequestMethod.POST)
	public String addDriverMaster(@ModelAttribute("DriverMasters") DriverMaster driverMaster){		
		//Add Driver
		DriverMaster driverMasterExist=this.driverMasterService.getDriverMasterById(String.valueOf(driverMaster.getId()));
		if(driverMasterExist==null){
		driverMasterService.addDriverMaster(driverMaster);
		} else{
			driverMasterService.updateDriverMaster(driverMaster);	
		}
		
		return "redirect:/DriverMasters";
		
	}
	
	@RequestMapping("/RemoveDriverMastersRecord")
    public String removeDriverMaster(@RequestParam("id") String driverId){
		
		driverMasterService.removeDriverMaster(driverId);
        return "redirect:/DriverMasters";
    }
 

	
}
