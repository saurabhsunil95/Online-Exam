<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html lang="en">
<head>
    <title>Online Test</title>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- FontAwesome CSS -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- ElegantFonts CSS -->
    <link rel="stylesheet" href="css/elegant-fonts.css">

    <!-- themify-icons CSS -->
    <link rel="stylesheet" href="css/themify-icons.css">

    <!-- Swiper CSS -->
    <link rel="stylesheet" href="css/swiper.min.css">

    <!-- Styles -->
    <link rel="stylesheet" href="style.css">
</head>
<body>


<form action="Logout">
	<input type="submit" value="logout">
	
</form>

    <div class="hero-content">
        <header class="site-header">
            <div class="top-header-bar">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12 col-lg-6 d-none d-md-flex flex-wrap justify-content-center justify-content-lg-start mb-3 mb-lg-0">
                            <div class="header-bar-email d-flex align-items-center">
                                <i class="fa fa-envelope"></i><a href="#">saurabhsunil4321@gmail.com</a>
                            </div><!-- .header-bar-email -->

                            <div class="header-bar-text lg-flex align-items-center">
                                <p><i class="fa fa-phone"></i>001-1234-88888 </p>
                            </div><!-- .header-bar-text -->
                        </div><!-- .col -->

                        <div class="col-12 col-lg-6 d-flex flex-wrap justify-content-center justify-content-lg-end align-items-center">
                            <div class="header-bar-search">
                                <form class="flex align-items-stretch">
                                    <input type="search" placeholder="What would you like to learn?">
                                    <button type="submit" value="" class="flex justify-content-center align-items-center"><i class="fa fa-search"></i></button>
                                </form>
                            </div><!-- .header-bar-search -->

                            <div class="header-bar-menu">
                                <ul class="flex justify-content-center align-items-center py-2 pt-md-0">
                                    <li><a href="Logout">Logout</a></li>
                                </ul>
                            </div><!-- .header-bar-menu -->
                        </div><!-- .col -->
                    </div><!-- .row -->
                </div><!-- .container-fluid -->
            </div><!-- .top-header-bar -->

            <div class="nav-bar">
                <div class="container">
                    <div class="row">
                        <div class="col-9 col-lg-3">
                            <div class="site-branding">
                                <h1 class="site-title"><a href="index.html" rel="home">Online <span>Test</span></a></h1>
                            </div><!-- .site-branding -->
                        </div><!-- .col -->

                        <div class="col-3 col-lg-9 flex justify-content-end align-content-center">
                            <nav class="site-navigation flex justify-content-end align-items-center">
                                <ul class="flex flex-column flex-lg-row justify-content-lg-end align-content-center">
                                    <li class="current-menu-item"><a href="index.html">Home</a></li>
                                    <li><a href="about.html">About</a></li>
                                    <li><a href="courses.html">Courses</a></li>
                                    <li><a href="blog.html">blog</a></li>
                                    <li><a href="contact.html">Contact</a></li>
                                </ul>

                                <div class="hamburger-menu d-lg-none">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                </div><!-- .hamburger-menu -->

                                <div class="header-bar-cart">
                                    <a href="#" class="flex justify-content-center align-items-center"><span aria-hidden="true" class="icon_bag_alt"></span></a>
                                </div><!-- .header-bar-search -->
                            </nav><!-- .site-navigation -->
                        </div><!-- .col -->
                    </div><!-- .row -->
                </div><!-- .container -->
            </div><!-- .nav-bar -->
        </header><!-- .site-header -->

        <div class="hero-content-overlay">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="hero-content-wrap flex flex-column justify-content-center align-items-start">
                            <header class="entry-header">
                                <h4>Get started with online courses and Online Test</h4>
                                <h1>best online<br/>Learning system</h1>
                            </header><!-- .entry-header -->

                            <div class="entry-content">
                                <p>Online learning is one of the upcoming trends in the education sectors all over the world. This is a mode of learning whereby learning is done through the internet. With modern and improved technologies, this mode of learning has been made easier. Improve Your knowledge by learning online and by giving online test</p>
                            </div><!-- .entry-content -->

                            <footer class="entry-footer read-more">
                                <a href="#">read more</a>
                            </footer><!-- .entry-footer -->
                        </div><!-- .hero-content-wrap -->
                    </div><!-- .col -->
                </div><!-- .row -->
            </div><!-- .container -->
        </div><!-- .hero-content-hero-content-overlay -->
    </div><!-- .hero-content -->

    
    <section class="site-section bg-light">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-12 box">
            <center><h2 class="mb-12">Students Record</h2></center>
                   
             <%
	response.setHeader("cache-control", "no-cache,no-store,must-revalidate");
	
	if(session.getAttribute("username")==null){
		response.sendRedirect("company.jsp");
	}
	%>

	<%
	String sub = request.getParameter("subject");

	  Class.forName("com.mysql.jdbc.Driver");

	  Connection co = DriverManager.getConnection("jdbc:mysql://localhost:3306/results","root","9534598529");

	  Statement st = co.createStatement();
	  Statement st2 = co.createStatement();
	  Statement st3 = co.createStatement();

	  String sql = "show tables in results";

	  ResultSet rs = st.executeQuery(sql);
	  ResultSet rs2 = st2.executeQuery(sql);
	  
	  int records = 0;
		 
		 while(rs.next())
		 {
		  records++;
		 }
		 
		 String[] tables = new String[records];

		  int i = 0;
		 
		 while(rs2.next())
		 {
		  tables[i] = rs2.getString(1);
		  i++;
		 }
		 
	 %>
	 
	 <div style="color:red"><%
    if(null!=request.getAttribute("MailSend"))
    {
        out.println(request.getAttribute("MailSend"));
    }
