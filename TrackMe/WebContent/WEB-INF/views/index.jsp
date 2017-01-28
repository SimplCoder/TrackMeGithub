<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Vehicle Service View</title>
<link href="html/css/css.css" rel="stylesheet" type="text/css"/>
<link href="html/css/bootstrap.min.css" rel="stylesheet">

<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
<link href="html/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="html/css/animate.css" rel="stylesheet">
<link href="html/css/style.css" rel="stylesheet">
<link href="html/css/custom.css" rel="stylesheet">
<link href="html/css/dataTables.bootstrap.min.css" rel="stylesheet">
<link href="html/css/buttons.dataTables.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/select/1.2.1/css/select.dataTables.min.css" rel="stylesheet">
</head>
<body class="top-navigation">
<jsp:directive.include file="header.jsp" />
  <div id="page-wrapper2" class="gray-bg" style="top:128px !important">
    <div class="rowx wrapper border-bottom white-bg page-heading">
      <div class="col-sm-12">
      
        <div class="graphs">
          <div class="graph-in">
            <div class="graph-img">
              <canvas id="doughnutChart" height="100"></canvas>
            </div>
            <div class="graph-txt">Ign Off</div>
          </div>
          <div class="graph-in">
            <div class="graph-img">
              <canvas id="doughnutChart2" height="100"></canvas>
            </div>
            <div class="graph-txt">Ign On</div>
          </div>
          <div class="graph-in">
            <div class="graph-img">
              <canvas id="doughnutChart3" height="100"></canvas>
            </div>
            <div class="graph-txt">Moving/Idl</div>
          </div>
       <div class="graph-in">
            <div class="graph-img">
              <canvas id="doughnutChart4" height="100"></canvas>
            </div>
            <div class="graph-txt">Alert</div>
          </div>
          <div class="graph-in">
            <div class="graph-img"  style="font-size: 25px;"> Unit Count 
              <div class="graph-txt" style="font-size: 20px;" ><span id="vehcileCountShow"></span></div>
           
            </div>
          </div>
        </div>
      
    
	 </div>
    </div>
    <div class="row">
      <div class="col-lg-12">
        <div class="wrapper wrapper-content fadeInUp pad-bot-0">
          <div class="row">
            <div class="col-lg-12">
              <div class="ibox float-e-margins pad-bot-0" style="background:#fff;">
                <div class="row">
                  <div id="same-height" class="col-md-6 md-pad-left" style="padding-right:0;">
                   
                    <div id="gridtoggle" class="ibox-content pad-bot-0">
                      <div class="table-responsive">
                          <!--Rohan code start 1 -->	
                        <table id="entrydata"  class="table table-striped table-bordered new-tbl" style="width:100%">
                          <thead>
                          <tr class="leftMenu">
                                                    	 <th width="3%" align="center" valign="middle"></th>
				
                                                    <th width="15%" align="center" valign="middle">Vehicle No</th>
                                                    <th width="7%" align="center" valign="middle">Status</th>
                                                    <th width="11%" align="center" valign="middle">Speed</th>
                                                    <th width="10%" align="center" valign="middle">Movement</th>
                                                    <th width="11%" align="center" valign="middle">Location</th>
                                                    <th width="7%" align="center" valign="middle">Date/Time</th>
												
                                                </tr>
                          </thead>
                          
                        </table>
                          <input type="hidden" id="tempVehicleNo">
                          <!--Rohan code end 1 -->	
                      </div>
                    </div>
                  </div>
                  <div id="same-height2" class="col-md-6 md-pad-right"  style=" width:50%;height:80%;padding-left:0;">
                    <div class="ibox-title">
                      <div class="map-btns">
                        <ul class="subnav-right az-move-right">
                          <li class="map-reset"><a href="#" >&nbsp;</a></li>
                          <li class="map-actions"><a href="#" class="">&nbsp;</a> </li>
                          <li class="map-vehicles"><a href="#" class="">&nbsp;</a> </li>
                          <li class="map-landmarks"><a href="#" >&nbsp;</a></li>
                          <li class="map-geofences"><a href="#">&nbsp;</a> </li>
                          <li class="map-layout-toggle1"><a class="map-layout-togglea1 active" href="javascript:void(0)" onclick ="reSize('side')"></a> </li>
                          <li class="map-layout-toggle2"><a href="javascript:void(0)" class="map-layout-togglea2" onclick ="reSize('wide')"></a></li>
                          <li class="map-icon-medium"><a class="active" href="#" >&nbsp;</a></li>
                          <li class="map-icon-large"><a href="#" class="">&nbsp;</a></li>
                          <li class="map-fullscreen"><a href="#">&nbsp;</a></li>
                        </ul>
                      </div>
                    </div>
                    <div id="maptoggle" class="ibox-content"> 
                         <div id="map" style="width:100%;height:400px"></div>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCeQdAwrHm8Zap7jwX_gNRA3dhH-CxdCWQ&callback=initialize"></script>
                  
