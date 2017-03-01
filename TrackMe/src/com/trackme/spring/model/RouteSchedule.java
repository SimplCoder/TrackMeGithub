package com.trackme.spring.model;

import java.text.ParseException;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.util.StringUtils;

import com.trackme.constants.Constant;

@Entity
@Table(name="routeschedule")
public class RouteSchedule
{
  @Id
  @Column(name="schedulename")		
  private String scheduleName;
  
  @Column(name="startdate")
  private Date startDate;
  
  @Column(name="starttime")
  private String startTime;
  
  @Column(name="enddate")
  private Date endDate;
  
  @Column(name="endtime")
  private String endTime;
  
  @Column(name="routename")
  private String routeName;
  
  @Column(name="vehicleno")
  private String vehicleNo;
  
  @Column(name="monday")
  private boolean monday;
  
  @Column(name="tuesday")
  private boolean tuesday;
  
  @Column(name="wednesday")
  private boolean wednesday;
  
  @Column(name="thursday")
  private boolean thursday;
  
  @Column(name="friday")
  private boolean friday;
  
  @Column(name="saturday")
  private boolean saturday;
  
  @Column(name="sunday")
  private boolean sunday;
  
  @Column(name="alertbysms")
  private boolean alertbysms;
  
  @Column(name="alertbymail")
  private boolean alertbymail;
  
  @Column(name="modifieddate")
  private Date modifiedDate;
  
  @Column(name="modifiedby")
  private String modifiedby;
  
  @Column(name="createddate")
  private Date createdDate;
  
  @Column(name="createdby")
  private String createdby;
  
  @Transient
  private String  createdDateShow;
  @Transient
  private String  modifiedDateShow;
  @Transient
  private String  startDateShow;
  @Transient
  private String  endDateShow;
  
  
  @Transient
  private String  vehicleNoShow;
  
  public String getVehicleNoShow() {
	return 	 this.vehicleNo.replaceAll("\"", "").replaceAll("\\{", "").replaceAll("\\}", "");
}


  
  public String getCreatedDateShow() {
  	if(this.createdDate!=null){
  		return Constant.dateFormater.format(this.createdDate);
  	}
  		else{
  		return "";
  		}
  }

  public void setCreatedDateShow(String createdDateShow) {
  	if(StringUtils.isEmpty(createdDateShow))
  	this.createdDate = null;
  	else
  		try {
  			this.createdDate=Constant.dateFormater.parse(createdDateShow);
  		} catch (ParseException e) {
  			// TODO Auto-generated catch block
  			e.printStackTrace();
  		}
  	
  	this.createdDateShow = createdDateShow;
  }

  public String getModifiedDateShow() {
  	if(this.modifiedDate!=null){
  		return Constant.dateFormater.format(this.modifiedDate);
  	}
  		else{
  		return "";
  		}
  }

  public void setModifiedDateShow(String modifiedDateShow) {
  	if(StringUtils.isEmpty(modifiedDateShow))
  	this.modifiedDate = null;
  	else
  		try {
  			this.modifiedDate=Constant.dateFormater.parse(modifiedDateShow);
  		} catch (ParseException e) {
  			// TODO Auto-generated catch block
  			e.printStackTrace();
  		}
  	
  	this.modifiedDateShow = modifiedDateShow;
  }
  
  public boolean isMonday()
  {
    return this.monday;
  }
  
  public void setMonday(boolean monday)
  {
    this.monday = monday;
  }
  
  public boolean isTuesday()
  {
    return this.tuesday;
  }
  
  public void setTuesday(boolean tuesday)
  {
    this.tuesday = tuesday;
  }
  
  public boolean isWednesday()
  {
    return this.wednesday;
  }
  
  public void setWednesday(boolean wednesday)
  {
    this.wednesday = wednesday;
  }
  
  public boolean isThursday()
  {
    return this.thursday;
  }
  
  public void setThursday(boolean thursday)
  {
    this.thursday = thursday;
  }
  
  public boolean isFriday()
  {
    return this.friday;
  }
  
  public void setFriday(boolean friday)
  {
    this.friday = friday;
  }
  
