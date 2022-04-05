<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Bella</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/member/contract.css">


    
  <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
  <script type="text/javascript" src="member/member.js"></script>
  <script type="text/javascript" src="product/product.js"></script>
  <script type="text/javascript" src="member/findIdAndPassword.js"></script>
  <script type="text/javascript" src="mypage/mypage.js"></script> 
  </head>
 <body class="goto-here">
		<div class="py-1 bg-black">
    	<div class="container">
    		<div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
	    		<div class="col-lg-12 d-block">
		    		<div class="row d-flex">
		    			<c:choose>
       					<c:when test="${empty sessionScope.loginUser}">		    		
		    			<div class="col-md pr-4 d-flex topper align-items-center">		    
						    <a href="login_form">
						    	<span class="text">LOGIN</span>
						    </a>
						</div>    
						<div class="col-md pr-4 d-flex topper align-items-center">
						    <a href="admin_login_form">
						    	<span class="text">ADMIN</span>
						    </a>
					    </div>
					   <div class="col-md pr-4 d-flex topper align-items-center">			    	
						    <a href="contract">
						    	<span class="text">JOIN</span>
						    </a>
					    </div>
					    </c:when>
      					<c:otherwise>
					     <div class="col-md pr-4 d-flex topper align-items-center">
						     <a href="logout">
						    	<span class="text">LOGOUT</span>
						    </a>
					    </div>
					    </c:otherwise>       
       					</c:choose>
					     <div class="col-md pr-4 d-flex topper align-items-center">
						     <a href="cart_list">
						    	<span class="text">CART</span>
						    </a>
					    </div>
					   <div class="col-md pr-4 d-flex topper align-items-center">
						     <a href="mypage">
						    	<span class="text">MY PAGE</span>
						    </a>
					    </div>
					    <div class="col-md pr-4 d-flex topper align-items-center">
						     <a href="qna_list">
						    	<span class="text">Q&amp;A(1:1)</span>
						    </a>
					    </div>
				    </div>
			    </div>
		    </div>
		  </div>
    </div>
    
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="index.html">Bella</a>			<!-- style.css 8198 -->
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item active"><a href="index.html" class="nav-link">Home</a></li>  		<!-- style.css 8278 -->
	          <li class="nav-item"><a href="category?kind=1" class="nav-link">크로스백</a></li>				<!-- style.css 8210 -->
	          <li class="nav-item"><a href="category?kind=2" class="nav-link">클러치백</a></li>
	          <li class="nav-item"><a href="category?kind=3" class="nav-link">파우치백</a></li>
	          <li class="nav-item"><a href="category?kind=4" class="nav-link">토트백</a></li>
	          <li class="nav-item"><a href="category?kind=5" class="nav-link">버킷백</a></li>
	          <li class="nav-item"><a href="qna_list" class="nav-link">Help</a></li>
	          

	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->

    <div class="hero-wrap hero-bread" style="background-image: url('images/bg_6.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-0 bread">1:1 고객 게시판</h1>
          </div>
        </div>
      </div>
    </div>

<section class="ftco-section bg-light">  <!-- ftco-section ftco-cart -->
			<div class="container">		  			
				<form name="formm" method="post">
				<div class="row">
    			<div class="col-md-8 col-lg-10 order-md-last">
    				<div class="cart-list">
	    				<table class="table">
						    <thead class="thead-primary">
						     <h3> 고객님의 질문에 대해서 운영자가 1:1 답변을 드립니다.</h3>
						    </thead>
						    <tbody>
 						    	<table id="notice">
							      <tr>
							              <th>제목</th>
							              <td>${qnaVO.subject}</td> 
							      </tr>
							      <tr>
							        <th>등록일</th>
							        <td> <fmt:formatDate value="${qnaVO.indate}" type="date"/></td>
							      </tr>
							      <tr>
							        <th>질문내용</th>
							        <td>${qnaVO.content} 
							      </tr>
							      <tr>
							        <th>답변 내용</th>
							        <td>${qnaVO.reply}  
							      </tr>
							    </table>
						    </tbody>
						  </table>
					  </div>
    			</div>
    			
    			
    			<div class="col-md-4 col-lg-2">
		    		<div class="sidebar">
							<div class="sidebar-box-2">
								<h2 class="heading">Categories</h2>
								<div class="fancy-collapse-panel">
                  <div class="panel-group">
					
					<div class="panel panel-default">
                         <div class="panel-heading">
                             <h4 class="panel-title">
                               	      <ul>
								        <li>
								          <a href="qna_list">Q&A 게시글 리스트</a>
								        </li>  
								        <li>
								          <a href="qna_write_form">Q&A 게시글 쓰기</a>
								        </li>  
								      </ul>  
                             </h4>
                         </div>
                     </div>
                     

                  </div>
               </div>
							</div>

						</div>
    			</div>

			</form>		
    	</div>

    		
    		    <div class="clear"></div>
     
			    <div id="buttons" style="float: right">
			      <input type="button" value="목록보기" class="submit cancel btn btn-primary py-3 px-4" onclick="location.href='qna_list'">    
			      <input type="button" value="쇼핑 계속하기" class="cancel btn btn-primary py-3 px-4" onclick="location.href='index'">    
			     </div>
