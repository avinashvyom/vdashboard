<%@page import="com.company.myapp.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%
response.addHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.addHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
<%
int timeout = session.getMaxInactiveInterval();
response.setHeader("Refresh", timeout + "; URL = session.do?");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="include.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Pragma" content="no-cache">
 <meta http-equiv="Cache-Control" content="no-cache">
 <meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">
<title>MyApp</title> 
<link rel="icon" type="image/gif/png" href="images/cm.png">  	
	<script src="js/jquery-1.11.1.min.js"></script>   	
   	<link rel="stylesheet" href="css/bootstrap.min.css">
   	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
   	<link rel="stylesheet" href="css/bootstrap.css">
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
   	
   	
	<link href="cssmenu/styles.css" rel="stylesheet" type="text/css">
	<link href="css/appStyle.css" rel="stylesheet" type="text/css">
	<link href="css/smoothness/popup-jquery-ui.css" rel="stylesheet" type="text/css">
	<link href="cssmenu/tab.css" rel="stylesheet" type="text/css">
	
	<!-- <script type="text/JavaScript" src="js/popup-jquery-1.10.2.js"></script> -->
	<script type="text/JavaScript" src="js/jquery-ui.js"></script>
	
	<script type="text/javascript">	
		$(document).ready(function() {
		    $('#navbar').affix({
		        offset: {
					top: $('header').height()
				}
			});	
		});
	</script>	
	<script type="text/JavaScript" src="js/ajax.js"></script>
	<script type="text/JavaScript" src="js/jquery-1.11.1.min.js"></script>
	<script type="text/JavaScript" src="js/jquery-ui-1.10.2.custom.min.js"></script>
	<!-- <script type="text/JavaScript" src="js/jquery.dataTables.min.js"></script> -->
	<!-- <script type="text/JavaScript" src="js/bpopup.js"></script> -->
	<script type="text/JavaScript" src="cssmenu/script.js"></script>	
	
	
	
	<style type="text/css">
		@import url('https://fonts.googleapis.com/css?family=Lato:300,400');

		/* html, body {
		  font-family: 'Lato', serif;  
		} */
		
		.navbar-default {
		  font-size: 1.15em;
		  font-weight: 400;
		  background-color: #FF8800;/*#006b96*/
		  padding: 1px;
		  border: 0px;
		  border-radius: 0px;
		}
		
		li.dropdown {
		    display: inline-block;
		    
		}
		
		.dropdown-content {
		    display: none;
		    position: absolute;
		    background-color: #f9f9f9;
		    min-width: 160px;
		    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
		    z-index: 1;
	
		}
		
		.dropdown-content a {
		    color: black;
		    padding: 12px 16px;
		    text-decoration: none;
		    display: block;
		    text-align: left;
	  
		}
		
	
		
		li a, .dropbtn {
		    display: inline-block;
		    color: white;
		    text-align: center;
		    padding: 14px 16px;
		    text-decoration: none;
		   	padding-top: 100px;
		   
		}
		
		li a:hover, .dropdown:hover .dropbtn {
		   /*  background-color: black; */
		}
		
		.dropdown-content a:hover {background-color: #f1f1f1}
		
		.dropdown:hover .dropdown-content {
		    display: block;
		}
		
		.navbar-default .navbar-nav>li>a {
		  color: white;
		}
		
		.navbar-default .navbar-nav>li>a:hover {
		  color: #cbf0ff;
		}
		
		.navbar-default .navbar-brand {
		  color: #002433;
		}
	
		.navbar-default .navbar-brand:hover {
		  color: #ffffff;
		  text-shadow: 1px -1px 8px #b3e9ff;
		}
		
		.navbar-default .navbar-nav>.open>a, .navbar-default .navbar-nav>.open>a:hover, .navbar-default .navbar-nav>.open>a:focus {
		  background-color: #004059;
		  color: white;
		}
		
		.navbar-default .navbar-toggle {
		  border: none;
		}
		
		.navbar-default .navbar-collapse, .navbar-default .navbar-form {
		  border: none;
		}
		
		.navbar-default .navbar-toggle:hover, .navbar-default .navbar-toggle:focus {
		  background-color: #002433;
		}
		
		.navbar-default .navbar-toggle .icon-bar {
		  background-color: #ffffff;
		}
		
		.dropdown-menu {
		  background-color: transparent;
		  /*color: white;*/
		  border: 0px;
		  border-radius: 2px;
		  padding-top: 10px;
		  padding-bottom: 10px;
		}
		
		.dropdown-menu>li>a {
		  background-color: #FF8800;
		  color: white;
		}
		
		.dropdown-menu>li>a:hover, .dropdown-menu>li>a:focus {
		  background-color: #004059;
		  color:white;
		}
		
		.dropdown-menu .divider {
		    height: 1px;
		    margin: 9px 0;
		    overflow: hidden;
		    background-color: #003246;
		}
		
		.navbar-default .navbar-nav .open .dropdown-menu>li>a {
		    color: #ffffff;
		}
		
		.navbar {
		 left: auto;
		  top: auto;
		    position: relative;
		    /* min-height: 50px; */
		    margin-bottom: 2px;
		    border: 1px solid transparent;
		    height: 20px !important
		}
		
		@media (max-width: 767px) { 
		  .dropdown-menu>li>a {
		    background-color: #006b96;
		    color: #ffffff;
		  }
		  .dropdown-menu>li>a:hover {
		    color: #ffffff;
		  }
		  
		  .navbar-default .navbar-nav .open .dropdown-menu>li>a:focus, .navbar-default .navbar-nav .open .dropdown-menu>li>a:hover {
		    color: #ffffff;
		    background-color: transparent;
		  }
		  
		  .dropdown-menu .divider {
		    height: 1px;
		    margin: 9px 0;
		    overflow: hidden;
		    background-color: #005577;
		  }
		  
		  .logo{
			color:#fff;
			font-size:50px;
			line-height: 125px;
			}
		} /* END Media Query */
	</style>
	
</head>
<c:set var="nsec" value="${nsec}"></c:set>
	<%
	String nsec = (String)pageContext.getAttribute("nsec");	
	
	UserDto userDto = (UserDto)session.getAttribute("userDto"+nsec+"");
	 
	%>

<body>
	<nav class="navbar navbar-default">
	  <div class="container-fluid">
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>	      
	      <a class="navbar-brand" href="#"><img src="images/vyomlabs1.png" alt="Avatar" class="avatar"></a>
	    </div>
	
	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	      	
<%-- 	         	<li><a href="dashboard.do?pType=new&nsec=<%=nsec%>"><span><img src="images/pie.png"></span> Dashboard</a></li> --%>
	         <%
	        
	       
	         if(userDto.getRole().equals("Admin")){ %>
	         <li><a href="dashboard.do?pType=new&nsec=<%=nsec%>"><span><img src="images/pie.png"></span> Dashboard</a></li>
	         	<li><a href="createProcess.do?nsec=<%=nsec%>&msg=&str="><span><img src="images/gear.png"></span> Register Process</a></li>
	         	<%--  <li><a href="createUser.do?nsec=<%=nsec%>&msg="><span><img src="images/user1.png"></span> User Creation</a></li>
	         	 <li><a href="updateUser.do?nsec=<%=nsec%>&msg= &userName=New"><span><img src="images/user1.png"></span> User Updation</a></li> --%>
	         	 <li class="dropdown">
				    <a href="javascript:void(0)" class="dropbtn"><span><img src="images/user1.png"></span> User</a>
				    <div class="dropdown-content">
				      <a href="createUser.do?nsec=<%=nsec%>&msg="><span><img src="images/user1.png"></span> Create User</a>
				      <a href="updateUser.do?nsec=<%=nsec%>&msg= &userName=New"><span><img src="images/user1.png"></span> Update User</a>
				      
				    </div>
				  </li>
	         	<%-- <li><a href="testProcess.do?nsec=<%=nsec%>><span class="glyphicon glyphicon-th" aria-hidden="true"></span> Test</a></li> --%>
	         <%}  else { %>
	         		<li><a href="dashboard.do?pType=new&nsec=<%=nsec%>"><span><img src="images/pie.png"></span> Dashboard</a></li>
	         <%} %>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	      	<li>
	      		<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    About
			  </button>
			  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
			    <a class="dropdown-item" href="#">Version 1</a>
			  </div>
	      	</li>	       
	         <li><a href="#"><span><img src="images/user1.png"></span><span><%=userDto.getFirstName()%></span></a></li>
	        <li><a href="logout.do?nsec=<%=nsec%>"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span> Logout</a></li>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
</body>
</html>