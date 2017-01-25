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
import com.trackme.spring.model.DeviceMaster;
import com.trackme.spring.model.DriverMaster;
import com.trackme.spring.service.DeviceMasterService;
import com.trackme.spring.service.DriverMasterService;


@Controller
public class DeviceController {

private DeviceMasterService deviceMasterService;
	
	@Autowired(required=true)
	@Qualifier(value="deviceMasterService")
	public void setDeviceMasterService(DeviceMasterService ds){
		this.deviceMasterService = ds;
	}
	
	@RequestMapping(value = "/DeviceMasters", method = RequestMethod.GET)
	public String listDriverMasters(Model model) {	
		model.addAttribute("DeviceMaster", new DeviceMaster());
	    List<DeviceMaster> deviceMaster=this.deviceMasterService.listDeviceMasters();		
		ObjectMapper objectMapper = new ObjectMapper();
		String deviceMasterJSON=null;
		try {
			deviceMasterJSON = objectMapper.writeValueAsString(deviceMaster);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("deviceMasterJSON", deviceMasterJSON);
		return "device_master_view";
	}
	
	@RequestMapping(value = "/addDeviceMastersView", method = RequestMethod.GET)
	public String driverMasterMastersView(Model model) {	
		model.addAttribute("DeviceMaster", new DeviceMaster());
		return "device_master_entry";
	}
	
	@RequestMapping(value = "/EditDeviceMastersView", method = RequestMethod.GET)
	public String editDriverMasterMasters(Model model,@RequestParam("id") String id) {	
		    model.addAttribute("DeviceMaster", this.deviceMasterService.getDeviceMasterById(id));
		return "device_master_entry";
	}
	
	//For add and update VehicleMaster both
	@RequestMapping(value= "/AddOrUpdateDeviceMastersRecord", method = RequestMethod.POST)
	public String addDeviceMaster(@ModelAttribute("DeviceMaster") DeviceMaster deviceMaster){		
		//Add Driver
		DeviceMaster deviceMasterExist=this.deviceMasterService.getDeviceMasterById(String.valueOf(deviceMaster.getDeviceNo()));
		if(deviceMasterExist==null){
		deviceMasterService.addDeviceMaster(deviceMaster);
		} else{
			deviceMasterService.updateDeviceMaster(deviceMasterExist);	
		}
		
		return "redirect:/DeviceMasters";
		
	}
	
	@RequestMapping("/RemoveDeviceMastersRecord")
    public String removeDeviceMaster(@RequestParam("id") String deviceNo){
		
		deviceMasterService.removeDeviceMaster(deviceNo);
        return "redirect:/DeviceMasters";
    }
 

	
}
