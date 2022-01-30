<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage=""%>
<%@ page import="eclothes_classes.*" %>
<%@ page import="java.util.List" %>

<%
ProductDAO pdao = new ProductDAO();
List<Product> products = pdao.getProducts();
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <%@ include file="header.jsp"%>
        <style>
            .card {
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
                max-width: 300px;
                text-align: center;
                font-family: arial, sans-serif;
            }

            .price {
                color: grey;
                font-size: 22px;
            }

            .card .button-card{
                border: none;
                outline: 0;
                padding: 12px;
                color: white;
                background-color: #393838;
                text-align: center;
                cursor: pointer;
                width: 100%;
                font-size: 18px;
            }

            .card button:hover {
                opacity: 0.7;
            }

            .container-1{
                display: flex;
                justify-content: space-around;
            }
        </style>
    </head>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="container">
            <div class="container-1">
                <%for (Product product:products) {%>
                    <div class="row">
                        <div class="card">
                            <img src="<%=product.getImageURL()%>" alt="Denim Jeans" style="width:100%">
                            <h1><%=product.getBrand()%></h1>
                            <p class="price"><%=product.getPrice()%></p>
                            <p><%=product.getDescription()%></p>
                            <a href="purchase_form.jsp?prodId=<%=product.getCode()%>" class="btn btn-info" style="margin-bottom: 10px">Buy Now</a>
                            <a href="product_details.jsp?prodId=<%=product.getCode()%>" class="btn btn-success" style="margin-bottom: 10px"> Details </a>
                        </div>
                    </div>
                <%}%>
            </div>
        </div>
        <%@ include file="footer.jsp"%>
    </body>
</html>