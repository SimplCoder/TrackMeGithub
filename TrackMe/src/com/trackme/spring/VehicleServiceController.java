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
import com.trackme.spring.model.VehicleMaster;
import com.trackme.spring.service.VehicleMasterService;

@Controller
public class VehicleServiceController {
	
	private VehicleMasterService vehicleMasterService;
	
	@Autowired(required=true)
	@Qualifier(value="vehicleMasterService")
	public void setVehicleMasterService(VehicleMasterService ps){
		this.vehicleMasterService = ps;
	}
	
	@RequestMapping(value = "/VehicleMasters", method = RequestMethod.GET)
	public String listVehicleMasters(Model model) {
		model.addAttribute("VehicleMaster", new VehicleMaster());
	
	    List<VehicleMaster> vehicleMasters=	this.vehicleMasterService.listVehicleMasters();
		
		ObjectMapper objectMapper = new ObjectMapper();
		String vehicleMastersJSON=null; 
		try {
			vehicleMastersJSON = objectMapper.writeValueAsString(vehicleMasters);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("vehicleMastersJSON", vehicleMastersJSON);
		return "Vehicle_master_view";
	}
	 
	//For add and update VehicleMaster both
	@RequestMapping(value= "/VehicleMasterSave", method = RequestMethod.POST)
	public String addVehicleMaster(@ModelAttribute("VehicleMaster") VehicleMaster p){
		
		if(vehicleMasterService.getVehicleMasterById(p.getVehicleNo()) ==null){
			//new VehicleMaster, add it
			this.vehicleMasterService.addVehicleMaster(p);
		}else{
			//existing VehicleMaster, call update
			this.vehicleMasterService.updateVehicleMaster(p);
		}
		
		return "redirect:/VehicleMasters";
		
	}
	
	@RequestMapping("/VehicleMasterRemove")
    public String removeVehicleMaster(@RequestParam("id") String id){
		
        this.vehicleMasterService.removeVehicleMaster(id);
        return "redirect:/VehicleMasters";
    }
  
    @RequestMapping("/VehicleMasterEdit")
    public String editVehicleMaster(@RequestParam("id") String id, Model model){
    	if(id.equals("new")){
    		model.addAttribute("VehicleMaster", new VehicleMaster());
    	}else{
        model.addAttribute("VehicleMaster", this.vehicleMasterService.getVehicleMasterById(id));
        }
        model.addAttribute("listVehicleMasters", this.vehicleMasterService.listVehicleMasters());
        return "Vehicle_master_addNew";
    }
	
}
