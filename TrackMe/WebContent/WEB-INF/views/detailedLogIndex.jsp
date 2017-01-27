<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Vehicle Service View</title>
<link href="html/css/css.css" rel="stylesheet" type="text/css"/>
<link href="html/css/bootstrap.min.css" rel="stylesheet">

<link href="html/font-awesome/css/font-awesome.css" rel="stylesheet">
<link href="html/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="html/css/animate.css" rel="stylesheet">
<link href="html/css/style.css" rel="stylesheet">
<link href="html/css/custom.css" rel="stylesheet">
<link href="html/css/dataTables.bootstrap.min.css" rel="stylesheet">
<link href="html/css/buttons.dataTables.min.css" rel="stylesheet">

</head>
<body class="top-navigation">
<jsp:directive.include file="header.jsp" />
  <div id="page-wrapper2" class="gray-bg" style="top:128px !important">
  <!--  Rohan Code Start 1 -->
    <!--  <div class="rowx wrapper border-bottom white-bg page-heading">
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
            <div class="graph-txt">Moving</div>
          </div>
          <div class="graph-in">
            <div class="graph-img">
              <canvas id="doughnutChart4" height="100"></canvas>
            </div>
            <div class="graph-txt">Slow/ldl</div>
          </div>
          <div class="graph-in">
            <div class="graph-img">
              <canvas id="doughnutChart5" height="100"></canvas>
            </div>
            <div class="graph-txt">Over Speed</div>
          </div>
          <div class="graph-in">
            <div class="graph-img">
              <canvas id="doughnutChart6" height="100"></canvas>
            </div>
            <div class="graph-txt">Harsh Break</div>
          </div>
          <div class="graph-in">
            <div class="graph-img">
              <canvas id="doughnutChart7" height="100"></canvas>
            </div>
            <div class="graph-txt">Alert</div>
          </div>
          <div class="graph-in">
            <div class="graph-img">
              <canvas id="doughnutChart8" height="100"></canvas>
            </div>
            <div class="graph-txt">Unit Count : 4</div>
          </div>
        </div>
      </div>
    </div> -->
     <!--  Rohan Code End 1 -->
    <div class="row">
      <div class="col-lg-12">
        <div class="wrapper wrapper-content fadeInUp pad-bot-0">
          <div class="row">
            <div class="col-lg-12">
              <div class="ibox float-e-margins pad-bot-0" style="background:#fff;">
                <div class="row">
                  <div id="same-height" class="col-md-6 md-pad-left" style="padding-right:0;">
                   
                    <div class="ibox-content pad-bot-0">
                      <div class="table-responsive">
                          <!--Rohan code start 1 -->	
                        <table id="entrydata" class="table table-striped table-bordered new-tbl">
                          <thead>
                          <tr class="leftMenu">
                                                    	 <th width="3%" align="center" valign="middle"></th>
				
                                                    <th width="15%" align="center" valign="middle">Date</th>
                                                    <th width="7%" align="center" valign="middle">Event</th>
                                                    <th width="11%" align="center" valign="middle">Speed</th>
                                                    <th width="10%" align="center" valign="middle">Location</th>
                                      
												
                                                </tr>
                          </thead>
                          
                        </table>
                          <input type="hidden" id="tempVehicleNo">
                          <!--Rohan code end 1 -->	
                      </div>
                    </div>
                  </div>
                  <div id="same-height2" class="col-md-6 md-pad-right" style="padding-left:0;">
                    <div class="ibox-title">
                      <div class="map-btns">
                        <ul class="subnav-right az-move-right">
                          <li class="map-reset"><a href="#" >&nbsp;</a></li>
                          <li class="map-actions"><a href="#" class="">&nbsp;</a> </li>
                          <li class="map-vehicles"><a href="#" class="">&nbsp;</a> </li>
                          <li class="map-landmarks"><a href="#" >&nbsp;</a></li>
                          <li class="map-geofences"><a href="#">&nbsp;</a> </li>
                          <li class="map-layout-toggle1"><a href="#" class="active">&nbsp;</a></li>
                          <li class="map-layout-toggle2"><a href="#" class="">&nbsp;</a></li>
                          <li class="map-icon-medium"><a class="active" href="#" >&nbsp;</a></li>
                          <li class="map-icon-large"><a href="#" class="">&nbsp;</a></li>
                          <li class="map-fullscreen"><a href="#">&nbsp;</a></li>
                        </ul>
                      </div>
                    </div>
                    <div class="ibox-content"> 
                         <div id="map" style="width:100%;height:500px"></div>

