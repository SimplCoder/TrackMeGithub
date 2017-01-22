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
import com.trackme.spring.model.UserMaster;
import com.trackme.spring.service.UserMasterService;

@Controller
public class UserServiceController {
	
	private UserMasterService UserMasterService;
	
	@Autowired(required=true)
	@Qualifier(value="UserMasterService")
	public void setUserMasterService(UserMasterService ps){
		this.UserMasterService = ps;
	}
	
	@RequestMapping(value = "/UserMasters", method = RequestMethod.GET)
	public String listUserMasters(Model model) {
		model.addAttribute("UserMaster", new UserMaster());
	
	    List<UserMaster> UserMasters=	this.UserMasterService.listUserMasters();
		
		ObjectMapper objectMapper = new ObjectMapper();
		String UserMastersJSON=null; 
		try {
			UserMastersJSON = objectMapper.writeValueAsString(UserMasters);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("UserMastersJSON", UserMastersJSON);
		return "user_master_vew";
	}
	 
	//For add and update UserMaster both
	@RequestMapping(value= "/UserMasterSave", method = RequestMethod.POST)
	public String addUserMaster(@ModelAttribute("UserMaster") UserMaster p){
		
		if(UserMasterService.getUserMasterById(p.getUserName()) ==null){
			//new UserMaster, add it
			this.UserMasterService.addUserMaster(p);
		}else{
			//existing UserMaster, call update
			this.UserMasterService.updateUserMaster(p);
		}
		
		return "redirect:/UserMasters";
		
	}
	
	@RequestMapping("/UserMasterRemove")
    public String removeUserMaster(@RequestParam("id") String id){
		
        this.UserMasterService.removeUserMaster(id);
        return "redirect:/UserMasters";
    }
  
    @RequestMapping("/UserMasterEdit")
    public String editUserMaster(@RequestParam("id") String id, Model model){
    	if(id.equals("new")){
    		model.addAttribute("UserMaster", new UserMaster());
    	}else{
        model.addAttribute("UserMaster", this.UserMasterService.getUserMasterById(id));
        }
        model.addAttribute("listUserMasters", this.UserMasterService.listUserMasters());
        return "User_master_entry";
    }
	
}
