<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="eclothes_classes.*" %>
<%@ page errorPage="" %>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");

UserService userService = new UserService();

try {
    User user = userService.authenticate(username, password);
    session.setAttribute("authentication", user);
%>
<jsp:forward page="index.jsp"/>
<%} catch (Exception e) {
    request.setAttribute("error_message", "Wrong username or password. Please try again.");
%>
<jsp:forward page="login.jsp"/>
<%}%>