<!--Rohan code start 3 -->
    <script>
   /*   function initMap() {
        var uluru = {lat: 18.5679, lng: 73.9143};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 9,
          center: uluru,
          mapTypeId:google.maps.MapTypeId.ROADMAP
            
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
      } */
        
        var MY_MAPTYPE_ID = 'custom_style';
            
            function initialize() {
   
             var point = new google.maps.LatLng(16.8524, 
                                               74.5815);
            var map_canvas = document.getElementById('map');
            var map_options = {
            center: new google.maps.LatLng(16.8524, 74.5815),
            zoom: 10,
            mapTypeId: google.maps.MapTypeId.ROADMAP
                              };   
            map = new google.maps.Map(map_canvas, map_options)

        /*     new google.maps.Marker({
              position: point,
              map: map
           }); */
                                  }
            
            initialize();
            //google.maps.event.addDomListener(window, 'load', initialize);
    </script>
<!--Rohan code end 3 -->
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
<jsp:directive.include file="footer.jsp" />
</div>

<!-- Mainly scripts --> 
<script type="text/javascript" src="html/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="html/js/tether.min.js"></script>
<script type="text/javascript" src="html/js/bootstrap.js"></script>
<script type="text/javascript" src="html/js/angular.min.js"></script>
<script type="text/javascript" src="html/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="html/js/dataTables.bootstrap.min.js"></script>

<script type="text/javascript" src="html/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="html/js/buttons.flash.min.js"></script>
<script type="text/javascript" src="html/js/markerwithlabel.js"></script>

