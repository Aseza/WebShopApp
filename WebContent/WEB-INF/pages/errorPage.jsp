<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
  <head>
  <link href="<c:url value="/resources/css/error.css" />"
	rel="stylesheet">
    <title>Error</title>
  </head>
  <body>
    <div id="container">
      <div id="error">
        <h1 class="desc">Error 404!</h1>
        <h1 class="sub_desc">Reponse from server was null, check your internet connection !</h1>
      </div>
    </div>
  </body>
</html>