<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Welcome Bella</title>
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
						    <a href="admin_login_form">
						    	<span class="text">ADMIN</span>
						    </a>
					    </div>    		
		    			<div class="col-md pr-4 d-flex topper align-items-center">		    
						    <a href="login_form">
						    	<span class="text">LOGIN</span>
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
	          <li class="nav-item"><a href="category?kind=1" class="nav-link">????????????</a></li>				<!-- style.css 8210 -->
	          <li class="nav-item"><a href="category?kind=2" class="nav-link">????????????</a></li>
	          <li class="nav-item"><a href="category?kind=3" class="nav-link">????????????</a></li>
	          <li class="nav-item"><a href="category?kind=4" class="nav-link">?????????</a></li>
	          <li class="nav-item"><a href="category?kind=5" class="nav-link">?????????</a></li>
	          <li class="nav-item"><a href="qna_list" class="nav-link">Help</a></li>
	          

	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->

    <section id="home-section" class="hero">
		  <div class="home-slider owl-carousel">
	      <div class="slider-item js-fullheight">
	      	<div class="overlay"></div>
	        <div class="container-fluid p-0">
	          <div class="row d-md-flex no-gutters slider-text align-items-center justify-content-end" data-scrollax-parent="true">
	          	<img class="one-third order-md-last img-fluid" src="images/bg_11.jpg" alt="">
		          <div class="one-forth d-flex align-items-center ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
		          	<div class="text">
		          		<span class="subheading">#New Arrival</span>  <!-- css 8609   ?????? 8524??? bg ???--> 
		          		<div class="horizontal">
				            <h1 class="mb-4 mt-3">Bags Collection 2022</h1>
				            <p style="color: white"> 
							Luxury is not the price, but personality, dignity, individuality, 
							value, and only one thing for me.</p> <!--  css 8135 -->
				            
				            <p><a href="category?kind=1" class="btn-custom">Shop Now</a></p> <!--  css 8650 -->
				          </div>
		            </div>
		          </div>
	        	</div>
	        </div>
	      </div>

	      <div class="slider-item js-fullheight">
	      	<div class="overlay"></div>
	        <div class="container-fluid p-0">
	          <div class="row d-flex no-gutters slider-text align-items-center justify-content-end" data-scrollax-parent="true">
	          	<img class="one-third order-md-last img-fluid" src="images/bg_22.jpg" alt="">
		          <div class="one-forth d-flex align-items-center ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
		          	<div class="text">
		          		<span class="subheading">#New Arrival</span>
		          		<div class="horizontal">
				            <h1 class="mb-4 mt-3">Bags Spring Collection</h1>
				            <p style="color: white">A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country.</p>
				            
				            <p><a href="category?kind=1" class="btn-custom">Shop Now</a></p>
				          </div>
		            </div>
		          </div>
	        	</div>
	        </div>
	      </div>
	    </div>
    </section>