<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCeQdAwrHm8Zap7jwX_gNRA3dhH-CxdCWQ&callback=initialize"></script>
                  
<!--Rohan code start 3 -->
    <script>
        vehicleLocationJSON=${vehicleLatlngDetails}; 
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
        var map,marker;
        var startPos = [vehicleLocationJSON[0].latitude, vehicleLocationJSON[0].longitude];
        var speed = 50; // km/h

        var delay = 100; 
        
        var MY_MAPTYPE_ID = 'custom_style';  
            function initialize() {
          // var locations=jQuery.parseJSON(vehicleLocationJSON);
           var routeLineCoordinates=[];
           
           for(index=0;index<vehicleLocationJSON.length; index++){
               routeLineCoordinates.push(new google.maps.LatLng(vehicleLocationJSON[index].latitude,vehicleLocationJSON[index].longitude));
           }
            
                
           var point = new google.maps.LatLng(vehicleLocationJSON[0].latitude,vehicleLocationJSON[0].longitude);    //keep marker at center of map, need to change hard coding
                                               
            var map_canvas = document.getElementById('map');
            var map_options = {
            center: new google.maps.LatLng(vehicleLocationJSON[0].latitude,vehicleLocationJSON[0].longitude),
            zoom: 10,
            mapTypeId: google.maps.MapTypeId.ROADMAP
                              }   
             map = new google.maps.Map(map_canvas, map_options)

            marker= new google.maps.Marker({
              position: point,
              map: map
           });
                
                 var routePath = new google.maps.Polyline({
                map: map,
                path: routeLineCoordinates,
                strokeColor: "#0000FF",
                strokeOpacity: 0.50,
                strokeWeight: 2
            });
            
                var coordsStr="[";
                for(index=0;index<vehicleLocationJSON.length; index++){
                   coordsStr=coordsStr+"["+vehicleLocationJSON[index].latitude+","+vehicleLocationJSON[index].longitude+"]";
                    if(index!=vehicleLocationJSON.length-1){
                      coordsStr=coordsStr+",";  
                    }
                }
                coordsStr=coordsStr+"]";
                var coordsJSONArr=jQuery.parseJSON(coordsStr);
                google.maps.event.addListenerOnce(map, 'idle', function()
                {
                    animateMarker(marker, coordsJSONArr, speed);
                }); 
            }
        
        function animateMarker(marker, coords, km_h)
        {
            var target = 0;
            var km_h = km_h || 50;
         //  coords.push([startPos[0], startPos[1]]);

            function goToPoint()
            {
                var lat = marker.position.lat();
                var lng = marker.position.lng();
                var step = (km_h * 1000 * delay) / 3600000; // in meters

                var dest = new google.maps.LatLng(
                coords[target][0], coords[target][1]);
                //alert(coords[target][0]+" "+coords[target][1]);
                
                var distance =
                google.maps.geometry.spherical.computeDistanceBetween(
                dest, marker.position); // in meters

                var numStep = distance / step;
                var i = 0;
                var deltaLat = (coords[target][0] - lat) / numStep;
                var deltaLng = (coords[target][1] - lng) / numStep;

                function moveMarker()
                {
                    lat += deltaLat;
                    lng += deltaLng;
                    i += step;

                    if (i < distance)
                    {
                        marker.setPosition(new google.maps.LatLng(lat, lng));
                        setTimeout(moveMarker, delay);
                    }
                    else
                    {   marker.setPosition(dest);
                        target++;
                        if (target == coords.length){ target = 0; }

                        setTimeout(goToPoint, delay);
                    }
                }
                moveMarker();
            }
            goToPoint();
        } 
        
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
<script type="text/javascript" src="html/js/jspdf.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
<script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.2.4/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="html/js/icheck.min.js"></script>
<script>
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
        vehicleLocationJSON=${vehicleLatlngDetails};
        drawTable(vehicleLocationJSON); 
     
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
            

  /*  $('#entrydata').on("change",'input[type=radio][name=Vehicleno]',function(){ //we have to register new event handler for dynamically loaded contents after AJAX
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
                    new google.maps.Marker({
                    position: new google.maps.LatLng(value.latitude, 
                                              value.longitude),    
                    map: map
                    });
                }
            });
        }
    }); */
    /*  $('input[type=radio][name=Vehicleno]').change(function() {
    
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
 //   var callback=true;//made true to not show any vehicle on map upon loading the page 
 //   var table;        
//{"vehicleno":"8585","latitude":"18.5119380950","description":"Health Check","location":"Ramchandra Mane Rd Sahakar Vrinda Society Ramkrishna Paramhans Nagar Kothrud Pune Maharashtra 411038 India","datetime1":1463626537000,"speed":0,"longitude":"73.8057861328"}
    function drawTable(jsonArr){
        //alert(jsonArr[0]);
      table= $('#entrydata').DataTable({
			dom: 'Bfrtp',
            data:jsonArr,
           /* ajax : {
        "url" : "getAllVehicleLatestLoc",
        "dataSrc" : function (json) {
           // alert(json.result);
            allVehicleAjaxArr=json.result;
            //alert(JSON.stringify(allVehicleAjaxArr));
            return json.result;
        }}, */
             columns:[
                    {data: "vehicleno",
                    	 "render": function ( data, type, full, meta ) {
                                     return '<input type="checkbox" id="' + data + '" name="Vehicleno" value="'+data+'">';
                                  
                            }
                    	 },
                     {data: "datetime1","render":function(data, type, full, meta){
                          var tempDate = new Date(data);
                            return  tempDate.getDate() +'/'+ (tempDate.getMonth() + 1) + '/' + tempDate.getFullYear() + " " + tempDate.getHours() + ":" + tempDate.getMinutes() + ":" + tempDate.getSeconds();

                     }},
                     {data: "description"},
                     {data: "speed"},
                     {data: "location"}
                    ],
            ordering:false,
			buttons: [

						'excelHtml5',
						
						'pdfHtml5'
					]
		}); 
    }
    
    /*function updateMarker(jsonArrMarker,vehicleId){
     //   alert(jsonArrMarker+vehicleId);
        $.each(jsonArrMarker, function(key,value){
                if(value.vehicleno==vehicleId){
                    if(!callback){
                         var map_canvas = document.getElementById('map');
                         var map_options = {
                         center: new google.maps.LatLng(value.latitude, value.longitude),
                         zoom: 10,
                         mapTypeId: google.maps.MapTypeId.ROADMAP
                                       }   
                         map = new google.maps.Map(map_canvas, map_options) 
                    }
                    new google.maps.Marker({
                    position: new google.maps.LatLng(value.latitude, 
                                              value.longitude),    
                    map: map
                    });
                }
            });
    }
            
    setInterval( function () {
        table.ajax.reload();
        }, 5000000 );*/
            
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
        
