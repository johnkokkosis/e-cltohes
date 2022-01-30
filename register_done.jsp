<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage=""%>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="header.jsp"%>
</head>
    <body>
    <%@include file="navbar.jsp"%>

        <div class="container">
            <div class="jumbotron text-center">
                <h1>Welcome to E-clothes</h1>
                <p>The best destination for sports clothing</p>
                <p>Our passion is to equip top athletes with the most high quality sports clothes. Check our collection of products and see what suits your interests!</p>
            </div>

            <%if (reguest.getAttribute("success_message") != null && request.getAttribute("userObj") != null){%>

            <div class="alert alert-success">
                <p><%=(String)request.getAttribute("success_message") %></p>
                <p>Please click here to log in</p>
            </div>
            <%}%>
        </div>
    <%@ include file="footer.jsp"%>
    </body>
</html>