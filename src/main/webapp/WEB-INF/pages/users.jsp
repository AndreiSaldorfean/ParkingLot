<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:pageTemplate pageTitle="Users">
    <h1>Users</h1>
    <c:if test="${pageContext.request.isUserInRole('WRITE_USERS')}">
        <a href="${pageContext.request.contextPath}/AddUser">
            <button class="w-20 btn btn-primary btn-lg" type="submit">Add User</button>
        </a>
    </c:if>
    <form action="${pageContext.request.contextPath}/Users" method="POST">
        <button class="w-20 btn btn-md mt-2" type="submit">Invoice</button>
        <div class="container text-center">
            <c:forEach var="user" items="${users}">
                <div class="row">
                    <div class="col">
                        ${user.username}
                    </div>
                    <div class="col">
                        ${user.email}
                    </div>
                    <div class="col">
                        <input type="checkbox" name="user_ids" value="${user.id}"/>
                    </div>
                </div>
            </c:forEach>
        </div>
    </form>
    <c:if test="${not empty invoices}">
        <h2>Invoices</h2>
        <c:forEach var="username" items="${invoices}" varStatus="status">
            ${status.index+1}.${username}
            <br/>
        </c:forEach>
    </c:if>
</t:pageTemplate>