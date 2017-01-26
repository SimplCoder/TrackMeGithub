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
public class DriverController extends BaseController {

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
		DriverMaster driver=this.driverMasterService.getDriverMasterById(id); 
		driver.setEditFlag(true);
		model.addAttribute("DriverMaster",driver );
		return "driver_master_entry";
	}
	
	//For add and update VehicleMaster both
	@RequestMapping(value= "/AddOrUpdateDriverMastersRecord", method = RequestMethod.POST)
	public String addDriverMaster(@ModelAttribute("DriverMasters") DriverMaster driverMaster, Model model){		
		//Add Driver
		DriverMaster driverMasterExist=this.driverMasterService.getDriverMasterById(String.valueOf(driverMaster.getId()));
		if(driverMasterExist==null){
		driverMasterService.addDriverMaster(driverMaster);
		addSuccessMessage("Driver details added successfully.");
		
		} else{
			if(driverMaster.isEditFlag()){
			driverMasterService.updateDriverMaster(driverMaster);
			addSuccessMessage("Driver details updated successfully.");
			
			}else{
				addErrorMessage("Driver Number already exists. Please enter unique value.");
				addSuccessOrErrorMessageToModel(model);
				model.addAttribute("DriverMaster", driverMaster);
				   return "driver_master_entry";

				
			}
		}
		addSuccessOrErrorMessageToModel(model);
		return listDriverMasters(model);
		
		
	}
	
	@RequestMapping("/RemoveDriverMastersRecord")
    public String removeDriverMaster(@RequestParam("id") String driverId ,Model model){
		
		driverMasterService.removeDriverMaster(driverId);
		  addSuccessMessage("Driver details removed successfully.");
	        addSuccessOrErrorMessageToModel(model);
			
	        return listDriverMasters(model);
	    
	}
 

	
}
