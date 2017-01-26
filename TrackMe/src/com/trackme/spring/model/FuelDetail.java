package com.trackme.spring.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="fueldetail")
public class FuelDetail
{
  @Id
  @Column(name="tranid")
  private int tranId;
  
  @Column(name="vehicleno")
  private String vehicleNo;
  
  @Column(name="drivername")
  private String driverName;
  
  @Column(name="filldate")
  private Date fillDate;
  
  @Column(name="location")
  private String location;
  
  @Column(name="stationname")
  private String stationName;
  
  @Column(name="currentodo")
  private int currentOdo;
  
  @Column(name="fuelperlitre")
  private int fuelPerLitre;
  
  @Column(name="fuelqty")
  private int fuelQty;
  
  @Column(name="billno")
  private String billNo;
  
  @Transient
  private float amount;
  
  @Transient
  private float time;
  
 /** vinit suggesation fuelPerLitre should be float**/
  public float getAmount() {
	return (float) (this.fuelPerLitre*this.fuelQty);
}


public Float getTime() {
	return time;
}


public int getTranId()
  {
    return this.tranId;
  }
  
  public void setTranId(int tranId)
  {
    this.tranId = tranId;
  }
  
  public String getVehicleNo()
  {
    return this.vehicleNo;
  }
  
  public void setVehicleNo(String vehicleNo)
  {
    this.vehicleNo = vehicleNo;
  }
  
  public String getDriverName()
  {
    return this.driverName;
  }
  
  public void setDriverName(String driverName)
  {
    this.driverName = driverName;
  }
  
  public Date getFillDate()
  {
    return this.fillDate;
  }
  
  public void setFillDate(Date fillDate)
  {
    this.fillDate = fillDate;
  }
  
  public String getLocation()
  {
    return this.location;
  }
  
  public void setLocation(String location)
  {
    this.location = location;
  }
  
  public String getStationName()
  {
    return this.stationName;
  }
  
  public void setStationName(String stationName)
  {
    this.stationName = stationName;
  }
  
  public int getCurrentOdo()
  {
    return this.currentOdo;
  }
  
  public void setCurrentOdo(int currentOdo)
  {
    this.currentOdo = currentOdo;
  }
  
  public int getFuelPerLitre()
  {
    return this.fuelPerLitre;
  }
  
  public void setFuelPerLitre(int fuelPerLitre)
  {
    this.fuelPerLitre = fuelPerLitre;
  }
  
  public int getFuelQty()
  {
    return this.fuelQty;
  }
  
  public void setFuelQty(int fuelQty)
  {
    this.fuelQty = fuelQty;
  }
  
  public String getBillNo()
  {
    return this.billNo;
  }
  
  public void setBillNo(String billNo)
  {
    this.billNo = billNo;
  }
  
  @Transient
  boolean editFlag;

  public boolean isEditFlag() {
  	return editFlag;
  }

  public void setEditFlag(boolean editFlag) {
  	this.editFlag = editFlag;
  }

}
