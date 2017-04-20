package com.trackme.spring;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.trackme.constants.Constant;
import com.trackme.spring.model.Student;
import com.trackme.spring.model.UserMaster;
import com.trackme.spring.model.VehicleGroup;
import com.trackme.spring.model.VehicleMaster;
import com.trackme.spring.service.StudentService;
import com.trackme.spring.service.DeviceMasterService;
import com.trackme.spring.service.LocationService;
import com.trackme.spring.service.RouteScheduleService;
import com.trackme.spring.service.RouteService;
import com.trackme.spring.service.VehicleGroupService;
import com.trackme.spring.service.VehicleMasterService;


@Controller
public class StudentController extends BaseController{

private StudentService studentService;

@Autowired(required=true)
@Qualifier(value="routeService")
private RouteService routeService;

@Autowired(required=true)
@Qualifier(value="locationService")
private LocationService  locationService;


@Autowired(required=true)
@Qualifier(value="routeScheduleService")
private RouteScheduleService  routeScheduleService   ;
	
	@Autowired(required=true)
	@Qualifier(value="studentService")
	public void setStudentService(StudentService ds){
		this.studentService = ds;
	}
	
	
	
	@RequestMapping(value = "/Students", method = RequestMethod.GET)
	public String listStudents(Model model, HttpServletRequest request, HttpServletResponse response) {	
		model.addAttribute("Student", new Student());
	    List<Student> student=this.studentService.listStudents();		
		ObjectMapper objectMapper = new ObjectMapper();
		String studentJSON=null;
		try {
			studentJSON = objectMapper.writeValueAsString(student);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("studentJSON", studentJSON);
		return "Student_view";
	}
	
	@RequestMapping(value = "/addNoStudents", method = RequestMethod.GET)
	public String altersView(Model model, HttpServletRequest request, HttpServletResponse response) {	
		model.addAttribute("Student", new Student());
		
		model.addAttribute("routeSchedules", routeScheduleService.listRouteScheduleDetails());
		model.addAttribute("routes", routeService.listRouteDetails());
		model.addAttribute("locations", locationService.listLocations());
		return "Student_entry";
	}
	
	@RequestMapping(value = "/EditStudentsView", method = RequestMethod.GET)
	public String editStudentMasters(Model model,@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) {	
		Student student=this.studentService.getStudentById(id);
		student.setEditFlag(true);
		
		model.addAttribute("routeSchedules", routeScheduleService.listRouteScheduleDetails());
		model.addAttribute("routes", routeService.listRouteDetails());
		model.addAttribute("locations", locationService.listLocations());
				
		model.addAttribute("Student", student);
		return "Student_entry";
	}
	
	//For add and update VehicleMaster both
	@RequestMapping(value= "/AddOrUpdateStudentsRecord", method = RequestMethod.POST)
	public String addStudent(@ModelAttribute("Student") Student student, Model model, HttpServletRequest request, HttpServletResponse response){		
		//Add Driver
		
		
		
			Student studentExist=this.studentService.getStudentById(String.valueOf(student.getId()));
		
					
			if(studentExist==null){
			UserMaster currentUser=(UserMaster) request.getSession().getAttribute(Constant.CURRENT_USER);
			student.setCreatedBy(currentUser.getUserName());
			student.setCreatedDate(new Date());
		
		studentService.addStudent(student);
		addSuccessMessage("Student details added successfully.");
		
		} else{
			if(student.isEditFlag()){
				UserMaster currentUser=(UserMaster) request.getSession().getAttribute(Constant.CURRENT_USER);
				student.setModifiedBy(currentUser.getUserName());
				student.setModifiedDate(new Date());
			
				studentService.updateStudent(student);	
			addSuccessMessage("Student details updated successfully.");
			}else{
				addErrorMessage("Student already exists. Please enter unique student.");
				addSuccessOrErrorMessageToModel(model);
				model.addAttribute("Student", student);
				   return "Student_entry";
			}
		}
		addSuccessOrErrorMessageToModel(model);
		return listStudents(model,request,response);
		
	}
	
	@RequestMapping("/RemoveStudentsRecord")
    public String removeStudent(@RequestParam("id") String deviceNo, Model model, HttpServletRequest request, HttpServletResponse response){
		
		studentService.removeStudent(deviceNo);
	     addSuccessMessage("Student details removed successfully.");
	        addSuccessOrErrorMessageToModel(model);
			
	        return listStudents(model,request,response);
	    
    }
 

	
}
