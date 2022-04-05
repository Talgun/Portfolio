<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SalesRecord page</title>

    <!-- Custom fonts for this template -->
    <link href="admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="admin/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="admin/product/product.js"></script>
    

 
 <!--  차트  -->   
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
	$(document).ready(function() {
		<%-- AJAX 통신 설정 --%>
		$.ajax({
			type: 'GET',
			headers: {
				Accept: "application/json; charset=utf-8",
				"Content-type": "application/json; charset=utf-8"
			},
			url: 'sales_record_chart',
			success: function(result) {	 // result : controller에서 전달됱 데이터
				// 최신 버전의 구글 고어차트 패키지를 메로리로 로드
				google.charts.load('current', {'packages':['corechart']});
				
				// 차트 API가 로드가 완료되었을 때 아래의 콜백함수실행(이벤트로 처리)
				// 차트 그리는 함수 호출
				google.charts.setOnLoadCallback(function() {
					drawChart(result);
					drawBasic(result);
				})
			},
			error: function() {
				alert("Chart drawing error!");
			}
		})
	});
	

	
	function drawChart(result) {
		// 차트를 그리는데 사용할 데이터 객체 생성
		var data = new google.visualization.DataTable();
		
		data.addColumn("string", "pname");
		data.addColumn("number", "quantity");
		
		
		// 콘트롤러에서 전달된 json 타입의 데이터를 
		// 자바스크립트 배열로 변경
		var dataArray = [];
		$.each(result, function(i, obj) { // json배열 타입의 데이터를 항목별로 반복
			dataArray.push([obj.pname, obj.quantity]);
		})
		
		// data객체에 dataArray의 내용을 저장
		data.addRows(dataArray);
		
		// 파이차트 그리기
		// 차트 그리기 옵션 지정
		var piechart_options = {
				title: '제품별 판매 실적',
				width: 300,
				height: 300
		};
		
		// 차트 종류와 옵션을 설정
		var piechart = 
			new google.visualization.PieChart(document.getElementById('piechart_div'));
		
		piechart.draw(data, piechart_options);
		
		// 바차트 그리기
		var barchart_options = {
			title: '제품별 판매 실적',
			width: 300,
			height: 300		
		}
		
		var barchart = new google.visualization.BarChart(document.getElementById('barchart_div'));
		
		barchart.draw(data, barchart_options);
	}
    </script>   
    


    