<script type="text/javascript" src="html/js/jspdf.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
<script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.2.4/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="html/js/icheck.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.2.4/js/buttons.colVis.min.js"></script>
<script>
var table;
var refreshOut;
	$(document).ready(function () {
		 $('#hdr_live').addClass("dropdown active");
		
        // <!--Rohan code start 2 -->	
        
      /*  try{
		$('#entrydata').DataTable({
			dom: 'Bfrtp',
			ordering:false,
            
			buttons: [

						'excelHtml5',
						
						'pdfHtml5'
					]
		}); */
        //{"vehicleno":"","description":"Normal Direction","location":"Unnamed Road Bengaluru Karnataka 635103 India","datetime1":1464771657000,"speed":25}
        try{
        allVehicleLocationJSON=${allVehicleLocation};
        drawTable(allVehicleLocationJSON); 
     
    /*$('input[type=radio][name=Vehicleno]').each(function () {
        var $this = $(this);
        if ($(this).prop('checked')) {
          var  id = $this.attr('id');
             $.each(allVehicleLocationJSON, function(key,value){
                if(value.vehicleno==id){
                     globalLatitude=value.latitude;
                    globalLongitude=value.longitude;
                 }
        });
        }
    });*/
            

    $('#entrydata').on("change",'input[type=radio][name=Vehicleno]',function(){ //we have to register new event handler for dynamically loaded contents after AJAX
        if ($(this).prop('checked')) {
           var id = $(this).attr('id');
             $('#tempVehicleNo').val(id); //set to display same vehicle locaion whenever reload
            $.each(allVehicleAjaxArr, function(key,value){
                if(value.vehicleno==id){
                     var map_canvas = document.getElementById('map');
                     var map_options = {
                     center: new google.maps.LatLng(value.latitude, value.longitude),
                     zoom: 10,
                     mapTypeId: google.maps.MapTypeId.ROADMAP
                                   }   
                     map = new google.maps.Map(map_canvas, map_options)
                     setMarkers(map,new google.maps.LatLng(value.latitude, 
                             value.longitude),id,value.location,value.datetime1);
                }
            });
        }
    });
    /*  $('input[type=radio][name=Vehicleno]').change(function() {
    {data: "location"},
                     {data: "location"},
                     {data: "datetime1"}
        if ($(this).prop('checked')) {
           var id = $(this).attr('id');
             $('#tempVehicleNo').val(id); //set to display same vehicle locaion whenever reload
            $.each(allVehicleLocationJSON, function(key,value){
                if(value.vehicleno==id){
                     var map_canvas = document.getElementById('map');
                     var map_options = {
                     center: new google.maps.LatLng(value.latitude, value.longitude),
                     zoom: 10,
                     mapTypeId: google.maps.MapTypeId.ROADMAP
                                   }   
                     map = new google.maps.Map(map_canvas, map_options)
                    new google.maps.Marker({
                    position: new google.maps.LatLng(value.latitude, 
                                              value.longitude),    
                    map: map
                    });
                }
            });
        }
     });*/
            
            
   /* (function update() {
    $.ajax({
       url : 'getAllVehicleLatestLoc',
         dataType: 'json',
            success : function(data) {
                var resultStr=JSON.stringify(data);
                var resultStrArr=jQuery.parseJSON(resultStr);
                var vehicleLocationStr=JSON.stringify(resultStrArr.result);
                var vehicleLocationArr=jQuery.parseJSON(vehicleLocationStr);
               // drawTable(vehicleLocationArr);
            }                       
    }).then(function() {           // on completion, restart
       setTimeout(update, 10000);  // function refers to itself
    });
    })(); */
    var callback=true;//made true to not show any vehicle on map upon loading the page 
            
    function drawTable(jsonArr){
        
      table= $('#entrydata').DataTable({
			dom: '<"top"flB>rt<"bottom"p><"clear">',
            //data:jsonArr,
            ajax : {
        "url" : "getAllVehicleLatestLoc",
        "dataSrc" : function (json) {
           // alert(json.result);
            allVehicleAjaxArr=json.result;
            //alert(JSON.stringify(allVehicleAjaxArr));
            return json.result;
        }},
             columns:[
                    {data: "vehicleno",
                    	 "render": function ( data, type, full, meta ) {
                             if($('#tempVehicleNo').val()!=""){
                                 if(data==$('#tempVehicleNo').val()){
                                     updateMarker(allVehicleAjaxArr,data);
                                     
                                     return '<input type="radio" id="' + data + '" name="Vehicleno" class="singleRadio" value="true" checked="checked">';
                                 }else{
                                      return '<input type="radio" id="' + data + '" name="Vehicleno" class="singleRadio">';
                                 }
                             }else{
                                updateMarker(allVehicleAjaxArr,data);
                                if(!callback){
                                    callback=true;
                                }
                                //return '<input type="radio" id="' + data + '" name="Vehicleno" class="singleRadio" value="true" checked="checked">';
                                return '<input type="radio" id="' + data + '" name="Vehicleno" class="singleRadio">';
                             }
                            }
                    	 },
                     {data: "vehicleno",
                    	 "render": function ( data, type, full, meta ) {
                    	      return '<a href="Vehicle_DetailedLogs?id='+data+'">'+data+'</a>';}
                    	 },
                     {data: "description"},
                     {data: "speed"},
                     {data: "location"},
                     {data: "location"},
                     {data: "datetime1"}
                    ],
            ordering:false,
			 lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "All"]],
			buttons: [
{
    extend: 'colvis',
   text :'',
    columns: ':gt(1)'
},

{
    extend: 'excelHtml5',
    text :''
 },{
	    extend:'pdfHtml5',
	    text :''
	 }
],
select: {
    style: 'single'
}
		}); 
    }
    
    
    
    function updateMarker(jsonArrMarker,vehicleId){
  
        $.each(jsonArrMarker, function(key,value){
                if(value.vehicleno==vehicleId){
                    if(!callback){
                         var map_canvas = document.getElementById('map');
                         var map_options = {
                         center: new google.maps.LatLng(value.latitude, value.longitude),
                         zoom: 10,
                         mapTypeId: google.maps.MapTypeId.ROADMAP
                                       } ;  
                         map = new google.maps.Map(map_canvas, map_options);
                         setMarkers(map,new google.maps.LatLng(value.latitude, 
                                 value.longitude),vehicleId);
                    }
                   
                 
                }
            });
    }
            
    
    
            
     // <!--Rohan code end 2 -->  
            
		if($("input[type='search']").length>0){
			$("input[type='search']").addClass("form-control");
		}
		if($("select[name='entrydata_length']").length>0){
			$("select[name='entrydata_length']").addClass("form-control");
		}
		$('.i-checks').iCheck({
                    checkboxClass: 'icheckbox_square-green',
                    radioClass: 'iradio_square-green',
                });
        }catch(err){}
        });
     
	
	
	function setMarkers(map,position,vehicleNo,location,datetime) {
       
        var hoverDiv= '<div style="display:none" class="markerTooltip" id="markerhover'+vehicleNo+'"><p>'+vehicleNo+'</p><p>'+location+'</p><p>'+datetime+'</p></div>';
        // The final coordinate closes the poly by connecting to the first coordinate.
       var image = {
          url: 'html/images/vehiclemap.png',
          // This marker is 20 pixels wide by 32 pixels high.
          size: new google.maps.Size(50, 50),
          // The origin for this image is (0, 0).
          origin: new google.maps.Point(0, 0),
          // The anchor for this image is the base of the flagpole at (0, 32).
          anchor: new google.maps.Point(0, 32)
        };
        
          var marker = new MarkerWithLabel({
            position: position,
            map: map,
            icon: image,
            labelStyle: {opacity: 0.75},
            draggable: false,
            raiseOnDrag: true,
            labelContent: '<div onMouseOver="show(\'markerhover'+vehicleNo+'\')" onMouseOut="hide(\'markerhover'+vehicleNo+'\')">'+vehicleNo+''+hoverDiv+'</div>',
              labelClass :"labels"
          });
        
      }	
	
	
	function show(id) {
	    document.getElementById(id).style.display = "block";
	    document.getElementById(id).style.zIndex = 10;
	
	  }
	  function hide(id) {
	    document.getElementById(id).style.display = "none";
	  }
