<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
	<%@ page import="com.akarmel.worldcup.util.Constant" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title><%= Constant.APP_TITLE %></title>
		
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">	
		
		<style>	    
		    .btn-primary {
		        color: #ffffff !important;
		        background-color: #FFD700 !important; 
		        border-color: #FFD700 !important;
		        font-weight: bold !important;
		    }
		    
		    .btn-primary:hover {		     
		        background-color: #ffa500 !important;
		        border-color: #ffa500 !important;
		    }
		</style>
	</head>
	<body class="form-nosodark">
		<%@include file="menu.jsp"%>
		
			<div class="container">
				<div class="row">	
					<div class="col-sm-6">	
						<h2 class="text-secondary letter-gradient">
							<%= Constant.APP_TITLE %> <%= Constant.YEAR_2022 %>
						</h2>
					</div>	
					<div class="col-sm-6">				
						<h2 class="text-secondary text-right pink">Teams
							<button type="button" class="btn btn-outline-dark border-pink red-tooltip" onclick="location.href='/worldcup/team/new'" class="btn btn-secondary" data-toggle="tooltip" data-placement="top" title="Add New Team">+</button>
						</h2>	
					</div>
				</div>
				<hr class="line-yellow">
				<form:form action="search" method="POST">
					<div class="row">					
						<div class="col-md-10">
	               			 <input type="text" class="form-control" name="theSearchName" placeholder="Search Team by Name" />                
	             		</div>
	               		<div class="col-md-2">
	               			 <button type="submit" value="Search" class="btn btn-primary">Search</button>
	             		</div>	             
	            	</div>	
            	</form:form>				
				<hr class="line-yellow">
				<div class="row">
				    <jsp:useBean id="processed" class="java.util.HashMap" />
				    <c:forEach items="${teams}" var="tempTeam">
				    
				  		<c:url var="updateLink" value="/team/Update">
							<c:param name="teamId" value="${tempTeam.id}" />
						</c:url>	
						
				        <c:if test="${empty processed[tempTeam.grupete.name]}">
				            <c:set target="${processed}" property="${tempTeam.grupete.name}" value="true" />
				            <div class="col-md-12 col-sm-12 col-xs-12 text-secondary font-weight-bold pink">	
			                    ${tempTeam.grupete.name}				                  			                    
				        	</div>  
		            	    <div class="col-md-12 col-sm-12 col-xs-12">	
								 <hr class="line-yellow"> 
							</div> 
			                <div class="col-md-12 col-sm-12 col-xs-12 col py-3 px-md-5">
			              		 <button type="button" class="btn btn-outline-dark border-yellow" onclick="location.href='/worldcup/team/delete'" data-toggle="tooltip" data-placement="top" title="Delete Team"> 
			              		 	<img height="25" width="25" src="<c:url value="/resources/img/garbage.jpg"/>" class="img-thumbnail"/>
			              		 </button>
			                    	
			                   	 <img  src="<c:url value="/resources/img/${tempTeam.flagPath}"/>" class="img-thumbnail"/>&nbsp; 				                    
				                 <a href="${updateLink}">
				                	 <span class="a-match"> ${tempTeam.name}</span>&nbsp; 
		                    	 </a>
		                     </div> 
							
							<div class="col-md-12 col-sm-12 col-xs-12">	
								<hr class="line-yellow"> 
							</div>					              
				            <c:forEach items="${teams}" var="other">				           
				                <c:if test="${tempTeam.grupete.name == other.grupete.name and tempTeam.name != other.name}">
					              	<c:url var="updateLink1" value="/team/Update">
										<c:param name="teamId" value="${other.id}" />
									</c:url>	
					                
					                <div class="col-md-12 col-sm-12 col-xs-12 col py-3 px-md-5">	
					             	     <button type="button" class="btn btn-outline-dark border-yellow" onclick="location.href='/worldcup/team/delete'" data-toggle="tooltip" data-placement="top" title="Delete Team">
					             	     <img height="25" width="25" src="<c:url value="/resources/img/garbage.jpg"/>" class="img-thumbnail"/>
					             	     </button>					         
					                     <img height="50" width="50" src="<c:url value="/resources/img/${other.flagPath}"/>" class="img-thumbnail"/>&nbsp; 
					                     <a href="${updateLink1}">
					                      	<span class="a-match"> ${other.name}</span>	&nbsp; 
					                  	 </a>
									</div>	
									
									 <div class="col-md-12 col-sm-12 col-xs-12">	
										 <hr class="line-yellow"> 
									 </div>
						       </c:if>
				            </c:forEach>
						</c:if>						  
				    </c:forEach>
				</div>	
			</div>
			<div class="footer">
	    	   <p class="text-center text-white lead">
					<a href="http://www.akarmel.ca" target="_blank" style="text-decoration:none;color:white !important;">			
						www.akarmel.ca
					</a>			
				</p>
	   		</div>
		
	</body>
</html>