%></div>

<div style="color:red"><%
    if(null!=request.getAttribute("mailNotSend"))
    {
        out.println(request.getAttribute("mailNotSend"));
    }
%></div>
	 
	   <fieldset>
	<div class="row">
	<div class="col-md-3"><h5>Students Email</h5></div>
	<div class="col-md-3"></div>
	<div class="col-md-3"></div>
	<div class="col-md-3"><h5>Marks</h5></div>
	</div>
	
	 <%
	  for(int index = 0; index < tables.length; index++)
	  {
		  if(tables[index].endsWith("."+sub)){
			  
			  String name=tables[index];
			  String email=name.replace("."+sub,"");
			  
			  ResultSet rs3 = st3.executeQuery("select marks from `"+tables[index]+"`");
			  int totalmarks=0;
			  while(rs3.next()){
				  int ii=rs3.getInt("marks");
				  totalmarks=totalmarks+ii;
			  }
	 %>
	 
	 <br>
	 <div class="container mt-3">
  <ul class="list-group">
    <a href="companystudentprofile.jsp?email=<%=email%>"><li class="list-group-item d-flex justify-content-between align-items-center">
      <%=email%><br>
      <span class="badge badge-primary badge-pill"><%=totalmarks%></span>
    </li></a>
    
  </ul>
</div>
	 
	  
	 <%   }
	  }
	 co.close();
	 %> 
	</select>
	<br>
	<br>
	
          </div>
        </div>
      </div>
    </section>
    
    

    <footer class="site-footer">
        <div class="footer-widgets">
            <div class="container">
                <div class="row">
                    <div class="col-12 col-md-6 col-lg-3">
                        <div class="foot-about">
                            <a class="foot-logo" href="#"><img src="images/footlogo.png" alt=""></a>

                            <p>CETPA Online Test is the largest Online Education service provider in various engineering domains for all engineering students as well as for the working professionals. </p>

                            <p class="footer-copyright">Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved.</p>
                        </div><!-- .foot-about -->
                    </div><!-- .col -->

                    <div class="col-12 col-md-6 col-lg-3 mt-5 mt-md-0">
                        <div class="foot-contact">
                            <h2>Contact Us</h2>

                            <ul>
                                <li>Email: saurabhsunil4321@gmail.com</li>
                                <li>Phone: (+91) 9102785933</li>
                                <li>Address: CETPA INFOTECH Sector 2 Noida City, UP</li>
                            </ul>
                        </div><!-- .foot-contact -->
                    </div><!-- .col -->

                    <div class="col-12 col-md-6 col-lg-3 mt-5 mt-lg-0">
                        <div class="quick-links flex flex-wrap">
                            <h2 class="w-100">Quick Links</h2>

                            <ul class="w-50">
                                <li><a href="about.html">About </a></li>
                                <li><a href="#">Terms of Use </a></li>
                                <li><a href="#">Privacy Policy </a></li>
                                <li><a href="contact.html">Contact Us</a></li>
                            </ul>

                            <ul class="w-50">
                                <li><a href="#">Documentation</a></li>
                                <li><a href="#">Forums</a></li>
                                <li><a href="#">Language Packs</a></li>
                                <li><a href="#">Release Status</a></li>
                            </ul>
                        </div><!-- .quick-links -->
                    </div><!-- .col -->

                    <div class="col-12 col-md-6 col-lg-3 mt-5 mt-lg-0">
                        <div class="follow-us">
                            <h2>Follow Us</h2>

                            <ul class="follow-us flex flex-wrap align-items-center">
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            </ul>
                        </div><!-- .quick-links -->
                    </div><!-- .col -->
                </div><!-- .row -->
            </div><!-- .container -->
        </div><!-- .footer-widgets -->

        <div class="footer-bar">
            <div class="container">
                <div class="row flex-wrap justify-content-center justify-content-lg-between align-items-center">
                    <div class="col-12 col-lg-6">
                        <div class="download-apps flex flex-wrap justify-content-center justify-content-lg-start align-items-center">
                            <a href="#"><img src="images/app-store.png" alt=""></a>
                            <a href="#"><img src="images/play-store.png" alt=""></a>
                        </div><!-- .download-apps -->

                    </div>

                    <div class="col-12 col-lg-6 mt-4 mt-lg-0">
                        <div class="footer-bar-nav">
                            <ul class="flex flex-wrap justify-content-center justify-content-lg-end align-items-center">
                                <li><a href="#">DPA</a></li>
                                <li><a href="#">Terms of Use</a></li>
                                <li><a href="#">Privacy Policy</a></li>
                            </ul>
                        </div><!-- .footer-bar-nav -->
                    </div><!-- .col-12 -->
                </div><!-- .row -->
            </div><!-- .container -->
        </div><!-- .footer-bar -->
    </footer><!-- .site-footer -->

<script type='text/javascript' src='js/jquery.js'></script>
<script type='text/javascript' src='js/swiper.min.js'></script>
<script type='text/javascript' src='js/masonry.pkgd.min.js'></script>
<script type='text/javascript' src='js/jquery.collapsible.min.js'></script>
<script type='text/javascript' src='js/custom.js'></script>

</body>
</html>