  public boolean isSaturday()
  {
    return this.saturday;
  }
  
  public void setSaturday(boolean saturday)
  {
    this.saturday = saturday;
  }
  
  public boolean isSunday()
  {
    return this.sunday;
  }
  
  public void setSunday(boolean sunday)
  {
    this.sunday = sunday;
  }
  
  public boolean isAlertbysms()
  {
    return this.alertbysms;
  }
  
  public void setAlertbysms(boolean alertbysms)
  {
    this.alertbysms = alertbysms;
  }
  
  public boolean isAlertbymail()
  {
    return this.alertbymail;
  }
  
  public void setAlertbymail(boolean alertbymail)
  {
    this.alertbymail = alertbymail;
  }
  
  public Date getModifiedDate()
  {
    return this.modifiedDate;
  }
  
  public void setModifiedDate(Date modifiedDate)
  {
    this.modifiedDate = modifiedDate;
  }
  
  public String getModifiedby()
  {
    return this.modifiedby;
  }
  
  public void setModifiedby(String modifiedby)
  {
    this.modifiedby = modifiedby;
  }
  
  public Date getCreatedDate()
  {
    return this.createdDate;
  }
  
  public void setCreatedDate(Date createdDate)
  {
    this.createdDate = createdDate;
  }
  
  public String getCreatedby()
  {
    return this.createdby;
  }
  
  public void setCreatedby(String createdby)
  {
    this.createdby = createdby;
  }
  
  public void setStartTime(String startTime)
  {
    this.startTime = startTime;
  }
  
  public void setEndTime(String endTime)
  {
    this.endTime = endTime;
  }
  
  public String getScheduleName()
  {
    return this.scheduleName;
  }
  
  public void setScheduleName(String scheduleName)
  {
    this.scheduleName = scheduleName;
  }
  
  public Date getStartDate()
  {
    return this.startDate;
  }
  
  public void setStartDate(Date startDate)
  {
    this.startDate = startDate;
  }
  
  public String getStartTime()
  {
    return this.startTime;
  }
  
  public Date getEndDate()
  {
    return this.endDate;
  }
  
  public void setEndDate(Date endDate)
  {
    this.endDate = endDate;
  }
  
  public String getEndTime()
  {
    return this.endTime;
  }
  
  public String getRouteName()
  {
    return this.routeName;
  }
  
  public void setRouteName(String routeName)
  {
    this.routeName = routeName;
  }
  
  public String getVehicleNo()
  {
    return this.vehicleNo;
  }
  
  public void setVehicleNo(String vehicleNo)
  {
    this.vehicleNo = vehicleNo;
  }



public String getStartDateShow() {
	
	if(this.startDate!=null){
  		return Constant.dateFormater.format(this.startDate);
  	}
  		else{
  		return "";
  		}
}



public void setStartDateShow(String startDateShow) {
	if(StringUtils.isEmpty(startDateShow))
	  	this.startDate = null;
	  	else
	  		try {
	  			this.startDate=Constant.dateFormater.parse(startDateShow);
	  		} catch (ParseException e) {
	  			// TODO Auto-generated catch block
	  			e.printStackTrace();
	  		}
	
	this.startDateShow = startDateShow;
}



public String getEndDateShow() {
	
	if(this.endDate!=null){
  		return Constant.dateFormater.format(this.endDate);
  	}
  		else{
  		return "";
  		}
	
}



public void setEndDateShow(String endDateShow) {
	if(StringUtils.isEmpty(endDateShow))
	  	this.endDate = null;
	  	else
	  		try {
	  			this.endDate=Constant.dateFormater.parse(endDateShow);
	  		} catch (ParseException e) {
	  			// TODO Auto-generated catch block
	  			e.printStackTrace();
	  		}
	
	this.endDateShow = endDateShow;
}

@Transient
boolean editFlag;

public boolean isEditFlag() {
	return editFlag;
}

public void setEditFlag(boolean editFlag) {
	this.editFlag = editFlag;
}

@Column(name="status")
String status;

public String getStatus() {
	return status;
}

public void setStatus(String status) {
	this.status = status;
}
}
