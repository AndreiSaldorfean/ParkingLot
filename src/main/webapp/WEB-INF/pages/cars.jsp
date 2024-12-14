<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:pageTemplate pageTitle="Cars">
    <h1>Cars</h1>
    <a href="${pageContext.request.contextPath}/AddCar">
        <button class="w-20 btn btn-primary btn-lg" type="submit">Add Car</button>
    </a>
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
            <a class="btn btn-secondary" href="${pageContext.request.contextPath}/EditCar?id=${car.id}">Edit Car</a>
            <div class="col">
                <input type="checkbox" name="car_ids" value="${car.id}"/>
            </div>
        </c:forEach>
        <button class="btn btn-danger" type="submit">Delete Car</button>
    </div>
    </form>
    <h5>Free parking spots: ${numberOfFreeParkingSpots}</h5>
</t:pageTemplate>