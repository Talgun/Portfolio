<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html lang="en">

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

    <!-- Custom styles for this page -->
    <link href="admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="admin/product/product.js"></script>
    <script type="text/javascript">
	    function go_list()
	    {
	 	   var theForm = document.frm;
	 	   theForm.action="admin_qna_list";
	 	   theForm.submit();
	    }
	
	    function go_rep(qseq)
	    {
	 	   var theForm = document.frm;
	 	   //theForm.qseq.value=qseq;
	 	   theForm.action="admin_qna_repsave";
	 	   theForm.submit();
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
			<form name="frm" method="post">
			<input type="hidden" name="qseq" value="${qnaVO.qseq}">
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
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Q&A게시판</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="orderList" width="100%" cellspacing="0">
									    <tr>
									        <th width="20%">제목</th>
									        <td> ${qnaVO.subject} ${qnaVO.rep} </td>
									    </tr>
									   <tr>
									         <th>등록일</th>
									         <td> <fmt:formatDate value="${qnaVO.indate}"/> </td>  
									    </tr>
									    <tr>
									        <th>내용</th>
									        <td> ${qnaVO.content}</td>  
									    </tr>
                                </table> 
                                <c:choose>          
								  <c:when test='${qnaVO.rep=="1"}'>
								  <table id="orderList">
								      <tr>
								          <td colspan="2">
								      </td>
								      </tr>
								    <tr>
								          <td colspan="2">    
								      <textarea name="reply" rows="3" cols="50"></textarea>
								      <input type="button" class="btn btn btn-primary" value="저장" onClick="go_rep('${qnaVO.qseq}')">    
								      </td>
								      </tr>
								  </table>
								  <br>
								  </c:when>
								  <c:otherwise>  
								  <table id="orderList">
								    <tr>
								     <th>댓글</th>
								     <td> ${qnaVO.reply}</td>
								    </tr>
								  </table>
								  </c:otherwise>
							 </c:choose>                                
                            </div>
                        </div>
                    </div>
                    <input type="button" class="btn btn-success btn-sm" value="목록" onClick="go_list()"
                    		style="padding: auto;">                      

                </div>
                <!-- /.container-fluid -->
         </div>

            

            <!-- End of Footer -->
			</form>
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

</body>

</html>