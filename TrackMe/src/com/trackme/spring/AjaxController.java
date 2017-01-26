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

@RestController
public class AjaxController {

	@Autowired
	@Qualifier(value="deviceMasterService")
	GsmMasterService gsmMasterService;
	
	List<StatusCount> statusCounts;

	// @ResponseBody, not necessary, since class is annotated with @RestController
	// @RequestBody - Convert the json data into object (SearchCriteria) mapped by field name.
	// @JsonView(Views.Public.class) - Optional, limited the json data display to client.
	@JsonView(Views.Public.class)
	@RequestMapping(value = "/searchStatusCounts")
	public AjaxResponseBody getSearchResultViaAjax(@RequestBody SearchCriteria search) {

		AjaxResponseBody result = new AjaxResponseBody();

		
			//List<StatusCount> statusCounts =statusCounts;

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

	private boolean isValidSearchCriteria(SearchCriteria search) {

		boolean valid = true;

		if (search == null) {
			valid = false;
		}

		if ((StringUtils.isEmpty(search.getUsername())) && (StringUtils.isEmpty(search.getEmail()))) {
			valid = false;
		}

		return valid;
	}

	// Init some StatusCounts for testing
	@PostConstruct
	private void iniDataForTesting() {
		statusCounts = new ArrayList<StatusCount>();

		StatusCount StatusCount1 = new StatusCount("10", "2", "2", "3", "4","5");
		statusCounts.add(StatusCount1);
		
	}

	// Simulate the search function
	}
