<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:pageTemplate pageTitle="AddCar">
    <form class="mt-2 needs-validation" novalidate method="POST" action="${pageContext.request.contextPath}/AddCar">
        <div class="row g-3">
            <div class="col-12">
                <label for="licensePlate" class="form-label">License plate</label>
                <input type="text" name="license_plate" class="form-control" id="licensePlate" placeholder="" value=""
                       required>
                <div class="invalid-feedback">
                    License plate is required.
                </div>
            </div>

            <div class="col-12">
                <label for="parkingSpot" class="form-label">Parking Spot</label>
                <input type="text" name="parking_spot" class="form-control" id="parkingSpot" placeholder="" value=""
                       required>
                <div class="invalid-feedback">
                    Parking Spot is required.
                </div>
            </div>

            <div class="col-12">
                <label for="owner_id" class="form-label">Owner</label>
                <select class="form-select" id="owner_id" name="owner_id" required>
                    <option value="">Choose...</option>
                    <c:forEach var="user" items="${users}" varStatus="status">
                        <option value="${user.id}">${user.username}</option>
                    </c:forEach>
                </select>
                <div class="invalid-feedback">
                    Please select an owner.
                </div>
            </div>
        </div>

        <button class="mt-2 w-20 btn btn-primary btn-lg" type="submit">Save</button>
    </form>
</t:pageTemplate>
