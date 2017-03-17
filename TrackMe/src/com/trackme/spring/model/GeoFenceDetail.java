package com.trackme.spring.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "geofencemaster")
public class GeoFenceDetail {
	@Id
	@Column(name = "ID")
	private int id;
	@Column(name = "geoFenceName")
	private String geoFenceName;
	@Column(name = "latitude")
	private String latitude;
	@Column(name = "longitude")
	private String longitude;
	@Column(name = "radius")
	private float radius;
	@Column(name = "location")
	private String location;
	@Column(name = "createdBy")
	private String createdBy;
	@Column(name = "createdOn")
	private Date createdDate;
	@Column(name = "modifiedBy")
	private String modifiedBy;
	@Column(name = "modifiedOn")
	private Date modifiedDate;
	@Column(name = "status")
	private String status;
	@Transient
	private String geoFenceType;
	@Column(name = "userName")
	private String userName;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getGeoFenceType() {
		return geoFenceType;
	}

	public void setGeoFenceType(String geoFenceType) {
		this.geoFenceType = geoFenceType;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getGeoFenceName() {
		return geoFenceName;
	}

	public void setGeoFenceName(String geoFenceName) {
		this.geoFenceName = geoFenceName;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public float getRadius() {
		return radius;
	}

	public void setRadius(float radius) {
		this.radius = radius;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

	public Date getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}
}