<!--  ?????? ?????? -->

    <section class="ftco-section bg-light">
    	<div class="container">
				<div class="row justify-content-center mb-3 pb-3">
          <div class="col-md-12 heading-section text-center ftco-animate">
            <h2 class="mb-4">Best Bags Arrival</h2>
            <p>Luxury goods have a belief that they do not compromise with the times and do not easily change their own style</p>
          </div>
        </div>   		
    	</div>
    	<div class="container">
    		<div class="row">
    			<!-- 1??? ?????? -->
    			<c:forEach items="${bestProductList}" var="productVO">
    				<div class="col-sm-12 col-md-6 col-lg-3 ftco-animate d-flex">
    					<div class="product d-flex flex-column">
	    					<a href="product_detail?pseq=${productVO.pseq}">
		    					<img class="img-fluid" src="product_images/${productVO.image}" alt="Colorlib Template">
		    						<div class="overlay"></div>
		    					
		    					<div class="text py-3 pb-4 px-3">
		    						<div class="d-flex">
		    							<div class="cat">
				    						<span></span>
				    					</div>
			    					</div>
		    						<h3>${productVO.name}</h3>	    
			  		    			<div class="pricing">
	    								<p class="price"><span class="price-sale"><fmt:formatNumber type="currency" value="${productVO.price2}"/></span></p>
	    							</div>
		    					</div>
	    					</a>
    					</div>
    				</div>
    			</c:forEach>  			
    		</div>
    	</div>
    </section>


	<!--  ????????? ?????? ( ????????????, ????????????, ????????????, ?????? ??? -->
    <section class="ftco-section ftco-choose ftco-no-pb ftco-no-pt">
    	<div class="container">
				<div class="row no-gutters">
					<div class="col-lg-4">
						<div class="choose-wrap divider-one img p-5 d-flex align-items-end" style="background-image: url(images/choose-1.png);">

    					<div class="text text-center text-white px-2">
								<span class="subheading">Cross bags</span>
    						<h2>Cross bags Collection</h2>
    						<p>??????????????? 1854?????? ????????? ???????????? ??????????????? ?????? ???????????????, ??????, ??????????????? ?????? 3??? ?????? ???????????? ????????? ????????? ??????????????????.! </p>
    						<p><a href="category?kind=1" class="btn btn-black px-3 py-2">Shop now</a></p>
    					</div>
    				</div>
					</div>
					<div class="col-lg-8">
    				<div class="row no-gutters choose-wrap divider-two align-items-stretch">
    					<div class="col-md-12">
	    					<div class="choose-wrap full-wrap img align-self-stretch d-flex align-item-center justify-content-end" style="background-image: url(images/choose-2.jpg);">
	    						<div class="col-md-7 d-flex align-items-center">
	    							<div class="text text-white px-5">
	    								<span class="subheading">Women's bags</span>
			    						<h2>Women's Collection</h2>
			    						<p>?????????????????? ????????? ????????? ????????? ????????? ?????? ????????? ????????? ???????????? ??????????????? ?????? ?????? ??????????????? ????????? ????????? ????????? ??????.</p>
			    						<p><a href="category?kind=2" class="btn btn-black px-3 py-2">Shop now</a></p>
			    					</div>
	    						</div>
	    					</div>
	    				</div>
    					<div class="col-md-12">
    						<div class="row no-gutters">
    							<div class="col-md-6">
		    						<div class="choose-wrap wrap img align-self-stretch bg-light d-flex align-items-center">
		    							<div class="text text-center px-5">
		    								<span class="subheading">Spring Sale</span>
				    						<h2>Extra 25% Off</h2>
				    						<p>Spring sale ??????! ?????? ?????? ????????????  &nbsp;&nbsp; ????????? ?????? 20?????? ??????</p>
				    						<p><a href="category?kind=1" class="btn btn-black px-3 py-2">Shop now</a></p>
				    					</div>
		    						</div>
	    						</div>
	    						<div class="col-md-6">
		    						<div class="choose-wrap wrap img align-self-stretch d-flex align-items-center" style="background-image: url(images/choose-3.jpg);">
		    							<div class="text text-center text-white px-5">
		    								<span class="subheading">Bags</span>
				    						<h2>Best Sellers</h2>
				    						<p>??????????????? ???????????? ???????????? ???????????? ?????? ???????????? ??????????????? ??? ??? ?????? ????????? ?????? ????????? ????????? ????????????.</p>
				    						
				    					</div>
		    						</div>
	    						</div>
	    					</div>
    					</div>
    				</div>
    			</div>
  			</div>
    	</div>
    </section>

	<!--  ???????????? ?????? ?????? -->
    <section class="ftco-section ftco-deal bg-primary">
    	<div class="container">
    		<div class="row">
    			<div class="col-md-6">
    				<img src="images/prod-1.jpg" class="img-fluid" alt="">
    			</div>
    			<div class="col-md-6">
    				<div class="heading-section heading-section-white">
    					<span class="subheading">Deal of the day</span>
	            <h2 class="mb-3">Deal of the day</h2>
	          </div>
    				<div id="timer" class="d-flex mb-4">
						 
						  <div class="time pl-4" id="hours"></div>
						  <div class="time pl-4" id="minutes"></div>
						  <div class="time pl-4" id="seconds"></div>
						</div>
						<div class="text-deal">
							<h2><a href="#">SAINT LAURENT 22SS ????????? ????????? ????????? ?????? ????????????</a></h2>
							<p class="price"><span class="mr-2 price-dc">2,743,200???</span><span class="price-sale">2,606,040???</span></p>
							<ul class="thumb-deal d-flex mt-4">
								<li class="img" style="background-image: url(images/prod-1-1.png);"></li>
								<li class="img" style="background-image: url(images/prod-1-2.png);"></li>
								<li class="img" style="background-image: url(images/prod-1-3.png);"></li>
							</ul>
						</div>
    			</div>
    		</div>
    	</div>
    </section>


	<!--  ?????? -->
    <section class="ftco-section testimony-section">
      <div class="container">
        <div class="row">
        	<div class="col-lg-5">
        		<div class="services-flow">
        			<div class="services-2 p-4 d-flex ftco-animate">
        				<div class="icon">
        					<span class="flaticon-bag"></span>
        				</div>
        				<div class="text">
	        				<h3>FROM MILANO TO KOREA IN 3DAYS.</h3>
	        				<p class="mb-0">Bella??? ?????? ??????????????? ????????? ?????? ????????? ?????? ?????? ????????? ????????? ???????????? ?????? ????????? ???????????????.</p>
        				</div>
        			</div>
        			<div class="services-2 p-4 d-flex ftco-animate">
        				<div class="icon">
        					<span class="flaticon-heart-box"></span>
        				</div>
        				<div class="text">
	        				<h3>WE ENRICH LIVES OF COMMUNITIES.</h3>
	        				<p class="mb-0">Bella ?????????????????? ????????? ????????? ????????? ?????? ???????????? ?????? ???????????? ????????????.</p>
	        			</div>
        			</div>
        			<div class="services-2 p-4 d-flex ftco-animate">
        				<div class="icon">
        					<span class="flaticon-payment-security"></span>
        				</div>
        				<div class="text">
	        				<h3>????????? ?????? ??????</h3>
	        				<p class="mb-0">Bella??? ????????? ????????? ?????? ????????? ????????????.</p>
	        			</div>
        			</div>
        			<div class="services-2 p-4 d-flex ftco-animate">
        				<div class="icon">
        					<span class="flaticon-customer-service"></span>
        				</div>
        				<div class="text">
	        				<h3>????????? ????????? ????????????</h3>
	        				<p class="mb-0">????????????: ?????? ?????? 9???~ ?????? 6???(??????,????????? ??????) ????????????: ?????? 12???~1???</p>
	        			</div>
        			</div>
        		</div>
        	</div>
          <div class="col-lg-7">
          	<div class="heading-section ftco-animate mb-5">
	            <h2 class="mb-4">Our satisfied customer says</h2>
	            <p>Bella ??????????????? ????????? ???????????????. ????????? ??? ????????? ????????? ?????????????????????.</p>
	          </div>
            <div class="carousel-testimony owl-carousel">
              <div class="item">
                <div class="testimony-wrap">
                  <div class="user-img mb-4" style="background-image: url(images/person_1.png)">
                    <span class="quote d-flex align-items-center justify-content-center">
                      <i class="icon-quote-left"></i>
                    </span>
                  </div>
                  <div class="text">
                    <p class="mb-4 pl-4 line">?????? ??? ???????????? ???????????? ?????? ???????????? ?????? ??????????????? ?????? ???????????? ?????????.</p>
                    <p class="name">????????? ?????????</p>
                    <span class="position">??????</span>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap">
                  <div class="user-img mb-4" style="background-image: url(images/person_2.png)">
                    <span class="quote d-flex align-items-center justify-content-center">
                      <i class="icon-quote-left"></i>
                    </span>
                  </div>
                  <div class="text">
                    <p class="mb-4 pl-4 line">?????? ?????? ?????????????????? ???????????? ????????? ??????????????? ????????? ????????? ??? ?????? ??? ???????????? ?????? ???????????????.</p>
                    <p class="name">????????????</p>
                    <span class="position">?????????</span>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap">
                  <div class="user-img mb-4" style="background-image: url(images/person_3.png)">
                    <span class="quote d-flex align-items-center justify-content-center">
                      <i class="icon-quote-left"></i>
                    </span>
                  </div>
                  <div class="text">
                    <p class="mb-4 pl-4 line">?????? ?????? ?????????????????? ????????? ??????????????? ??????????????? ?????? ??? ???????????? ???????????? ???????????????.</p>
                    <p class="name">????????????</p>
                    <span class="position">UI Designer</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

<!-- ??????????????? ????????? -->
    <section class="ftco-gallery">
    	<div class="container">
    		<div class="row justify-content-center">
    			<div class="col-md-8 heading-section text-center mb-4 ftco-animate">
            <h2 class="mb-4">Follow Us On Instagram</h2>
            <p>?????????????????? ??????????????? ?????? ???????????? ???????????????! ?????????????????? ?????? ?????? ?????? ?????? ??? ????????? ???????????? ???????????? ??? ???????????????!</p>
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

<!--  Footer -->
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
              <p>Bella??? ?????? ??????????????? ????????? ?????? ????????? ?????? ?????? ????????? ????????? ???????????? ?????? ????????? ???????????????..</p>
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
	                <li><span class="icon icon-map-marker"></span><span class="text">??????????????? ????????? ????????? 737 11??? 1102???</span></li>
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