<%--
  Created by IntelliJ IDEA.
  User: Abdelilah
  Date: 12/8/17
  Time: 01:00
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
    <head> 
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<!-- Website CSS style -->
		<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
		<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">

		<!-- Google Fonts -->
		<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>

		<title>Main Page</title>
	</head>
	<body>
		<div class="container">
			<div class="row main">
				<div class="panel-heading main-center">
	               <div class="panel-title text-center">
	               		<h1 class="title">Web Shop App</h1>
	                       
	            </div> 
				<div class="main-login main-center">
					<form class="form-horizontal" method="post" action="render">
			
 						<c:forEach items="${itemList}" var="current">
 						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label"><c:out value="${current}"/></label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon">Quantity</span>
									<input min="0"  type="number" class="form-control" value="0" name="${current}"  placeholder="Enter the Quantity"/>
								</div>
							</div>
						</div>
        				</c:forEach>
   
						<div class="form-group ">
							<button type="submit" class="btn btn-primary btn-lg btn-block login-button">Checkout</button>
						</div>
					</form>
				</div>
					               	</div>
				
			</div>
		</div>

	<script src="<c:url value="/resources/js/bootstrap.min.js" />" ></script>
	<script src="<c:url value="/resources/js/code.js" />" ></script>
	
	</body>
</html>