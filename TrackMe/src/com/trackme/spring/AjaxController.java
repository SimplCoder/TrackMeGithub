package com.trackme.spring;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonView;
import com.trackme.spring.jsonview.Views;
import com.trackme.spring.model.AjaxResponseBody;
import com.trackme.spring.model.SearchCriteria;
import com.trackme.spring.model.StatusCount;
import com.trackme.spring.service.GsmMasterService;
import com.trackme.spring.service.MapLatlngService;
import com.trackme.spring.service.VehicleMasterService;

@RestController
public class AjaxController {

	@Autowired
	@Qualifier(value="gsmMasterService")
	GsmMasterService gsmMasterService;
	
	
	@Autowired(required=true)
	@Qualifier(value="vehicleMasterService")
	private VehicleMasterService vehicleMasterService;
	
	@Autowired
	private MapLatlngService mapLatlngService;
	
	
	// @ResponseBody, not necessary, since class is annotated with @RestController
	// @RequestBody - Convert the json data into object (SearchCriteria) mapped by field name.
	// @JsonView(Views.Public.class) - Optional, limited the json data display to client.
	@JsonView(Views.Public.class)
	@RequestMapping(value = "/searchStatusCounts")
	public AjaxResponseBody getSearchResultViaAjax(@RequestBody SearchCriteria search) {
		List<StatusCount> statusCounts= new ArrayList<>();

		AjaxResponseBody result = new AjaxResponseBody();

		StatusCount statusCount = new StatusCount();
		
		statusCount.setTotalVehicle(Integer.toString(vehicleMasterService.totaNoOffVehicle()));
		statusCount.setIgnitionOn(Integer.toString(gsmMasterService.ignitionOnVehicleCount()));
		statusCount.setIgnitionOff(Integer.toString(gsmMasterService.ignitionOffVehicleCount()));
		statusCount.setMoving(Integer.toString(gsmMasterService.movingVehicleCount()));
		statusCount.setIdle(Integer.toString(gsmMasterService.idleVehicleCount()));
		statusCount.setAlert(Integer.toString(gsmMasterService.alertOnVehicleCount()));
		//List<StatusCount> statusCounts =statusCounts;
		statusCounts.add(statusCount);
			if (statusCounts.size() > 0) {
				result.setCode("200");
				result.setMsg("");
				result.setResult(statusCounts);
			} else {
				result.setCode("204");
				result.setMsg("No StatusCount!");
			}

		

		//AjaxResponseBody will be converted into json format and send back to client.
		return result;

	}
	
	@JsonView(Views.Public.class)
	@RequestMapping(value = "/getAllVehicleLatestLoc", produces="application/json")
	public AjaxResponseBody getAllVehicleLatestLocAjax(){
		AjaxResponseBody result= new AjaxResponseBody();
		List allVehicleLocationList=mapLatlngService.getAllVehicleLocation();
		if(allVehicleLocationList!=null ||!allVehicleLocationList.isEmpty()){
			result.setCode("200");
			result.setMsg("success");
			result.setResult(allVehicleLocationList);
		}else{
			result.setCode("204");
			result.setMsg("No records!");
		}
		return result;
	}
	
	


}
