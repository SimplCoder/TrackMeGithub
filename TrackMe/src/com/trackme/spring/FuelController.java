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
import com.trackme.spring.model.FuelDetail;
import com.trackme.spring.service.FuelService;

@Controller
public class FuelController {

	private FuelService fuelService;

	@Autowired(required=true)
	@Qualifier(value="fuelService")
	public void setFuelService(FuelService fuelService) {
		this.fuelService = fuelService;
	}
	
	@RequestMapping(value = "/ViewFuelDetails", method = RequestMethod.GET)
	public String viewFuelDetails(Model model) {	
		model.addAttribute("FuelDetail", new FuelDetail());
	    List<FuelDetail> fuelDetails=this.fuelService.listFuelDetails();	
		ObjectMapper objectMapper = new ObjectMapper();
		String fuelDetailsJSON=null;
		try {
			fuelDetailsJSON = objectMapper.writeValueAsString(fuelDetails);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("FuelDetailsJSON", fuelDetailsJSON);
		return "fuel_view";
	}
	
}
