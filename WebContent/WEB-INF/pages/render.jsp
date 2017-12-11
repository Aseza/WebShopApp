<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<c:set var="total" scope="session" value="0" />

<html>

<head>

<meta charset="UTF-8">
<title>Web Shop App</title>


<link rel='stylesheet prefetch'
	href='https://cdn.jsdelivr.net/foundation/5.0.2/css/foundation.css'>

<link href="<c:url value="/resources/css/style1.css" />"
	rel="stylesheet">


</head>

<body>
	<div class="row">
		<div class="large-12 columns">
			<div class="logo">
				<h1>Your Shopping Cart contains</h1>
			</div>

			<div class="row">

				<div class="large-12 columns productgalleries">
					<div class="row">

						<c:forEach items="${allItems}" var="current">
<%-- 							<c:if test="${current.total>0}">
 --%>								<div class="large-3 small-5 columns">
									<c:if test="${current.name=='Cucumber' }">
										<a> <img
											src="<c:url value="/resources/images/cucumber.jpg" />""></a>
									</c:if>
									<c:if test="${current.name=='Salami' }">
										<a> <img
											src="<c:url value="/resources/images/salami.jpg" />""></a>
									</c:if>
									<c:if test="${current.name=='Chestnut' }">
										<a> <img
											src="<c:url value="/resources/images/chestnut.jpg" />""></a>
									</c:if>
									<c:if test="${current.name=='Toy Car' }">
										<a> <img
											src="<c:url value="/resources/images/toy_car.jpg" />""></a>
									</c:if>
									<div class="panel">
										<h5>${current.numberOfPieces}X ${current.name}</h5>
										<h6 class="subheader">${current.total} HUF</h6>
										<p class="euro">
												<fmt:formatNumber currencySymbol="€" type="currency"
													value="${(current.total)/rate}" />
											</p>
									</div>
								</div>
<%-- 							</c:if>
 --%>							<c:set var="total" scope="session"
								value="${total+ current.total}" />
						</c:forEach>


					</div>
				</div>
			</div>
<br/><br/><br/>
			<div class="row">
				<div class="large-12 columns">
					<div class="panel">
						<div class="row">

							<div class="large-10 small-6 columns">
								<strong> Cart Details
									<hr />
								</strong>
								<c:choose>

									<c:when test="${discountMegaPackValue>discount2_3Value}">
										<h5>
											you will benefit from the MegaPack discount with a value of
											${discountMegaPackValue} HUF
											<p class="euro">
												<fmt:formatNumber type="currency" currencySymbol="€"
													value="${(discountMegaPackValue)/rate}" />
											</p>
										</h5>
										<h5>Original price is ${total} HUF</h5>
										<p class="euro">
												<fmt:formatNumber type="currency" currencySymbol="€"
													value="${(total)/rate}" />
											</p>

										<h5>
											Price after discount is ${total-discountMegaPackValue} HUF
											<p class="euro">
												<fmt:formatNumber currencySymbol="€" type="currency"
													value="${(total-discountMegaPackValue)/rate}" />
											</p>
										</h5>
									</c:when>

									<c:when test="${discountMegaPackValue<discount2_3Value}">
										<h5>
											you will benefit from the 2-3 discount with a value of
											${discount2_3Value } HUF
											<p class="euro">
												<fmt:formatNumber currencySymbol="€" type="currency"
													value="${(discount2_3Value)/rate}" />
											</p>
										</h5>
										<h5>Original price is ${total} HUF</h5>
										<p class="euro">
												<fmt:formatNumber type="currency" currencySymbol="€"
													value="${(total)/rate}" />
											</p>
										<h5>
											Price after discount is ${total-discount2_3Value} HUF
											<p class="euro">
												<fmt:formatNumber currencySymbol="€" type="currency"
													value="${(total-discount2_3Value)/rate}" />
											</p>
										</h5>

									</c:when>
									<c:otherwise>
										<h5>
											the discounts are the same, in this case the discount is:
											${discount2_3Value } HUF
											<p class="euro">
												<fmt:formatNumber currencySymbol="€" type="currency"
													value="${(discount2_3Value)/rate}" />
											</p>
										</h5>
										<h5>Original price is ${total} HUF</h5>
										<p class="euro">
												<fmt:formatNumber type="currency" currencySymbol="€"
													value="${(total)/rate}" />
										</p>

										<h5>
											Price after discount is ${total-discount2_3Value} HUF
											<p class="euro">
												<fmt:formatNumber currencySymbol="€" type="currency"
													value="${(total-discount2_3Value)/rate}" />
											</p>
										</h5>
									</c:otherwise>
								</c:choose>

						<div class="large-5 columns float-right ">
						      <input class="float-right" id="checkbox1" onchange="doalert(this)" type="checkbox"><label for="checkbox1"><h6>Conversion To Euro</h6></label>
  						</div>
							</div>
							
						
						</div>
						
					</div>
					
				</div>

			</div>
		</div>
	</div>


	<!-- Footer -->

	<footer class="row">
		<div class="large-12 columns">
			<hr />
			<div class="row">
				<div class="large-6 columns">
					<p>© Copyright 2017 Abdelilah OUCHANI</p>
				</div>
			</div>
		</div>
	</footer>

	<!-- End Footer -->

</body>
<script>
	var x = document.getElementsByClassName("euro");
	hideAllElements();
	function doalert(checkboxElem) {
		if (checkboxElem.checked) {
			showAllElements();
		} else {
			hideAllElements();
		}
	}
	function hideAllElements() {
		for (var i = 0; i < x.length; i++) {
			x[i].style.visibility = "hidden";
		}
	}
	function showAllElements() {
		for (var i = 0; i < x.length; i++) {
			x[i].style.visibility = "visible";
		}
	}
</script>
</html>