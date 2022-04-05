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
        	<form name="frm" id="write_form" method="post" enctype="multipart/form-data">
            <!-- Main Content -->
            <div id="content">
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">상품 등록</h6>
                        </div>
                        <div class="card-body">
							<table id="list">
							  <tr>
							    <th>상품분류</th>
							    <td colspan="5">
							    <select name="kind" id="kind">
								    <c:forEach items="${kindList}" var="kind" varStatus="status">
								      <option value="${status.count}">${kind}</option>
								   </c:forEach>
							    </select> 
							    </td>
							  </tr>
							  <tr>
							    <th>상품명</th>
							    <td width="343" colspan="5">
							      <input type="text" name="name" id="name" size="47" maxlength="100" value="">
							    </td>
							  </tr>
							  <tr>
							    <th>판매가[A]</th>
							    <td width="70">        
							      <input type="text" name="price1" id="price1" size="11" onKeyUp='NumFormat(this)' value="">
							    </td>
							    <th width="70">회원가[B]</th>
							    <td>
							      <input type="text" name="price2" id="price2" size="11" onBlur="go_ab()" onKeyUp='NumFormat(this)' value="">
							    </td>
							  </tr>

							  <tr>
							    <th>상세설명</th>
							    <td colspan="5">
							      <textarea name="content" id="content" rows="8" cols="70" ></textarea>
							    </td>
							  </tr>
							  <tr>
							    <th>상품이미지</th>
							    <td width="343" colspan="5">
							<!--  [2] 파일 업로드를 하기 위한 input 태그는 타입 속성 값을 file로 지정해야 한다.  -->
							      <input type="file" name="product_image" id="product_image">
							    </td> 
							  </tr>    
							</table> 
							
							<input class="btn d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" type="button" value="등록" onClick="go_save()">           
							<input class="btn d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" type="button" value="취소" onClick="go_mov()">			

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