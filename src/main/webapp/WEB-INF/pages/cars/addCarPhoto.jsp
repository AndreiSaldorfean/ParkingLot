<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:pageTemplate pageTitle="AddCarPhoto">
  <form class="mt-2 needs-validation" novalidate enctype="multipart/form-data" method="POST" action="${pageContext.request.contextPath}/AddCarPhoto">
    <div class="row">
      <div class="col">
          <div class="col">
            <label>License plate: ${car.licensePlate}</label>
          </div>
      </div>
    </div>

    <div class="row">
      <div class="col">
        <label for="file">Photo</label>
        <input type="file" name="file" id="file" required>
        <div class="invalid-feedback">
          Photo is required
        </div>
      </div>
    </div>

    <input type="hidden" name="car_id" value="${car.id}"/>
    <hr class="mb-4">
    <button class="btn btn-primary btn-lg btn-block" type="submit">Save</button>
  </form>
</t:pageTemplate>
