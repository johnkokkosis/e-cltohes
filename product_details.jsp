<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page errorPage="" %>
<%@ page import="eclothes_classes.*" %>
<%@ page import="java.util.List" %>

<%
    String prodId = request.getParameter("prodId");
    ProductDAO pdao = new ProductDAO();
    Product product = pdao.getProductByID(prodId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="header.jsp" %>
    <style>
        .row-content {
            display: flex;
            justify-content: space-evenly;
        }

        #product-img{
            max-width: 100%;
            max-height: 100%;
        }

        .gray-background{
            background-color: #eee;
            border-radius: 6px;
            padding: 15px;
        }
    </style>
</head>
<body>
<%@include file="navbar.jsp" %>
<div class="container">
    <div class="jumbotron" style="text-align: center">
        <h1>View Product Details for</h1>
        <h2><code><%=product.getBrand()%></code></h2>
    </div>
    <!-- Stack the columns on mobile by making one full-width and the other half-width -->
    <div class="row row-content" style="margin-top: 50px">
        <div class="col-xs-12 col-md-4">
            <div class="row">
                <img src="<%=product.getImageURL()%>" alt="" class="img-rounded" id="product-img">
            </div>
        </div>
        <div class="col-xs-6 col-md-8" style="margin-left: 20px">
            <div class="row">
                <div class="gray-background">
                    <h1><%=product.getBrand()%></h1>
                    <h2>Price: <%=product.getPrice()%></h2>
                    <p><%=product.getDescription()%></p>
                    <p>Availability: <%=product.getAvailability()%></p>
                    <a href="purchase_form.jsp?prodId=<%=product.getCode()%>" class="btn btn-lg btn-success">Buy Now</a>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="footer.jsp" %>
</body>
</html>