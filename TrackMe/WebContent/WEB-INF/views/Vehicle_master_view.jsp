<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Vehicle Service View</title>
    <link href="html/css/css.css" rel="stylesheet" type="text/css" />
    <link href="html/css/bootstrap.min.css" rel="stylesheet">

	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">    
    <link href="html/css/messages.css" rel="stylesheet">
    
    <link href="html/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="html/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="html/css/animate.css" rel="stylesheet">
    <link href="html/css/style.css" rel="stylesheet">
    <link href="html/css/custom.css" rel="stylesheet">
    <link href="html/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="html/css/buttons.dataTables.min.css" rel="stylesheet">
    
</head>
<body class="top-navigation" >
 <jsp:directive.include file="header.jsp" />
 <div id="wrapper">
    <div id="page-wrapper2" class="gray-bg">
        <div id="messagePrepender" class="rowx wrapper border-bottom white-bg page-heading">
            <div class="col-sm-6">
                <h2>Vehicle View</h2>
              
            </div>
           
		   <div class="col-sm-6">
                <div class="text-right">
                    <form>
                        <a href="VehicleMasterEdit?id=new" target="frame1">
                            <input name="button" type="button" class="btn btn-primary" id="button" style="width:145px" value="Add New Vehicle"></a>
                      </form>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="ibox float-e-margins">
                                <div class="ibox-content">
                                    <div class="table-responsive">
							
                                        <table width="100%" id="entrydata" class="entrydata table table-striped table-bordered new-tbl">
                                            <thead>
                                                <tr class="leftMenu">
                                                    	 <th width="3%" align="center" valign="middle"></th>
														 	 <th width="4%" align="center" valign="middle"></th>
                                                    <th width="15%" align="center" valign="middle">Vehicle No/ Name</th>
                                                    <th width="7%" align="center" valign="middle">Device No</th>
                                                    
                                                    <th width="11%" align="center" valign="middle">Phone</th>
                                                    <th width="10%" align="center" valign="middle">Email</th>
                                                    <th width="11%" align="center" valign="middle">Address</th>
                                                    <th width="7%" align="center" valign="middle">City</th>
                                                    <th width="10%" align="center" valign="middle">Created By</th>
                                                    <th width="8%" align="center" valign="middle">Created Dt.</th>
                                                    <th width="10%" align="center" valign="middle">Modify By </th>
                                                    <th width="8%" align="center" valign="middle">Modify Dt.</th>
												
                                                </tr>
                                            </thead>
											
                                        </table>
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
</body>
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
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.2.4/js/buttons.colVis.min.js"></script>

<script>


var vehicleJson = ${vehicleMastersJSON};
    $(document).ready(function () {
    	
    	
    	
		$('#hdr_configuration').addClass("dropdown active");
		$('#hdr_configuration_link').click();
		$('#hdr_vehicleMaster').addClass("active");
	//	$("#successMessage").prependTo("#messagePrepender");
		$('#successMessage').fadeOut(5000);
		$('#errorMessage').fadeOut(5000);
		
		    
		
        $('#entrydata').DataTable({
        	dom: '<"top"lBf>rt<"bottom"p><"clear">',
        	data:vehicleJson,
            columns:[
                     {data: "vehicleNo",
                    	 "render": function ( data, type, full, meta ) {
                    	      return '<a href="VehicleMasterEdit?id='+data+'"><i class="fa fa-pencil-square-o iconedit"  aria-hidden="true"></i></a>';}
                    	 },
                     {data: "vehicleNo",
                        	 "render": function ( data, type, full, meta ) {
                       	      return '<a href="VehicleMasterRemove?id='+data+'"><i class="fa fa-trash  icondelete" aria-hidden="true"></i></a>';}
                       	
                    		 
                     },
                     {data: "vehicleNo"},
                     {data: "unitNo"},
                    
                     {data: "ownerContact1"},
                     {data: "ownerEmail"},
                     {data: "ownerAddress1"},
                     {data: "ownerCity"},
                     {data: "createdBy"},
                     {data: "createdOnShow"},
                     {data: "modifiedBy"},
                     {data: "modifiedOnShow"}
                     
               
                   
                     
                 ],
        	
			ordering:false,
			 lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "All"]],
				buttons: [
	{
	    extend: 'colvis',
	   text :'',
	    columns: ':gt(2)'
	},

	{
	    extend: 'excelHtml5',
	    text :''
	 },{
		    extend:'pdfHtml5',
		    text :''
		 }
	]
        }); 
        if ($("input[type='search']").length > 0) {
            $("input[type='search']").addClass("form-control");
        }
        if ($("select[name='entrydata_length']").length > 0) {
            $("select[name='entrydata_length']").addClass("form-control");
        }
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
    });

 
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

</style>
</html>
