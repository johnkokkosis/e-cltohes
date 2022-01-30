<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage=""%>
<%@ page import="eclothes_classes.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="header.jsp"%>
</head>
<body>
    <%@include file="navbar.jsp"%>

    <%
        if (request.getAttribute("success_message") != null){
    %>

    <div class="alert alert-success" style="text-align: center">
        <p style="font-size: large">
            <strong><%=(String)request.getAttribute("success_message")%></strong>
        </p>
    </div>

    <%}%>

    <%
        if (request.getAttribute("success_message_purchase") != null){
    %>

    <div class="alert alert-success" style="text-align: center">
        <p style="font-size: large">
            <strong><%=(String)request.getAttribute("success_message_purchase")%></strong>
        </p>
    </div>

    <%}%>

    <div class="container">
        <div class="jumbotron text-center">
            <h1>Welcome to E-clothes</h1>
            <p>The best destination for sports clothing</p>
            <p>Our passion is to equip top athletes with the most high quality sports clothes. Check our collection of products and see what suits your interests!</p>

            <a href="all_products.jsp" class="btn btn-success btn-lg text-center" role="button">See all products</a>
        </div>


        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <div class="item active">
                    <img src="images/nike.jpg" alt="Nike">
                </div>

                <div class="item">
                    <img src="images/adidas.jpg" alt="Adidas">
                </div>

                <div class="item">
                    <img src="images/air-jordarn.jpg" alt="Nike Air Jordan">
                </div>
            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>

    <%@include file="footer.jsp"%>
</body>
</html>