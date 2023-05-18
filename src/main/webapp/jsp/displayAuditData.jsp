<%@page import="com.company.myapp.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	response.addHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.addHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<%@ include file="header2.jsp"%>
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Audit Data</title>
<link href="css/jquery.dataTables.css" rel="stylesheet" type="text/css">
<link href="css/jquery.dataTables_themeroller.css" rel="stylesheet"
	type="text/css">
<script type="text/JavaScript" src="js/jquery.dataTables.min.js"></script>

<!-- <script type = "text/javascript" >
		function preventBack(){window.history.forward();}	
		setTimeout("preventBack()", 0);	
		window.onunload=function(){null;};
    </script> -->
<script type="text/javascript">
		 $(document).ready(function() {
			$('#example').dataTable( {
				"bJQueryUI":true,
				"sPaginationType": "full_numbers",
				"iDisplayLength": 20,
				"aoColumnDefs":[{
					'bSortable':false,'aTargets':[5,6]
				}],
				 
				"sScrollX": "100%",
		        "sScrollXInner": "110%",
		        "bScrollCollapse": true	       
		    } );
		} ); 
		
		function f_Process(){
 			var selectedProcess = document.getElementById('list').value;
			//sel = document.querySelector('#list').value;
			console.log(selectedProcess);
			var url = "displayAuditData.do?pType="+selectedProcess+"&nsec=<%=nsec%>";
			//alert("Hello! I am an f_Process!! :"+ selectedProcess + "URL is : "+url);
			document.displayAudit.action = url;
			document.displayAudit.submit();
		}
		function f_Back(){
			document.displayAudit.action = "dashboard.do?pType=new&nsec=<%=nsec%>";
			document.displayAudit.submit();
		}
		function f_Back1(pType){
			document.displayAudit.action = "dashboard.do?pType="+pType+"&nsec=<%=nsec%>";
			document.displayAudit.submit();
	}
</script>
<style type="text/css">
.container1 {
	width: 98%;
	margin-left: 5px;
}

.header {
	color: #0d47a1; /*#e65100;*/
	font-size: 20px;
	font-weight: bold;
}

.custom {
	color: #337ab7;
	opacity: 0.7;
}

.custom:active {
	color: #337ab7;
}
</style>
</head>
<body>
	<form name="displayAudit" id="displayAudit" method="post">	
		<div style="width: 90%; float: left; margin-left: 5px">
			<div style="width: 35%; float: left;">
<!-- 			Process Name &nbsp;:&nbsp;&nbsp; -->
<%-- 			${pType} --%>
					<label style="color: #1a237e;font-size: 18px;font-weight: bold;"></label>
					<label style="color: #e65100;font-size: 15px;font-weight: bold;"></label>
			</div>
			<div style="width: 50%; float: left;">
				<label style="color: #0099CC;font-size: 18px;font-weight: bold;">Process Name : </label>
					<div style="width: 70%; float: right;">
						<select class="form-control3" style="color: #e65100;font-size: 15px;font-weight: bold;" 
						id="list" name="list" onChange="f_Process()">
							<option disabled selected value> -- select -- </option>
							<c:forEach items = "${auditTablesList}" var="auditTable">
								<option value="${auditTable}" ${auditTable eq pType ? 'selected' : ''}>${auditTable}</option>							
							</c:forEach>
						</select>
					</div>
			</div>
			<div style="width: 10%; float: left;">
				<button type="submit" class="btn btn-info" value="Back" onclick="f_Back1('${pType}')">Back</button>
			</div>
		</div>
		<br><br>
		<div id="sub-title" class="container1">		<!-- container1 -->      
	    	<hr style="color: red">	
			<div id="empGrid" style="overflow: auto;height: 600px;overflow-x: hidden">
				<c:if test="${empty auditTableRows || not empty message}">
					<h3 style="color: #b71c1c">Data not found.....</h3>
					<!-- <button type="submit" class="btn btn-info" value="Back" onclick="f_Back()">Back</button> -->
				</c:if>
				<c:if test="${not empty auditTableRows}">
				
					<table  cellpadding="0" cellspacing="0" border="1" class="display" id="example">
						<thead>
							<tr>								
 								<c:set var="startLoop" scope="page" value="1"/>  
								<c:forEach items="${columnsList}" var="maps" >
						 	      	<th style="align:center;"> ${maps}</th>  		
 						      		<c:set var="startLoop" scope="page" value="0"/>
								</c:forEach>							   		
							</tr>
						</thead>
						<tbody>													
							<c:forEach items="${auditTableRows}" var="maps" >
 									<c:set var="startLoop" scope="page" value="1"/>
 									<c:set var="loop" scope="page" value="1"/>
									<tr>								
										<c:forEach items="${maps}" var="mapItem" varStatus="mapsIndex">
											<c:set var="index" scope="page" value="1"/>								
											<c:if test="${startLoop==1}">										
 												<c:set var="startLoop" scope="page" value="0"/> 
											</c:if>	
											<td style="align:center; color:black;">
												<!-- <span style="align:center; color:black;"></span> -->${mapItem.value}
											</td>
											<!-- <span style="align:center; color:black;"></span> -->
 								      		<c:set var="startLoop" scope="page" value="1"/>							      		 
								    	</c:forEach>
							    	</tr>
					   		</c:forEach>				   		
						</tbody>
					</table>				
				
			</c:if>
			</div>
		</div>
	</form>
</body>
</html>