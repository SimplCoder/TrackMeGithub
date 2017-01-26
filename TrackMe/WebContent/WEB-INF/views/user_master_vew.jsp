<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>NST-GPS System</title>
    <link href="html/css/css.css" rel="stylesheet" type="text/css" />
    <link href="html/css/css.css" rel="stylesheet" type="text/css" />
    <link href="html/css/bootstrap.min.css" rel="stylesheet">

    <link href="html/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="html/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="html/css/animate.css" rel="stylesheet">
    <link href="html/css/style.css" rel="stylesheet">
    <link href="html/css/custom.css" rel="stylesheet">
    <link href="html/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="html/css/buttons.dataTables.min.css" rel="stylesheet">
    <style type="text/css">
        #editAlert {
            margin-top: 100px;
        }
    </style>
</head>
<body class="top-navigation">

   <div id="wrapper">
 <jsp:directive.include file="header.jsp" />
 
        <div id="page-wrapper2" class="gray-bg">
            <div class="rowx wrapper border-bottom white-bg page-heading">
                <div class="col-sm-6">
                    <h2>Users</h2>
                </div>
				<div class="col-sm-6">
                    <div class="text-right">
                        <a href="UserMasterEdit?id=new" target="frame1" style="width:120px" class="btn btn-primary">Add User</a>
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
                                            <table class="entrydata table table-striped table-bordered new-tbl" id="entrydata">
                                                <thead>
                                                    <tr class="leftMenu">
                                                        <th></th><th></th>
                                                        <th>User name</th>
                                                        <th>Created By</th>
                                                        <th>Created Date</th>
                                                        <th>Modify By</th>
                                                        <th>Modify Date</th>
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
    <script type="text/javascript">
    var userJson = ${UserMastersJSON};
    
        $(document).ready(function () {
        	
        	 $('#hdr_configuration').addClass("dropdown active");
       		$('#hdr_configuration_link').click();
       		$('#hdr_UserMasters').addClass("active");
            $('#entrydata').DataTable({
            	dom: 'Bfrtp',
            	data:userJson,
                columns:[
                         {data: "userName",
                        	 "render": function ( data, type, full, meta ) {
                        	      return '<a href="UserMasterEdit?id='+data+'"><i class="fa fa-pencil-square-o iconedit"  aria-hidden="true"></i></a>';}
                        	 },
                         {data: "userName",
                            	 "render": function ( data, type, full, meta ) {
                           	      return '<a href="UserMasterRemove?id='+data+'"><i class="fa fa-trash  icondelete" aria-hidden="true"></i></a>';}
                           	
                        		 
                         },
                         {data: "userName"},
                         {data: "createdBy"},
                         {data: "createdDateShow"},
                         {data: "modifiedBy"},
                         {data: "modifiedDateShow"},
                                              ],
    			ordering:false,
                buttons: [
                          
                            'excelHtml5',
                            'pdfHtml5'
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
    <script>
        
    </script>
</body>

<!-- Mirrored from kalkisoft.com/adhata/html/user.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 30 Dec 2016 18:16:58 GMT -->
</html>
<script>
            $(document).ready(function () {
			
			$(".dt-buttons").addClass("pull-right");
					$("#entrydata_filter").addClass("pull-left");
                
            });
            
            
            $( document ).ready(function() {
                
            	try{

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
            	$(".dt-buttons").css("left","20%");
            	$(".dt-buttons").css("top","1px");
            	$(".input-sm").css("height","25px");
            	}catch(err){}
            	});

        </script> 