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
        <c:if test="${pageContext.request.isUserInRole('INVOICING')}">
            <button class="w-20 btn btn-md mt-2" type="submit">Invoice</button>
        </c:if>
        <div class="container text-center">
            <c:forEach var="user" items="${users}">
                <div class="row">
                    <div class="col">
                        ${user.username}
                    </div>
                    <div class="col">
                        ${user.email}
                    </div>
                    <c:if test="${pageContext.request.isUserInRole('INVOICING')}">
                        <div class="col">
                            <input type="checkbox" name="user_ids" value="${user.id}"/>
                        </div>
                    </c:if>
                    <c:if test="${pageContext.request.isUserInRole('WRITE_USERS')}">
                        <div class="col">
                            <a class="btn btn-secondary" href="${pageContext.request.contextPath}/EditUser?id=${user.id}">Edit User</a>
                        </div>
                    </c:if>
                </div>
            </c:forEach>
        </div>
    </form>
    <c:if test="${pageContext.request.isUserInRole('INVOICING')}">
        <c:if test="${not empty invoices}">
            <h2>Invoices</h2>
            <c:forEach var="username" items="${invoices}" varStatus="status">
                ${status.index+1}.${username}
                <br/>
            </c:forEach>
        </c:if>
    </c:if>
</t:pageTemplate>