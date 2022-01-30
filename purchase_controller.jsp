<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page errorPage="error_page.jsp" %>
<%@ page import="eclothes_classes.*" %>


<%
    String email = request.getParameter("email");
    String purchaseDate = request.getParameter("purchase-date");
    String cardNumber  = request.getParameter("card-number");
    String expDate = request.getParameter("exp-date");
    String cvv = request.getParameter("cvv");
    String cardType = request.getParameter("card-type");
    String productId = request.getParameter("product-id");
    int userId = 0;
    int prodId = 0;

    try {
        UserService us = new UserService();
        PurchaseDAO purchaseDAO = new PurchaseDAO();
        userId = us.getUserIdByEmail(email);
        prodId = Integer.parseInt(productId);

        Purchase purchase = new Purchase(
                purchaseDate,
                cardNumber,
                expDate,
                cvv,
                cardType,
                userId,
                prodId
        );


        purchaseDAO.createNewPurchase(purchase); // save user to db

        request.setAttribute("success_message_purchase", "Thanks for your trust! Your payment has been completed successfully!");

%>
<jsp:forward page="index.jsp"/>
<%
} catch (Exception e) {
    request.setAttribute("error_message_purchase", e.getMessage());
%>

<jsp:forward page="purchase_form.jsp"/>

<%
    }

%>