</script>
<style>
.markerTooltip {
color: #fff;
    background-color: #d60002;
    font-family: "Lucida Grande", "Arial", sans-serif;
    
    position: fixed;
    z-index: 10000000009;
    font-size: 11px;
    text-align: left;
    border-radius: 5px!important;
    border: 2px solid black;
}

  .labels {
    color: #fff;
    background-color: #d60002;
    font-family: "Lucida Grande", "Arial", sans-serif;
    font-size: 14px;
    font-weight: bold;
    text-align: center;
    width: 70px;
    border: 2px solid black;
    white-space: nowrap;
}
</style>

<script>
            $(document).ready(function () {
			try{
			$(".dt-buttons").addClass("pull-right");
					$("#entrydata_filter").addClass("pull-left");
                $('.i-checks').iCheck({
                    checkboxClass: 'icheckbox_square-green',
                    radioClass: 'iradio_square-green',
                });
			}catch(err){}
            
            });
            
        </script> 

<!-- ChartJS--> 
<script src="html/js/Chart.min.js"></script> 

<script>
	
/* Thanks to CSS Tricks for pointing out this bit of jQuery
http://css-tricks.com/equal-height-blocks-in-rows/
It's been modified into a function called at page load and then each time the page is resized. One large modification was to remove the set height before each new calculation. */

