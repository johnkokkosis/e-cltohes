<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

    if ( session.getAttribute("authentication") == null ) {

        request.setAttribute("error_message", "You are not authorized to access this page!");
%>

<jsp:forward page="login.jsp" />

<%
        return;
    }

%>