</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">
		
        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" >
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">ADMIN </div>
            </a>


            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Admin Setting
            </div>

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="admin_product_list">
                    <i class="fas fa-fw fa-table"></i>
                    <span>상품리스트</span></a>
            </li>
            
            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="admin_order_list">
                    <i class="fas fa-fw fa-table"></i>
                    <span>주문리스트</span></a>
            </li>
            
            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="admin_member_list">
                    <i class="fas fa-fw fa-table"></i>
                    <span>회원리스트</span></a>
            </li>
            
            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="admin_qna_list">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Q&A리스트</span></a>
            </li>                        

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="admin_sales_record_form">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>제품별 판매 실적</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">
            
            <li class="nav-item">
				<input class="btn btn-success btn-sm" type="button"  value="logout" style="margin-left: 80px"  
							   onClick="location.href='admin_logout'">
            </li>



        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
     
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>
             

                    <!-- Topbar Search -->
 


                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->


                    <!-- DataTales Example -->
                    <div class="row">
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">제품별 판매 실적</h6>
                        </div>
                        <div class="card-body">
								<table>
									<tr>
										<td><div id="piechart_div" style="border:1px solid #cc"></div></td>
										<td><div id="barchart_div" style="border:1px solid #cc"></div></td>
									</tr>
								</table>
                        </div>
                    </div>
                    </div>
                </div>
                
                <div class="container-fluid">

                    <!-- Page Heading -->


                    <!-- DataTales Example -->
                    <div class="row">
                    <div class="card shadow mb-5">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">사이트 방문자 현황 그래프</h6>
                        </div>
                        <div class="card-body">
						    <div id="Line_Controls_Chart">
						      <!-- 라인 차트 생성할 영역 -->
						          <div id="lineChartArea" style="padding:0px 20px 0px 0px;"></div>
						      <!-- 컨트롤바를 생성할 영역 -->
						          <div id="controlsArea" style="padding:0px 20px 0px 0px;"></div>
						    </div>
                        </div>
                    </div>
                    </div>
                    
                    <div class="row">
                    <div class="card shadow mb-5">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">시간대 별  수익 현황</h6>
                        </div>
                        <div class="card-body">
							  <div id="chart_div" style="width: 800px; height: 500px;"></div>
                        </div>
                    </div>
                    </div>
                    

                </div>                
                
                
                <!-- /.container-fluid -->


            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2022</span>
                    </div>
                </div>
            </footer>
            

            <!-- End of Footer -->
        </div>
        <!-- End of Content Wrapper -->
		
    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/datatables-demo.js"></script>
    
        
  <script>

  var chartDrowFun = {

    chartDrow : function(){
        var chartData = '';

        //날짜형식 변경하고 싶으시면 이 부분 수정하세요.
        var chartDateformat 	= 'yyyy년MM월dd일';
        //라인차트의 라인 수
        var chartLineCount    = 10;
        //컨트롤러 바 차트의 라인 수
        var controlLineCount	= 10;


        function drawDashboard() {

          var data = new google.visualization.DataTable();
          //그래프에 표시할 컬럼 추가
          data.addColumn('datetime' , '날짜');
          data.addColumn('number'   , '전체');

          //그래프에 표시할 데이터
          var dataRow = [];

          for(var i = 0; i <= 29; i++){ //랜덤 데이터 생성
            var total   = Math.floor(Math.random() * 100) + 1;
            var man     = Math.floor(Math.random() * total) + 1;
            var woman   = total - man;

            dataRow = [new Date('2022', '02', i , '03'), total];
            data.addRow(dataRow);
          }


            var chart = new google.visualization.ChartWrapper({
              chartType   : 'LineChart',
              containerId : 'lineChartArea', //라인 차트 생성할 영역
              options     : {
                              isStacked   : 'percent',
                              focusTarget : 'category',
                              height		  : 500,
                              width			  : 1000,
                              legend		  : { position: "top", textStyle: {fontSize: 13}},
                              pointSize		: 5,
                              tooltip		  : {textStyle : {fontSize:12}, showColorCode : true,trigger: 'both'},
                              hAxis			  : {format: chartDateformat, gridlines:{count:chartLineCount,units: {
                                                                  years : {format: ['yyyy년']},
                                                                  months: {format: ['MM월']},
                                                                  days  : {format: ['dd일']},
                                                                  hours : {format: ['HH시']}}
                                                                },textStyle: {fontSize:12}},
                vAxis			  : {minValue: 100,viewWindow:{min:0},gridlines:{count:-1},textStyle:{fontSize:12}},
                animation		: {startup: true,duration: 1000,easing: 'in' },
                annotations	: {pattern: chartDateformat,
                                textStyle: {
                                fontSize: 15,
                                bold: true,
                                italic: true,
                                color: '#871b47',
                                auraColor: '#d799ae',
                                opacity: 0.8,
                                pattern: chartDateformat
                              }
                            }
              }
            });

            var control = new google.visualization.ControlWrapper({
              controlType: 'ChartRangeFilter',
              containerId: 'controlsArea',  //control bar를 생성할 영역
              options: {
                  ui:{
                        chartType: 'LineChart',
                        chartOptions: {
                        chartArea: {'width': '60%','height' : 80},
                          hAxis: {'baselineColor': 'none', format: chartDateformat, textStyle: {fontSize:12},
                            gridlines:{count:controlLineCount,units: {
                                  years : {format: ['yyyy년']},
                                  months: {format: ['MM월']},
                                  days  : {format: ['dd일']},
                                  hours : {format: ['HH시']}}
                            }}
                        }
                  },
                    filterColumnIndex: 0
                }
            });

            var date_formatter = new google.visualization.DateFormat({ pattern: chartDateformat});
            date_formatter.format(data, 0);

            var dashboard = new google.visualization.Dashboard(document.getElementById('Line_Controls_Chart'));
            window.addEventListener('resize', function() { dashboard.draw(data); }, false); //화면 크기에 따라 그래프 크기 변경
            dashboard.bind([control], [chart]);
            dashboard.draw(data);

        }
          google.charts.setOnLoadCallback(drawDashboard);

      }
    }

$(document).ready(function(){
  google.charts.load('50', {'packages':['line','controls']});
  chartDrowFun.chartDrow(); //chartDrow() 실행
});
  </script>
 <script>
 function drawBasic() {

     var data = new google.visualization.DataTable();
     data.addColumn('timeofday', 'Time of Day');
     data.addColumn('number', 'Motivation Level');

     data.addRows([
       [{v: [8, 0, 0], f: '4,000,000원'}, 4],
       [{v: [9, 0, 0], f: '2,000,000원'}, 2],
       [{v: [10, 0, 0], f:'1,000,000원'}, 1],
       [{v: [11, 0, 0], f: '7,000,000원'}, 7],
       [{v: [12, 0, 0], f: '6,000,000원'}, 6],
       [{v: [13, 0, 0], f: '5,000,000원'}, 5],
       [{v: [14, 0, 0], f: '9,000,000원'}, 9],
       [{v: [15, 0, 0], f: '8,000,000원'}, 8],
       [{v: [16, 0, 0], f: '3,000,000원'}, 3],
       [{v: [17, 0, 0], f: '1,000,000원'}, 1],
     ]);

     var options = {
       title: '시간 별 수익 현황',
       hAxis: {
         title: '시간대 별 수익',
         format: 'h:mm a',
         viewWindow: {
           min: [7, 30, 0],
           max: [17, 30, 0]
         }
       },
       vAxis: {
         title: ''
       }
     };

     var chart = new google.visualization.ColumnChart(
       document.getElementById('chart_div'));

     chart.draw(data, options);
   }
 
</script>

</body>

</html>