equalheight = function(container){

var currentTallest = 0,
     currentRowStart = 0,
     rowDivs = new Array(),
     $el,
     topPosition = 0;
 $(container).each(function() {

   $el = $(this);
   $($el).height('auto');
   topPostion = $el.position().top;

   if (currentRowStart != topPostion) {
     for (currentDiv = 0 ; currentDiv < rowDivs.length ; currentDiv++) {
       rowDivs[currentDiv].height(currentTallest);
     }
     rowDivs.length = 0; 
     currentRowStart = topPostion;
     currentTallest = $el.height();
     rowDivs.push($el);
   } else {
     rowDivs.push($el);
     currentTallest = (currentTallest < $el.height()) ? ($el.height()) : (currentTallest);
  }
   for (currentDiv = 0 ; currentDiv < rowDivs.length ; currentDiv++) {
     rowDivs[currentDiv].height(currentTallest);
   }
 });
}




	
	</script>
<style>
	   .google-map-live {
    bottom: 15px;
    height: auto !important;
    left: 0;
    position: absolute !important;
    right: 30px;
    top: 68px;
    width: auto;
}
@media(max-width:1125px){
 .google-map-live {
   
    top: 100px;
   
}
}

@media(max-width:991px){
	.ibox-content{ position:relative;}
 .google-map-live {
   
    position:static !important; height:300px !important;
   
}
}

	   </style>
	   <script>
	   $(window).load(function() {
		   equalheight('.ibox.float-e-margins.pad-bot-0 .col-md-6');
		 });


		 $(window).resize(function(){
		   equalheight('.ibox.float-e-margins.pad-bot-0 .col-md-6');
		 });
		 
		 
		
	   </script>
</body>



<script>


jQuery(document).ready(function($) {


		searchViaAjax();

});

function searchViaAjax() {

	var search = {}
	search["username"] = "";
	search["email"] = "";

	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : "searchStatusCounts",
		data : JSON.stringify(search),
		dataType : 'json',
		timeout : 100000,
		success : function(data) {
			console.log("SUCCESS: ", data);
			display(data);
		},
		error : function(e) {
			console.log("ERROR: ", e);
			display(e);
		},
		done : function(e) {
			console.log("DONE");
		
		}
	});

}

function searchViaAjaxVehicle() {

	var search = {}
	search["username"] = "";
	search["email"] = "";

	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : "getAllVehicleLatestLoc",
		data : JSON.stringify(search),
		dataType : 'json',
		timeout : 100000,
		success : function(data) {
			console.log("SUCCESS: ", data);
			createGridVehicle(data);
		},
		error : function(e) {
			console.log("ERROR: ", e);
			
		},
		done : function(e) {
			console.log("DONE");
		
		}
	});

}

function createGridVehicle(data){
	var vehicleData= data.allVehicle;
	console.log(vehicleData)
}

