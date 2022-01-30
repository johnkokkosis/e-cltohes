<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage=""%>

<!DOCTYPE html>
<html lang="en">
<head>

    <%@ include file="header.jsp" %>

    <meta name="description" content="Lesson6 - example">
    <meta name="author" content="sofos@aueb.gr">
    <title>Lesson6 - login page</title>

    <!-- Adding some custom style to page -->
    <style>
        .form-signin {
            max-width: 330px;
            padding: 15px;
            margin: 0 auto;
        }
        .form-signin .form-signin-heading,
        .form-signin .checkbox {
            margin-bottom: 10px;
        }
        .form-signin .form-control {
            position: relative;
            height: auto;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            padding: 10px;
            font-size: 16px;
        }
        .form-signin .form-control:focus {
            z-index: 2;
        }
        .form-signin input[type="text"] {
            margin-bottom: 10px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;

        }
        .form-signin input[type="password"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }
    </style>

</head>
    <%@ include file="navbar.jsp"%>
    <body>
        <div class="container theme-showcase" role="main">
            <%if (request.getAttribute("success_message") != null){%>
            <div class="alert alert-success" style="text-align: center">
                <%= (String)request.getAttribute("success_message")%>
            </div>
            <%}%>
            <%if (request.getAttribute("error_message") != null){%>
            <div class="alert alert-danger" style="text-align: center">
                <%= (String)request.getAttribute("error_message")%>
            </div>
            <%}%>
            <div class="row">
                <div class="col-xs-12">
                    <form class="form-signin" method="POST" action="login_controller.jsp">
                        <h2 class="form-signin-heading text-center">Please sign in</h2>
                        <label for="inputusername" class="sr-only">Username</label>
                        <input type="text" name="username" id="inputusername" class="form-control" placeholder="username" required>
                        <label for="inputpassword" class="sr-only">Password</label>
                        <input name="password" type="password" id="inputpassword" class="form-control" placeholder="password" required>
                        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
                    </form>
                </div>
            </div>
        </div>
        <!-- /container -->
    <%@include file="footer.jsp"%>
    </body>
</html>