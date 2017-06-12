package com.trackme.spring.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="vehiclegroup")
public class VehicleGroup
{  
  @Id	
  @Column(name="id") 	
  private String id;
  @Column(name="createdby") 
  private String createdBy;
  @Column(name="createddate") 
  private Date createdDate;
  
 
  public String getId()
  {
    return this.id;
  }
  
  public void setId(String id)
  {
    this.id = id;
  }
  
  public String getCreatedBy()
  {
    return this.createdBy;
  }
  
  public void setCreatedBy(String createdBy)
  {
    this.createdBy = createdBy;
  }
  
  public Date getCreatedDate()
  {
    return this.createdDate;
  }
  
  public void setCreatedDate(Date createdDate)
  {
    this.createdDate = createdDate;
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
