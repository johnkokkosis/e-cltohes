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
            <p style="color: #d58512">
                <strong>Please fill in the following form in order to register</strong>
            </p>
        </div>

        <%if (request.getAttribute("error_message") != null){%>
        <div class="alert alert-danger">
            <p><strong>Oops something went wrong!</strong> Registration form has errors</p>
            <ul>
                <%=(String)request.getAttribute("error_message") %>
            </ul>
        </div>
        <%} else {%>

            <div class="alert alert-info" style="text-align: center">
                <strong style="font-size: large">
                    Already have an account?
                </strong>
                <p style="font-size: large">
                    Please click  the link below in order to log-in
                </p>
                <p style="font-size: large">
                    <a href="login.jsp">Log-in</a>
                </p>
            </div>
        <%}%>

        <form class="form-horizontal" method="POST" action="register_controller.jsp">
            <div class="form-group">
                <label class="control-label col-sm-2" for="firstname">First Name:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="firstname" name="firstname" placeholder="Your first name...">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="lastname">Last Name:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Your last name...">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="username">Username:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="username" name="username" placeholder="Type your username...">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="email">Email:</label>
                <div class="col-sm-10">
                    <input type="email" class="form-control" id="email" name="email" placeholder="Your email...">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="password">Password:</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="password" name="password" placeholder="Your password...">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="confirm">Confirm password:</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="confirm" name="confirm" placeholder="Retype the password above...">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <div class="checkbox">
                        <label><input type="checkbox" name="consents"> I agree to terms & conditions of E-clothes</label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-success">Submit</button>
                    <button type="reset" class="btn btn-danger">Clear All</button>
                </div>
            </div>
        </form>
    </div>
</body>
