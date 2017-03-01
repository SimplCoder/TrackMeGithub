<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 <script>
 
 $(document).ready(function(){
	    $(".icondelete").click(function(){
	    	  if (!confirm("Do you want to inactivate ?")){
	  		      return false;
	    	  }
	    });
	});

</script>
<div  id="wrapper">
	<div class="navbar-fixed-top">
		
		<div class="row">
			<div class="col-xs-3 col-sm-3">
                    <a href="#" class="logo-img">
                        <img src="html/images/adhata.png" alt="" /></a>
                </div>
			<div class="col-xs-6 col-sm-6 text-center">
	 			<div class="top-title"> VEHICLE TRACKING AND FLEET MANAGMENT SYSTEM</div>
			</div>
			<div class="col-xs-3 col-sm-3 text-right">
				<div class="cust-logo"> <img src="html/images/cust-logo.jpg" alt=""/> <span>Customer Logo</span> </div>
			</div>
		</div>
		<div class="row border-bottom white-bgx">
                <div class="col-xs-12">
                    <nav class="navbar navbar-static-top" role="navigation">
				  <div class="navbar-header">
					<button aria-controls="navbar" aria-expanded="false" data-target="#navbar" data-toggle="collapse" class="navbar-toggle collapsed" type="button"> <i class="fa fa-reorder"></i> </button> 
				  </div>
				  <div class="navbar-collapse collapse" id="navbar">
					<ul class="nav navbar-nav">
					  <li id="hdr_live"> <a aria-expanded="false" role="button" href="home">Live</a> </li>
					  <li class="dropdown"> <a aria-expanded="false" role="button" href="#" class="dropdown-toggle">Vehicle Information<span class="caret"></span></a>
						<ul  role="menu" class="dropdown-menu">
						  <li ><a href="html/VehicleView.html"><i class="fa fa-eye"></i> Vehicle View</a></li>
						  <li ><a href="html/VehicleInfo_map_view.html"><i class="fa fa-thumb-tack"></i> Vehicle Map View</a></li>
						  <li ><a href="html/Vehicle_master_view.html"><i class="fa fa-info-circle"></i> Vehicle information </a></li>
						  <li><a href="#"><i class="fa fa-list-ul"></i> Vehicle I/O List</a></li>
						</ul>
					  </li>
					  <li> <a aria-expanded="false" role="button" href="html/reports.html">Reports</a> </li>
					  <li id="hdr_settings" class="dropdown"> <a aria-expanded="false" id="hdr_settings_link" role="button" href="#" class="dropdown-toggle" >Settings<span class="caret"></span></a>
						<ul role="menu" class="dropdown-menu">
						    <li><a href="driver_scheduling_view.html"><i class="fa fa-sitemap"></i>Driver Scheduling </a></li>
                                        <li><a href="html/vehicle_service_master_view.html"><i class="fa fa-car"></i>Vehicle Service </a></li>
                                        <li><a href="#"><i class="fa fa-tencent-weibo"></i>Geofency</a></li>
                                        <li><a href="html/fuel.html"><i class="fa fa-tint"></i>Fuel </a></li>
                                        <li><a href="html/location_master_entry.html"><i class="fa fa-map-marker"></i>Location Entry </a></li>
                                        <li><a href="html/Route.html"><i class="fa fa-road"></i>Route </a></li>
                                        <li><a href="html/route_schedule_view.html"><i class="fa fa-line-chart"></i>Route Scheduling </a></li>
                                    </ul>
					  </li>
					  <li id="hdr_configuration" class="dropdown"> <a aria-expanded="false" id="hdr_configuration_link" role="button" href="#" class="dropdown-toggle" >Configuration<span class="caret"></span></a>
						<ul role="menu" class="dropdown-menu">
						  <li id="hdr_vehicleMaster" ><a href="VehicleMasters"> <i class="fa fa-car"></i> Vehicle Master</a></li>
						  <li id="hdr_DriverMasters"><a href="DriverMasters"> <i class="fa fa-user"></i> Driver Details</a></li>
						  <li id="hdr_VehicleGroupView"><a href="VehicleGroupView"> <i class="fa fa-bus"></i> Vehicle Groups</a></li>
						  <li id="hdr_alertMaster"><a href="html/alert_master_view.html"> <i class="fa fa-bell-o"></i> Alert</a></li>
						  <li id="hdr_UserMasters"><a href="UserMasters"> <i class="fa fa-user"></i> User</a></li>
						  <li id="hdr_NoMovement"><a href="html/No_movements_view.html"> <i class="fa fa-stop"></i> No Movement </a></li>
						  <li id="hdr_DeviceMasters"><a href="DeviceMasters"> <i class="fa fa-car"></i> Device Master</a></li>
						 
						</ul>
					  </li>
					  <li class="dropdown"> <a aria-expanded="false" role="button" href="#" class="dropdown-toggle" >School<span class="caret"></span></a>
						<ul role="menu" class="dropdown-menu">
						  <li><a href="html/student_master_view.html"> <i class="fa fa-child"></i> Student Entry </a></li>
						</ul>
					  </li>
					  <li class="dropdown"> <a aria-expanded="false" role="button" href="help" class="dropdown-toggle" >Help</a>
						
					  </li>
					</ul>
					<ul class="nav navbar-top-links navbar-right">
					  <li><span class="cust-name">Welcome ${currentUser.userName } </span></li>
					  <li> <a href="j_spring_security_logout"> <i class="fa fa-sign-out"></i> Log out </a> </li>
					</ul>
				  </div>
				</nav>
                </div>
            </div>

		<c:if test="${showSuccessMessage!=null && showSuccessMessage==true }">
		  <div style="position: relative; left: 340px; top: -100px; width:50%;  height: 10% ; "   align="center" class="alert alert-success alert-dismissable" id="successMessage">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
    <strong>${successMessage}</strong>
  </div>
		
			
		</c:if>
		<c:if test="${showErrorMessage!=null && showErrorMessage==true}">
		
				  <div style="position: relative; left: 340px; top: -100px; width:50%;  height: 5% ; "   align="center" class="alert alert-danger alert-dismissable" id="errorMessage">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
    <strong>${errorMessage}</strong>
		</div>
			</c:if>
		

	</div>
	</div>
	