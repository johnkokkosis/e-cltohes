<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage=""%>
<%@ page import="eclothes_classes.*" %>
<%@ page import="java.util.List" %>

<%@include file="check_authentication.jsp"%>


<!DOCTYPE html>
<html lang="en">
    <head>
    <%@ include file="header.jsp"%>
    </head>
    <body>
        <%@include file="navbar.jsp"%>

        <%
            PurchaseDAO purchaseDAO = new PurchaseDAO();
            UserService userService = new UserService();
            int userId = userService.getUserIdByEmail(user.getEmail());
            List<Purchase> purchases = purchaseDAO.getAllUserPurchases(userId);
        %>
        <div class="container">
            <%if (purchases.size() == 0){%>
            <div class="jumbotron" style="text-align: center">
                <h2>You have not purchased any products yet...</h2>
            </div>
            <%}else{%>
            <div class="jumbotron" style="text-align: center">
                <h2>You have purchased <code><%=purchases.size()%></code><%if (purchases.size() > 1){%> products <%}else {%> product <%}%></h2>
                <h3>Here are all your purchases</h3>
            </div>
            <%}%>

            <div class="table-responsive">

                <table class="table table-bordered table-condensed table-hover">
                    <tr class="info">
                        <th>Pur. Date</th>
                        <th>Card Num.</th>
                        <th>Expiration Date</th>
                        <th>Card CVV</th>
                        <th>Card Type</th>
                        <th>Pur For Prod.</th>
                    </tr>
                    <%for (Purchase purchase: purchases){%>
                    <tr>
                        <td><%=purchase.getPurchaseDate()%></td>
                        <td><%=purchase.getCardNumber()%></td>
                        <td><%=purchase.getExpDate()%></td>
                        <td><%=purchase.getCvv()%></td>
                        <td><%=purchase.getCardType()%></td>
                        <td><%=purchase.getPurchaseFroProductId()%></td>
                    </tr>
                    <%}%>
                </table>
            </div>
        </div>
    <%@include file="footer.jsp"%>
    </body>
</html>