</script>
<!--<script type="text/javascript">
        // When the window has finished loading google map
        google.maps.event.addDomListener(window, 'load', init);

        function init() {
            // Options for Google map
            // More info see: https://developers.google.com/maps/documentation/javascript/reference#MapOptions
            var mapOptions1 = {
                zoom: 11,
                center: new google.maps.LatLng(40.6700, -73.9400),
                // Style for Google Maps
                styles: [{"featureType":"water","stylers":[{"saturation":43},{"lightness":-11},{"hue":"#0088ff"}]},{"featureType":"road","elementType":"geometry.fill","stylers":[{"hue":"#ff0000"},{"saturation":-100},{"lightness":99}]},{"featureType":"road","elementType":"geometry.stroke","stylers":[{"color":"#808080"},{"lightness":54}]},{"featureType":"landscape.man_made","elementType":"geometry.fill","stylers":[{"color":"#ece2d9"}]},{"featureType":"poi.park","elementType":"geometry.fill","stylers":[{"color":"#ccdca1"}]},{"featureType":"road","elementType":"labels.text.fill","stylers":[{"color":"#767676"}]},{"featureType":"road","elementType":"labels.text.stroke","stylers":[{"color":"#ffffff"}]},{"featureType":"poi","stylers":[{"visibility":"off"}]},{"featureType":"landscape.natural","elementType":"geometry.fill","stylers":[{"visibility":"on"},{"color":"#b8cb93"}]},{"featureType":"poi.park","stylers":[{"visibility":"on"}]},{"featureType":"poi.sports_complex","stylers":[{"visibility":"on"}]},{"featureType":"poi.medical","stylers":[{"visibility":"on"}]},{"featureType":"poi.business","stylers":[{"visibility":"simplified"}]}]
            };

            var mapOptions2 = {
                zoom: 11,
                center: new google.maps.LatLng(40.6700, -73.9400),
                // Style for Google Maps
                styles: [{"featureType":"all","elementType":"all","stylers":[{"invert_lightness":true},{"saturation":10},{"lightness":30},{"gamma":0.5},{"hue":"#435158"}]}]
            };

            var mapOptions3 = {
                center: new google.maps.LatLng(36.964645, -122.01523),
                zoom: 18,
                mapTypeId: google.maps.MapTypeId.SATELLITE,
                // Style for Google Maps
                styles: [{"featureType":"road","elementType":"geometry","stylers":[{"visibility":"off"}]},{"featureType":"poi","elementType":"geometry","stylers":[{"visibility":"off"}]},{"featureType":"landscape","elementType":"geometry","stylers":[{"color":"#fffffa"}]},{"featureType":"water","stylers":[{"lightness":50}]},{"featureType":"road","elementType":"labels","stylers":[{"visibility":"off"}]},{"featureType":"transit","stylers":[{"visibility":"off"}]},{"featureType":"administrative","elementType":"geometry","stylers":[{"lightness":40}]}]
            };

            var mapOptions4 = {
                zoom: 11,
                center: new google.maps.LatLng(40.6700, -73.9400),
                // Style for Google Maps
                styles: [{"stylers":[{"hue":"#18a689"},{"visibility":"on"},{"invert_lightness":true},{"saturation":40},{"lightness":10}]}]
            };

            var fenway = new google.maps.LatLng(42.345573, -71.098326);
            var mapOptions5 = {
                zoom: 14,
                center: fenway,
                // Style for Google Maps
                styles: [{featureType:"landscape",stylers:[{saturation:-100},{lightness:65},{visibility:"on"}]},{featureType:"poi",stylers:[{saturation:-100},{lightness:51},{visibility:"simplified"}]},{featureType:"road.highway",stylers:[{saturation:-100},{visibility:"simplified"}]},{featureType:"road.arterial",stylers:[{saturation:-100},{lightness:30},{visibility:"on"}]},{featureType:"road.local",stylers:[{saturation:-100},{lightness:40},{visibility:"on"}]},{featureType:"transit",stylers:[{saturation:-100},{visibility:"simplified"}]},{featureType:"administrative.province",stylers:[{visibility:"off"}]/**/},{featureType:"administrative.locality",stylers:[{visibility:"off"}]},{featureType:"administrative.neighborhood",stylers:[{visibility:"on"}]/**/},{featureType:"water",elementType:"labels",stylers:[{visibility:"on"},{lightness:-25},{saturation:-100}]},{featureType:"water",elementType:"geometry",stylers:[{hue:"#ffff00"},{lightness:-25},{saturation:-97}]}]
            };

            var panoramaOptions = {
                position: fenway,
                pov: {
                    heading: 10,
                    pitch: 10
                }
            };
            var panorama = new google.maps.StreetViewPanorama(document.getElementById('pano'), panoramaOptions);

            // Get all html elements for map
            var mapElement1 = document.getElementById('map1');
            var mapElement2 = document.getElementById('map2');
            var mapElement3 = document.getElementById('map3');
            var mapElement4 = document.getElementById('map4');

            // Create the Google Map using elements
            var map1 = new google.maps.Map(mapElement1, mapOptions1);
            var map2 = new google.maps.Map(mapElement2, mapOptions2);
            var map3 = new google.maps.Map(mapElement3, mapOptions3);
            var map4 = new google.maps.Map(mapElement4, mapOptions4);
        }