</section>

    
    <!-- 인스타그램 팔로우 -->
    <section class="ftco-gallery">
    	<div class="container">
    		<div class="row justify-content-center">
    			<div class="col-md-8 heading-section text-center mb-4 ftco-animate">
            <h2 class="mb-4">Follow Us On Instagram</h2>
            <p>인스타그램을 팔로우하고 여러 혜택들을 받아가세요! 인스타그램에 가장 먼저 할인 소식 및 신상품 소식들이 올라오니 꼭 참고하세요!</p>
          </div>
    		</div>
    	</div>
    	<div class="container-fluid px-0">
    		<div class="row no-gutters">
					<div class="col-md-4 col-lg-2 ftco-animate">
						<a href="images/gallery-1.png" class="gallery image-popup img d-flex align-items-center" style="background-image: url(images/gallery-1.png);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					<div class="col-md-4 col-lg-2 ftco-animate">
						<a href="images/gallery-2.png" class="gallery image-popup img d-flex align-items-center" style="background-image: url(images/gallery-2.png);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					<div class="col-md-4 col-lg-2 ftco-animate">
						<a href="images/gallery-3.png" class="gallery image-popup img d-flex align-items-center" style="background-image: url(images/gallery-3.png);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					<div class="col-md-4 col-lg-2 ftco-animate">
						<a href="images/gallery-4.png" class="gallery image-popup img d-flex align-items-center" style="background-image: url(images/gallery-4.png);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					<div class="col-md-4 col-lg-2 ftco-animate">
						<a href="images/gallery-5.png" class="gallery image-popup img d-flex align-items-center" style="background-image: url(images/gallery-5.png);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
					<div class="col-md-4 col-lg-2 ftco-animate">
						<a href="images/gallery-6.png" class="gallery image-popup img d-flex align-items-center" style="background-image: url(images/gallery-6.png);">
							<div class="icon mb-4 d-flex align-items-center justify-content-center">
    						<span class="icon-instagram"></span>
    					</div>
						</a>
					</div>
        </div>
    	</div>
    </section>    
    
    
    
<!--  footer 부분 -->
   <footer class="ftco-footer ftco-section">
      <div class="container">
      	<div class="row">
      		<div class="mouse">
						<a href="#" class="mouse-icon">
							<div class="mouse-wheel"><span class="ion-ios-arrow-up"></span></div>
						</a>
					</div>
      	</div>
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Bella</h2>
              <p>Bella는 해외 부티크와의 계약을 통해 국내에 가장 많은 브랜드 상품을 유통하는 명품 플랫폼 기업입니다..</p>
              <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">       
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-5">
              <h2 class="ftco-heading-2">Menu</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-2 d-block">Shop</a></li>
                <li><a href="#" class="py-2 d-block">About</a></li>
                <li><a href="#" class="py-2 d-block">Qna</a></li>
                <li><a href="#" class="py-2 d-block">Contact Us</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md-4">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Help</h2>
              <div class="d-flex">
	              <ul class="list-unstyled mr-l-5 pr-l-3 mr-4">
	                <li><a href="#" class="py-2 d-block">Shipping Information</a></li>
	              </ul>

	            </div>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">Have a Questions?</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon icon-map-marker"></span><span class="text">서울특별시 강남구 역삼동 737 11층 1102호</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">02 5151 1919</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">Bella@shop.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">

            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart color-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
						  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</p>
          </div>
        </div>
      </div>
    </footer>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>


    
  </body>
</html>