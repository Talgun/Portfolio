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

    <title>Admin page</title>

    <!-- Custom fonts for this template -->
    <link href="admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="admin/css/sb-admin-2.min.css" rel="stylesheet">
    <link rel="stylesheet" href="admin/css/admin.css">

    <!-- Custom styles for this page -->
    <link href="admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="admin/product/product.js"></script>

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
        	<form name="frm" id="detail_form" method="post">
            <!-- Main Content -->
            <div id="content">
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">상품 상세 보기</h6>
                        </div>
                        <div class="card-body">

								<table id="list">
								  <tr>
								    <th>상품분류</th>
								    <td  colspan="5">
								  ${kind}
								     </td>    
								    </tr>
								    <tr>
								        <th align="center" >상품 명</th>
								        <td colspan="5">${productVO.name}</td>
								    </tr>
								    
								    <tr>
								        <th >판매가[A]</th>
								        <td width="60">${productVO.price1}&nbsp;&nbsp;&nbsp;&nbsp;</td>
								        <th>할인가[B]</th>
								        <td width="60">${productVO.price2}&nbsp;&nbsp;&nbsp;&nbsp;</td>

								    </tr>
								     
								    <tr>
								        <th>상세설명</th>
								        <td colspan="5">${productVO.content}</td>
								    </tr>
								    
								    <tr>
								     <th>상품이미지</th>
								     <td colspan="5" align="center">
								  <!--[7] 상품 이미지를 출력하기 -->     
								     <img src="product_images/${productVO.image}" width="200pt">    
								     </td>
								    </tr>
								     
								</table>		
								<!--[8] 수정 버튼이 눌리면 상품 수정 페이지로 이동하되 현재 페이지와 상품 일련번호 값을 전달해 준다. --> 
								<input class="btn d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"  type="button" value="수정" onClick="go_mod('${productVO.pseq}')">
								<!--[9] 목록 버튼이 눌리면 상품 리스트 페이지로 이동하되 현재 페이지를 전달해 준다. --> 
								<input class="btn d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"  type="button" value="목록" onClick="go_list('${criteria.pageNum}', '${criteria.rowsPerPage}')">  			

                        </div>
                    </div>
               </div>
                <!-- /.container-fluid -->
                </form>
            </div>
        </div>
        <!-- End of Content Wrapper -->


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

</body>

</html>