function display(data) {

	

    var doughnutOptions = {
    		
        segmentShowStroke: true,
        segmentStrokeColor: "#fff",
        segmentStrokeWidth: 1,
        percentageInnerCutout: 0,
        animationSteps: 100,
        animationEasing: "easeOutBounce",
        animateRotate: true,
        animateScale: false,
        responsive: true,
        onAnimationComplete: function()
        {
            this.showTooltip(this.segments, true);

            //Show tooltips in bar chart (issue: multiple datasets doesnt work http://jsfiddle.net/5gyfykka/14/)
            //this.showTooltip(this.datasets[0].bars, true);

            //Show tooltips in line chart (issue: multiple datasets doesnt work http://jsfiddle.net/5gyfykka/14/)
            //this.showTooltip(this.datasets[0].points, true);  
        },

        tooltipEvents: [],

        showTooltips: true,
        
        // String - Tooltip background colour
        tooltipFillColor: "rgba(0,0,0,0.4)",


        // String - Tooltip label font declaration for the scale label
        tooltipFontFamily: "'Helvetica Neue', 'Helvetica', 'Arial', sans-serif",

        // Number - Tooltip label font size in pixels
        tooltipFontSize: 12,

        // String - Tooltip font weight style
        tooltipFontStyle: "normal",

        
        // String - Tooltip title font colour
	    tooltipTitleFontColor: "#fff",

	    // Number - pixel width of padding around tooltip text
	    tooltipYPadding: 2,

	    // Number - pixel width of padding around tooltip text
	    tooltipXPadding: 3,

	    // Number - Size of the caret on the tooltip
	    tooltipCaretSize: 4,

	    // Number - Pixel radius of the tooltip border
	    tooltipCornerRadius: 2,

	    // Number - Pixel offset from point x to tooltip edge
	    tooltipXOffset: 2,
	    tooltipYOffset: 1
       
    };
 var totalVeh =parseInt(data.result["0"].totalVehicle-data.result["0"].ignitionOn);
 var igniOn= parseInt(data.result["0"].ignitionOn);
 var igniOff= parseInt(data.result["0"].ignitionOff);

$("#vehcileCountShow").text(totalVeh); 
    var doughnutData = [
                        {
                            value: totalVeh,
                            labelFontSize : '2',
                            color: "#d9d9d9",
                            labelColor : 'blue'
                            
                        },
                        {
                            value: igniOff,
                            color: "#ed5564",
                            labelFontSize : '2',
                            labelColor : 'blue'
                            
                        }
                    ];

    var ctx = document.getElementById("doughnutChart").getContext("2d");
    var myNewChart = new Chart(ctx).Doughnut(doughnutData, doughnutOptions);
	

   
	
	/* -------------------2222222-------------------------------- */
	var doughnutData2 = [
 
        {
            value: totalVeh,
            color: "#d9d9d9",
            highlight: "#d9d9d9",
            label: ""
        },
        {
            value: igniOn,
            color: "#1cb295",
            highlight: "#1cb295",
            label: ""
        }
    ];

  
    var ctx2 = document.getElementById("doughnutChart2").getContext("2d");
    var myNewChart2 = new Chart(ctx2).Doughnut(doughnutData2, doughnutOptions);
	
    var movingNo= parseInt(data.result["0"].moving);
    var idleNo= parseInt(data.result["0"].idle);
  
	/* -------------------3333-------------------------------- */
	var doughnutData3 = [
 
        {
            value: idleNo,
            color: "#00aeff",
            highlight: "#d9d9d9",
            label: ""
        },
        {
            value: movingNo,
            color: "#ff9000",
            highlight: "#ff9000",
            label: ""
        }
    ];

   
    var ctx3 = document.getElementById("doughnutChart3").getContext("2d");
    var myNewChart3 = new Chart(ctx3).Doughnut(doughnutData3, doughnutOptions);
	
	
	
	/* -------------------444-------------------------------- */
	
	  var alertNo= parseInt(data.result["0"].alert);
  
	var doughnutData4 = [
 
        {
            value: totalVeh,
            color: "#d9d9d9",
            highlight: "#d9d9d9",
            label: ""
        },
        {
            value: alertNo,
            color: "#ed5564",
            highlight: "#00aeff",
            label: ""
        }
    ];
	  
    var ctx4 = document.getElementById("doughnutChart4").getContext("2d");
    var myNewChart4 = new Chart(ctx4).Doughnut(doughnutData4, doughnutOptions);
	
	
	/* -------------------555-------------------------------- */
	

	
	
	
	
	
}


</script>

<style>

