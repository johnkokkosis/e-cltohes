<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage=""%>
<%@ page import="eclothes_classes.*"%>

<%
User user = (User)session.getAttribute("authentication");
%>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="index.jsp">E-clothes</a>
        </div>
        <ul class="nav navbar-nav">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="all_products.jsp">Products</a></li>
            <%if (user != null){%>
            <li><a href="all_purchases.jsp">My Purchases</a></li>
            <%}%>
            <li><a href="about.jsp">About Us</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <%if (user != null) {%>
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign in as <%=user.getUsername()%></a></li>
            <%} else {%>
            <li><a href="register.jsp"><span class="glyphicon glyphicon-user"></span> Sign up</a></li>
            <%}%>

            <%if (user != null){%>
            <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Log out</a></li>
            <%} else {%>
            <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Log in</a></li>
            <%}%>
        </ul>
    </div>
</nav>