<%-- 
    Document   : login.jsp
    Created on : Oct 15, 2022, 11:59:04 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>

     <!-- Icon -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
  integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
  crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
<!-- CSS -->
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/account.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/listproduct.css">
 <link rel="stylesheet" href="css/listicon.css"/>

<!-- JS -->
<script src="/js/app.js"></script>
</head>
<body>
    
    
        <!--NavBar -->
        <jsp:include page="navigation.jsp"/>

      <!-- End Nav -->
 <!--List_Icon -->
         <jsp:include page="list_icon.jsp"/>
      <!-- Form Login -->

    <div class="breadcrumb_bg">
        <div class="breadcrumb-box-img">
            <img src="./images/login/bg_breadcrumb.png" alt="">
        </div>
        <div class="title-full">
            <div class="container">
                <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@600&display=swap" rel="stylesheet">
                <p class="title-page">Tài khoản</p>
            </div>
        </div>
    </div>
    <div class="login-main">
        <div class="login-container">
            <div class="login-title">
                <h3>Đăng nhập</h3>
                <div style="color: red;text-align:center;">${requestScope.msg}</div> 
            </div>
            <div class="login-chu-y">
                <span>Nếu bạn đã có tài khoản, đăng nhập tại đây.</span>
            </div>
            <div class="container-form">
                  <c:set var="cookie" value="${pageContext.request.cookies}"/>
                <form action="login" method="post" class="form-account" >
                    <div class="form-group">
                        <label for="">Tên đăng nhập</label>
                        <input value="${cookie.cuser.value}" require name="user" type="text" placeholder="Tên đăng nhập">
                    </div>
                    <div class="form-group">
                        <label for="">Mật khẩu:</label>
                        <input value="${cookie.cpass.value}" require type="password" name="pass" placeholder="Mật khẩu">
                    </div>
                    <div class="form-group">
                        <label for="">Remember me</label>
                        <input  type="checkbox" ${(cookie.crem != null?'checked':'')} name="rem" value="ON">
                    </div>
                    <div class="group-btn">
                        <button type="submit" class="btn-account">Đăng nhập</button>
                        <a href="register.jsp" class="tag-a">Đăng ký</a>
                    </div>
                </form>
            </div>
        </div>
    </div>


<!-- Footer -->
<jsp:include page="footer.jsp"/>

</body>
</html>