button.dt-button, div.dt-button, a.dt-button {
    position: relative;
    display: inline-block;
    box-sizing: border-box;
    margin-right: 0.333em;
    padding: 0.5em 0em;
    border: 0px solid #999;
    border-radius: 2px;
    cursor: pointer;
    font-size: 0.88em;
    color: black;
    white-space: nowrap;
    overflow: hidden;
    background-color: rgba(233, 233, 233, 0);
    background-image: -webkit-linear-gradient(top, #fff 0%, #e9e9e9 100%);
    background-image: -moz-linear-gradient(top, #fff 0%, #e9e9e9 100%);
    background-image: -ms-linear-gradient(top, #fff 0%, #e9e9e9 100%);
    background-image: -o-linear-gradient(top, #fff 0%, #e9e9e9 100%);
    background-image: linear-gradient(to bottom, #fff 0%, rgba(233, 233, 233, 0) 100%);
    filter: progid:DXImageTransform.Microsoft.gradient(GradientType=0,StartColorStr='white', EndColorStr='#e9e9e9');
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    text-decoration: none;
    outline: none;
}

#same-height2 {
margin: 0;
        padding: 0;
        height: 100%;
	width:50%;
	height:80%;
	position:absolute;
	float:left;
	right:0px;
	z-index:100;
	}
	#same-height {
	margin: 0;
        padding: 0;
        height: 100%;
	background-color:white;
	position:absolute;
	width:50%;
	float:left; 
	
    }

</style>
<script>
function reSize(side) {
	var oldside=map.getBounds().getNorthEast().lng()
	if (side=="wide"){

	document.getElementById("same-height2").style.width="100%"
	document.getElementById("same-height2").style.height="50%"
//gridtoggle
	var sidetable  = document.getElementById('same-height');

	sidetable.style.width = '100%'; 
	sidetable.style.top = '58%';
	sidetable.style.marginTop=null;
	$('#same-height').css({marginTop: '520px'});
	$(".map-layout-togglea1").removeClass("active");
	$(".map-layout-togglea2").addClass("active");
		} else {
	document.getElementById("same-height2").style.width="50%"
	document.getElementById("same-height2").style.height="100%"
	var sidetable  = document.getElementById('same-height');
	sidetable.style.width = null; 
	sidetable.style.top = null; 
	sidetable.style.width = '50%'; 
	sidetable.style.marginTop=null;
	$(".map-layout-togglea2").removeClass("active");
	$(".map-layout-togglea1").addClass("active");
	
	


	side="wide";
		} 
	google.maps.event.trigger(map,'resize');
	var newside=map.getBounds().getNorthEast().lng()
	var topan=oldside-newside;
	map.setCenter(new google.maps.LatLng(map.getCenter().lat(),map.getCenter().lng()+topan));	
	}





</script>
<script>
var refreshOut= setInterval( function () {
	//table.ajax.reload(null,false);
	table.ajax.reload();
	searchViaAjax();
}, 300000);


var timeOutIterval=300000;
$('.refreshC').change(function() {
	if ($('#refreshCheck').is(':checked')) {
	  var mutliply=1000;

	 if($('#refreshUnit').val()==1){
		 mutliply=1000*60;
	 }
	 if($('#refreshUnit').val()==2){
		 mutliply=1000*60*60;
	 }
	 if($('#refreshValue').val()!='' && $('#refreshValue').val() >0){
		 mutliply=mutliply*$('#refreshValue').val();
		clearInterval(refreshOut);
		refreshOut=  setInterval( function () {
	    	//table.ajax.reload(null,false);
	    	table.ajax.reload(null,false);
	    	searchViaAjax();
	    }, mutliply); 
	 }else{
		 clearInterval(refreshOut);
	 }
	 
	 
    } else {
        
    }

});

$('#refreshCheck').click(function () {

    if ($('#refreshCheck').is(':checked')) {

    	 var mutliply=1000;
    	  
      	 if($('#refreshUnit').val()==1){
      		 mutliply=1000*60;
      	 }
      	 if($('#refreshUnit').val()==2){
      		 mutliply=1000*60*60;
      	 }
      	 if($('#refreshValue').val()!='' && $('#refreshValue').val() >0){
      		 mutliply=mutliply*$('#refreshValue').val();
      		clearInterval(refreshOut);
      		refreshOut=  setInterval( function () {
      	    	//table.ajax.reload(null,false);
      	    	table.ajax.reload(null,false);
      	    	searchViaAjax();
      	    }, mutliply);
    	
    } 
    }
    else {
   	 clearInterval(refreshOut);
   }
});

$('.fa-refresh').click(function() {
	    	 table.ajax.reload(null,false);
	    	searchViaAjax();
  });



</script>


<!-- Mirrored from kalkisoft.com/adhata/html/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 30 Dec 2016 18:15:42 GMT -->
</html>
