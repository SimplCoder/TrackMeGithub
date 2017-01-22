package com.trackme.spring;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.trackme.spring.model.VehicleGroup;
import com.trackme.spring.model.VehicleMaster;
import com.trackme.spring.service.VehicleGroupService;

@Controller
public class VehicleGroupController {
	
	private VehicleGroupService vehicleGroupService;
	
	@Autowired(required=true)
	@Qualifier(value="vehicleGroupService")
	public void setVehicleGroupService(VehicleGroupService vehicleGroupService){
		this.vehicleGroupService = vehicleGroupService;
	}
	
	@RequestMapping(value = "/VehicleGroupView", method = RequestMethod.GET)
	public String driverMasterMastersView(Model model) {	
		model.addAttribute("VehicleGroup", new VehicleGroup());
		 List<VehicleGroup> vehicleGroupList=	this.vehicleGroupService.listVehicleGroup();
			
			ObjectMapper objectMapper = new ObjectMapper();
			String vehicleGroupJSON=null; 
			try {
				vehicleGroupJSON = objectMapper.writeValueAsString(vehicleGroupList);
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			model.addAttribute("vehicleGroupJSON", vehicleGroupJSON);
		return "group_master_view";
	}
	
	
	    //For add and update VehicleMaster both
		@RequestMapping(value= "/AddOrUpdateVehicleGroup", method = RequestMethod.POST)
		public String addDriverMaster(@ModelAttribute("VehicleGroup") VehicleGroup vehicleGroup){		
			//Add Driver
			VehicleGroup vehicleGroupExist=this.vehicleGroupService.getVehicleGroupById(vehicleGroup.getId());
			if(vehicleGroupExist==null){
				vehicleGroupService.addVehicleGroup(vehicleGroup);
			} else{
				vehicleGroupService.updateVehicleGroup(vehicleGroup);
			}
			
			return "redirect:/VehicleGroupView";		
		}
		
		@RequestMapping("/RemoveVehicleGroupRecord")
	    public String removeDriverMaster(@RequestParam("id") String vehicleGroupId){
			
			vehicleGroupService.removeVehicleGroup(vehicleGroupId);
	        return "redirect:/VehicleGroupView";
	    }
}
