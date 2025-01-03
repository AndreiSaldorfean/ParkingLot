<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:pageTemplate pageTitle="EditUser">
    <form class="mt-2 needs-validation" novalidate method="POST" action="${pageContext.request.contextPath}/EditUser">
        <div class="row g-3">
            <div class="col-12">
                <label for="username" class="form-label">Username</label>
                <input type="text" name="username" class="form-control" id="username" placeholder="" value="${user.username}"
                       required>
                <div class="invalid-feedback">
                    Username is required.
                </div>
            </div>

            <div class="col-12">
                <label for="email" class="form-label">Email</label>
                <input type="text" name="email" class="form-control" id="email" placeholder="" value="${user.email}"
                       required>
                <div class="invalid-feedback">
                    Email is required.
                </div>
            </div>
            <div class="col-12">
                <label for="password" class="form-label">Password</label>
                <input type="password" name="password" class="form-control" id="password" placeholder="" value="">
            </div>

        </div>
        <input type="hidden" name="user_id" value="${user.id}"/>
        <button class="mt-2 w-20 btn btn-primary btn-lg" type="submit">Save</button>
    </form>
</t:pageTemplate>
