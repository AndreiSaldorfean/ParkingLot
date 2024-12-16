<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:pageTemplate pageTitle="AddUser">
    <form class="mt-2 needs-validation" novalidate method="POST" action="${pageContext.request.contextPath}/AddUser">
        <div class="row g-3">
            <div class="col-12">
                <label for="username" class="form-label">Username</label>
                <input type="text" name="username" class="form-control" id="username"
                       placeholder="Username" value="" required>
                <div class="invalid-feedback">
                    Username is required.
                </div>
            </div>
            <div class="col-12">
                <label for="email" class="form-label">Email</label>
                <input type="text" name="email" class="form-control" id="email"
                       placeholder="Email" value="" required>
                <div class="invalid-feedback">
                    Email is required.
                </div>
            </div>

            <div class="col-12">
                <label for="password" class="form-label">Password</label>
                <input type="password" name="password" class="form-control" id="password"
                       placeholder="Password" value="" required>
                <div class="invalid-feedback">
                    Password is required.
                </div>
            </div>

            <div class="col-12">
                <label for="groups" class="form-label">Groups</label>
                <select class="custom-select d-block w-100" id="groups" name="user_groups" multiple>
                    <option value="">Choose...</option>
                    <c:forEach var="user_group" items="${userGroups}" varStatus="status">
                        <option value="${user_group}">${user_group}</option>
                    </c:forEach>
                </select>
                <div class="invalid-feedback">
                    Please select an owner.
                </div>
            </div>
        </div>
        <hr class="mb-4">
        <button class="mt-2 w-20 btn btn-primary btn-lg" type="submit">Save</button>
    </form>
</t:pageTemplate>