var xmlHttpRequest = new XMLHttpRequest();
window.onload = function(){ 
	xmlHttpRequest.open("get", "/TrackMeWeb/TrackMeServlet?action=getLoginData", true);
	xmlHttpRequest.onreadystatechange = addDataToPage;
	xmlHttpRequest.send(null);
} ;
function addDataToPage()
{
if(xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200)
	{
		var table = document.getElementById("entrydata");
		var dom = (new DOMParser()).parseFromString(xmlHttpRequest.responseText, "text/xml");
		var data = dom.getElementsByTagName("vehicle");

	
		var i = 0;
		while(i < data.length )
		{
			row = table.insertRow( i+2 );
			row.className ="leftMenu";
			cell = row.insertCell(0);
			cell.innerHTML = data[i].childNodes[0].firstChild == null ? "" :data[i].childNodes[0].firstChild.nodeValue;
			cell = row.insertCell(1);
			cell.innerHTML = data[i].childNodes[1].firstChild == null ? "" :data[i].childNodes[1].firstChild.nodeValue;
			cell = row.insertCell(2);
			cell.innerHTML = data[i].childNodes[2].firstChild == null ? "" :data[i].childNodes[2].firstChild.nodeValue;
			//cell = row.insertCell(3);
			//cell.innerHTML = data[i].childNodes[3].firstChild == null ? "" :data[i].childNodes[3].firstChild.nodeValue;
			//cell = row.insertCell(4);
			//cell.innerHTML = data[i].childNodes[4].firstChild == null ? "" :data[i].childNodes[4].firstChild.nodeValue;
			cell = row.insertCell(5);
			cell.innerHTML = data[i].childNodes[5].firstChild == null ? "" :data[i].childNodes[5].firstChild.nodeValue;
			cell = row.insertCell(6);
			cell.innerHTML = data[i].childNodes[6].firstChild == null ? "" :data[i].childNodes[6].firstChild.nodeValue;
			cell = row.insertCell(7);
			cell.innerHTML = data[i].childNodes[7].firstChild == null ? "" :data[i].childNodes[7].firstChild.nodeValue;
			cell = row.insertCell(8);
			cell.innerHTML = data[i].childNodes[8].firstChild == null ? "" :data[i].childNodes[8].firstChild.nodeValue+" "+data[i].childNodes[9].firstChild.nodeValue;
			//cell = row.insertCell(9);
			//cell.innerHTML = data[i].childNodes[9].firstChild == null ? "" :data[i].childNodes[9].firstChild.nodeValue;
			i++;
		}
	}

}
    </script> -->

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
$(function () {    
    var doughnutData = [
        {
            value: 100,
            color: "#d9d9d9",
            highlight: "#d9d9d9",
            label: "Software"
        },
        {
            value: 75,
            color: "#ed5564",
            highlight: "#ed5564",
            label: "Laptop"
        }
    ];

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
    };

    var ctx = document.getElementById("doughnutChart").getContext("2d");
    var myNewChart = new Chart(ctx).Doughnut(doughnutData, doughnutOptions);
	
	
	
	/* -------------------2222222-------------------------------- */
	var doughnutData2 = [
 
        {
            value: 50,
            color: "#d9d9d9",
            highlight: "#d9d9d9",
            label: "Software"
        },
        {
            value: 150,
            color: "#1cb295",
            highlight: "#1cb295",
            label: "Laptop"
        }
    ];

    var doughnutOptions2 = {
        segmentShowStroke: true,
        segmentStrokeColor: "#fff",
        segmentStrokeWidth: 1,
        percentageInnerCutout: 0,
        animationSteps: 100,
        animationEasing: "easeOutBounce",
        animateRotate: true,
        animateScale: false,
        responsive: true,
    };

    var ctx2 = document.getElementById("doughnutChart2").getContext("2d");
    var myNewChart2 = new Chart(ctx2).Doughnut(doughnutData2, doughnutOptions2);
	
	
	/* -------------------3333-------------------------------- */
	var doughnutData3 = [
 
        {
            value: 100,
            color: "#d9d9d9",
            highlight: "#d9d9d9",
            label: "Software"
        },
        {
            value: 100,
            color: "#ff9000",
            highlight: "#ff9000",
            label: "Laptop"
        }
    ];

    var doughnutOptions3 = {
        segmentShowStroke: true,
        segmentStrokeColor: "#fff",
        segmentStrokeWidth: 1,
        percentageInnerCutout: 0,
        animationSteps: 100,
        animationEasing: "easeOutBounce",
        animateRotate: true,
        animateScale: false,
        responsive: true,
    };

    var ctx3 = document.getElementById("doughnutChart3").getContext("2d");
    var myNewChart3 = new Chart(ctx3).Doughnut(doughnutData3, doughnutOptions3);
	
	
	
	/* -------------------444-------------------------------- */
	var doughnutData4 = [
 
        {
            value: 50,
            color: "#d9d9d9",
            highlight: "#d9d9d9",
            label: "Software"
        },
        {
            value: 25,
            color: "#00aeff",
            highlight: "#00aeff",
            label: "Laptop"
        }
    ];

    var doughnutOptions4 = {
        segmentShowStroke: true,
        segmentStrokeColor: "#fff",
        segmentStrokeWidth: 1,
        percentageInnerCutout: 0,
        animationSteps: 100,
        animationEasing: "easeOutBounce",
        animateRotate: true,
        animateScale: false,
        responsive: true,
    };

    var ctx4 = document.getElementById("doughnutChart4").getContext("2d");
    var myNewChart4 = new Chart(ctx4).Doughnut(doughnutData4, doughnutOptions4);
	
	
	/* -------------------555-------------------------------- */
	var doughnutData5 = [
 
        {
            value: 50,
            color: "#d9d9d9",
            highlight: "#d9d9d9",
            label: "Software"
        },
        {
            value: 35,
            color: "#f8fb00",
            highlight: "#f8fb00",
            label: "Laptop"
        }
    ];

    var doughnutOptions5 = {
        segmentShowStroke: true,
        segmentStrokeColor: "#fff",
        segmentStrokeWidth: 1,
        percentageInnerCutout: 0,
        animationSteps: 100,
        animationEasing: "easeOutBounce",
        animateRotate: true,
        animateScale: false,
        responsive: true,
    };

    var ctx5 = document.getElementById("doughnutChart5").getContext("2d");
    var myNewChart5 = new Chart(ctx5).Doughnut(doughnutData5, doughnutOptions5);
	
	/* -------------------666-------------------------------- */
	var doughnutData6 = [
 
        {
            value: 150,
            color: "#d9d9d9",
            highlight: "#d9d9d9",
            label: "Software"
        },
        {
            value: 50,
            color: "#ed5564",
            highlight: "#ed5564",
            label: "Laptop"
        }
    ];

    var doughnutOptions6 = {
        segmentShowStroke: true,
        segmentStrokeColor: "#fff",
        segmentStrokeWidth: 1,
        percentageInnerCutout: 0,
        animationSteps: 100,
        animationEasing: "easeOutBounce",
        animateRotate: true,
        animateScale: false,
        responsive: true,
    };

    var ctx6 = document.getElementById("doughnutChart6").getContext("2d");
    var myNewChart6 = new Chart(ctx6).Doughnut(doughnutData6, doughnutOptions6);
	
	
	/* -------------------777-------------------------------- */
	var doughnutData7 = [
 
        {
            value: 50,
            color: "#d9d9d9",
            highlight: "#d9d9d9",
            label: "Software"
        },
        {
            value: 50,
            color: "#ff9000",
            highlight: "#ff9000",
            label: "Laptop"
        }
    ];

    var doughnutOptions7 = {
        segmentShowStroke: true,
        segmentStrokeColor: "#fff",
        segmentStrokeWidth: 1,
        percentageInnerCutout: 0,
        animationSteps: 100,
        animationEasing: "easeOutBounce",
        animateRotate: true,
        animateScale: false,
        responsive: true,
    };

    var ctx7 = document.getElementById("doughnutChart7").getContext("2d");
    var myNewChart7 = new Chart(ctx7).Doughnut(doughnutData7, doughnutOptions7);
	
	
	/* -------------------888-------------------------------- */
	var doughnutData8 = [
 
        {
            value: 150,
            color: "#d9d9d9",
            highlight: "#d9d9d9",
            label: "Software"
        },
        {
            value: 100,
            color: "#005ffb",
            highlight: "#005ffb",
            label: "Laptop"
        }
    ];

    var doughnutOptions8 = {
        segmentShowStroke: true,
        segmentStrokeColor: "#fff",
        segmentStrokeWidth: 1,
        percentageInnerCutout: 0,
        animationSteps: 100,
        animationEasing: "easeOutBounce",
        animateRotate: true,
        animateScale: false,
        responsive: true,
    };

    var ctx8 = document.getElementById("doughnutChart8").getContext("2d");
    var myNewChart8 = new Chart(ctx8).Doughnut(doughnutData8, doughnutOptions8);
	
	
	
});
</script> 
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
		 
		 
		 $(document).ready(function () {
				
				$(".dt-buttons").addClass("pull-right");
						$("#entrydata_filter").addClass("pull-left");
						
	                
	            });
			
		 
		 $( document ).ready(function() {
			    


			    $(".buttons-html5").removeClass("dt-button");
			    $(".buttons-html5").html("");
			    $(".buttons-pdf").addClass("fa-file-pdf-o");
			    $(".buttons-excel").addClass("fa-file-excel-o");
			        $(".fa-file-pdf-o").addClass(".buttons-pdf");
			            $(".fa-file-excel-o").addClass(".buttons-excel");
			        
			    
			$(".buttons-excel::before").css("font-size","23px !important");
			$(".buttons-excel::before").css("padding-left","17px !important");

			$(".buttons-pdf::before").css("font-size","23px !important");
			$(".buttons-pdf::before").css("padding-left","10px !important");

			$(".table-responsive").css("position","relative");

			$(".dt-buttons").css("position","absolute");
			$(".dt-buttons").css("left","42%");
			$(".dt-buttons").css("top","1px");
			$(".input-sm").css("height","25px");

			});
	   </script>
</body>

<!-- Mirrored from kalkisoft.com/adhata/html/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 30 Dec 2016 18:15:42 GMT -->
</html>
