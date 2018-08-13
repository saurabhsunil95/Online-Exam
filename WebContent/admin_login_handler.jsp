<!doctype html>
<html lang="en">
  <head>
    <title>Online Test</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,900" rel="stylesheet">

    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">

    <link rel="stylesheet" href="fonts/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="fonts/fontawesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

    <!-- Theme Style -->
    <link rel="stylesheet" href="css/style.css">
  </head>
  <body>
    
    <header role="banner">
     
      <nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <div class="container">
          <a class="navbar-brand absolute" href="index.html">Online Test</a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample05" aria-controls="navbarsExample05" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse navbar-dark" id="navbarsExample05">
            <ul class="navbar-nav mx-auto">
              <li class="nav-item">
                <a class="nav-link" href="index.html">Home</a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="courses.jsp" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Online Courses</a>
                <div class="dropdown-menu" aria-labelledby="dropdown04">
                  <a class="dropdown-item" href="courses.html">HTML</a>
                  <a class="dropdown-item" href="courses.html">WordPress</a>
                  <a class="dropdown-item" href="courses.html">Web Development</a>
                  <a class="dropdown-item" href="courses.html">Javascript</a>
                  <a class="dropdown-item" href="courses.html">Photoshop</a>
                </div>

              </li>

              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="dropdown05" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Categories</a>
                <div class="dropdown-menu" aria-labelledby="dropdown05">
                  <a class="dropdown-item" href="#">HTML</a>
                  <a class="dropdown-item" href="#">WordPress</a>
                  <a class="dropdown-item" href="#">Web Development</a>
                  <a class="dropdown-item" href="#">Javascript</a>
                  <a class="dropdown-item" href="#">Photoshop</a>
                </div>

              </li>
              <li class="nav-item">
                <a class="nav-link" href="blog.html">Blog</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="about.html">About</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="contact.html">Contact</a>
              </li>
            </ul>
             <ul class="navbar-nav absolute-right">
              <li class="nav-item">
                <a href="login.jsp" class="nav-link active">Login</a>
              </li>
              <li class="nav-item">
                <a href="register.jsp" class="nav-link">Register</a>
              </li>
            </ul>
            
          </div>
        </div>
      </nav>
    </header>
    <!-- END header -->

    <section class="site-hero site-hero-innerpage overlay" data-stellar-background-ratio="0.5" style="background-image: url(images/big_image_1.jpg);">
      <div class="container">
        <div class="row align-items-center site-hero-inner justify-content-center">
          <div class="col-md-8 text-center">

            <div class="mb-5 element-animate">
              <h1>Admin Login</h1>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- END section -->


    <section class="site-section bg-light">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-5 box">
            <h2 class="mb-5">Log in with your account</h2>
           <%
	response.setHeader("cache-control", "no-cache,no-store,must-revalidate");
	
	if(session.getAttribute("username")==null){
		response.sendRedirect("admin.jsp");
	}
	%>

				  <% //String e = request.getParameter("mail");
				  //String otp = request.getParameter("ootp");
				  String e="";
Cookie[] theCookies = request.getCookies();
if(theCookies!=null){
	for(Cookie tempCookie : theCookies){
		if("email".equals(tempCookie.getName())){
			e=tempCookie.getValue();
			break;
		}
	}
}
				  
				  %>
				  <center>
				  <form action="OtpLogin">
                  <div class="row ">
                    <div class="col-md-12 form-group">
                      <label for="name">Email</label>
                      <input type="text" id="name" name="user" value=<%=e %> class="form-control " readonly>
                    </div>
                  </div>
                  <div class="row mb-5">
                    <div class="col-md-12 form-group">
                      <label for="pass">OTP</label>
                      <input type="password" id="pass" name="eotp" class="form-control " required="true">
                    </div>
                  </div>
                  
                  <div class="row">
                    <div class="col-md-6 form-group">
                      <input type="submit" value="Login" class="btn btn-primary">
                      <br>
                      <br>
                      <li><a href="login.jsp">Students Login</a></li>
                        <li><a href="company.jsp">Company Login</a></li>
                   </div>
                  </div>
                </form>
				  </center>
				  

          </div>
        </div>
      </div>
    </section>
    <!-- END section -->

     <section class="overflow">
      <div class="container">
        <div class="row justify-content-center align-items-center">
          
          
          <div class="col-lg-1 order-lg-2"></div>
          <div class="col-lg-4 order-lg-1 order-2 mb-lg-0 mb-5">
          </div>
        </div>
      </div>
    </section>
    <!-- END section -->
    
  
    <footer class="site-footer" style="background-image: url(images/big_image_3.jpg);">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md-4">
            <h3>About</h3>
            <p>CETPA Online Test is the largest Online Education service provider in various engineering domains for all engineering students as well as for the working professionals. </p>
          </div>
          <div class="col-md-6 ml-auto">
            <div class="row">
              <div class="col-md-4">
                <ul class="list-unstyled">
                  <li><a href="about.html">About Us</a></li>
                  <li><a href="#">Company</a></li>
                  <li><a href="#">Teachers</a></li>
                  <li><a href="courses.html">Courses</a></li>
                  <li><a href="#">Categories</a></li>
                </ul>
              </div>
              <div class="col-md-4">
                <ul class="list-unstyled">
                  <li><a href="about.html">About Us</a></li>
                  <li><a href="#">Company</a></li>
                  <li><a href="#">Teachers</a></li>
                  <li><a href="courses.html">Courses</a></li>
                  <li><a href="#">Categories</a></li>
                </ul>
              </div>
              <div class="col-md-4">
                <ul class="list-unstyled">
                  <li><a href="about.html">About Us</a></li>
                  <li><a href="#">Company</a></li>
                  <li><a href="#">Teachers</a></li>
                  <li><a href="courses.html">Courses</a></li>
                  <li><a href="#">Categories</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <p>Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved.</p>
          </div>
        </div>
      </div>
    </footer>
    <!-- END footer -->
    
    <!-- loader -->
    <div id="loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#f4b214"/></svg></div>

    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/jquery-migrate-3.0.0.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.waypoints.min.js"></script>
    <script src="js/jquery.stellar.min.js"></script>

    
    <script src="js/main.js"></script>
  </body>
</html>