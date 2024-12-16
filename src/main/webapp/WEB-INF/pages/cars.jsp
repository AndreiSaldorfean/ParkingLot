<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:pageTemplate pageTitle="Cars">
    <h1>Cars</h1>
    <c:if test="${pageContext.request.isUserInRole('WRITE_CARS')}">
    <a href="${pageContext.request.contextPath}/AddCar">
        <button class="w-20 btn btn-primary btn-lg" type="submit">Add Car</button>
    </a>
    </c:if>
    <form method="POST" action="${pageContext.request.contextPath}/Cars">
    <div class="container text-center">
        <c:forEach var="car" items="${cars}">
            <div class="row">
                <div class="col">
                        ${car.licensePlate}
                </div>
                <div class="col">
                        ${car.parkingSpot}
                </div>
                <div class="col">
                        ${car.ownerName}
                </div>
            </div>
            <c:if test="${pageContext.request.isUserInRole('WRITE_CARS')}">
                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/EditCar?id=${car.id}">Edit Car</a>
            </c:if>
            <div class="col">
                <c:if test="${pageContext.request.isUserInRole('WRITE_CARS')}">
                    <input type="checkbox" name="car_ids" value="${car.id}"/>
                </c:if>
            </div>
        </c:forEach>
        <c:if test="${pageContext.request.isUserInRole('WRITE_CARS')}">
            <button class="btn btn-danger" type="submit">Delete Car</button>
        </c:if>
    </div>
    </form>
    <h5>Free parking spots: ${numberOfFreeParkingSpots}</h5>
</t:pageTemplate>