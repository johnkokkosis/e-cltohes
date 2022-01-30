<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page errorPage="" %>
<%@ page import="eclothes_classes.*" %>

<%

    if (session.getAttribute("authentication") == null) {

        request.setAttribute("error_message", "Oops! You are not logged in. In order to purchase a product you have to log in first!");
%>

<jsp:forward page="login.jsp"/>

<%
        return;
    }

%>

<%
    String productId = request.getParameter("prodId");
    ProductDAO pdao = new ProductDAO();
    Product product = pdao.getProductByID(productId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="header.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>

<div class="container">
    <%if (request.getAttribute("error_message_purchase") != null){%>
        <div class="alert alert-danger" style="text-align: center">
            <%= (String)request.getAttribute("error_message_purchase")%>
        </div>
    <%}%>

    <div class="jumbotron" style="text-align: center">
        <h2>Please fill in the form with your credit card info to complete the purchase for</h2>
        <h2><code><%=product.getBrand()%>
        </code></h2>
    </div>

    <form class="form-horizontal" method="POST" action="purchase_controller.jsp">
        <div class="form-group">
            <label class="control-label col-sm-2" for="firstname">First Name:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="firstname" name="firstname" value="<%=user.getFirstname()%>">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="lastname">Last Name:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="lastname" name="lastname" value="<%=user.getLastname()%>">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="email">Email:</label>
            <div class="col-sm-10">
                <input type="email" class="form-control" id="email" name="email" value="<%=user.getEmail()%>">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="purchase-date">Date of the purchase:</label>
            <div class="col-sm-10">
                <input type="date" class="form-control" id="purchase-date" name="purchase-date">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="card-number">Card Number:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="card-number" name="card-number"
                       placeholder="Your card number...">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="exp-date">Expiration Date:</label>
            <div class="col-sm-10">
                <input type="date" class="form-control" id="exp-date" name="exp-date">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="cvv">Security Code (CVV):</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" id="cvv" name="cvv" placeholder="Your card's security code">
            </div>
        </div>
        <div class="form-group">
            <label for="card-type" class="control-label col-sm-2">Card Type:</label>
            <div class="col-sm-10">
                <select id="card-type" name="card-type" class="form-control">
                    <option value="Master Card">Master Card</option>
                    <option value="Visa">Visa</option>
                    <option value="American Express" selected>American Express</option>
                    <option value="Paypal">Paypal</option>
                    <option value="Revolut">Revolut</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="product-id">Product ID:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="product-id" name="product-id" value="<%=product.getCode()%>">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="product-name">Product Name:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="product-name" name="product-name" value="<%=product.getBrand()%>">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="product-price">Product Price:</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="product-price" name="product-price" value="<%=product.getPrice()%> €">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-success">Submit</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>