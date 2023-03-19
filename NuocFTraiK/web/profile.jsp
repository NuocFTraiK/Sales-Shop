<%-- 
    Document   : register.jsp
    Created on : Oct 15, 2022, 11:59:16 PM
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
        <title>Register</title>

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
        <link rel="stylesheet" href="css/listicon.css"/>
        <link rel="stylesheet" href="css/manager.css"/>
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


        <div class="breadcrumb_bg" style="overflow: hidden">
            <div class="breadcrumb-box-img">
                <img src="./images/login/bg_breadcrumb.png" alt="">
            </div>
            <div class="title-full">
                <div class="container">
                    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@600&display=swap" rel="stylesheet">
                    <p class="title-page">Profile</p>
                </div>
            </div>
        </div>
        <div class="cart_contain" style="display: flex">
        <div class="cart_submit" style="text-align:left ; margin-left: 11% ;">
            <button><a href="home">Back to home </a></button> 
        </div>
        <div class="cart_submit" style="text-align:right ; margin-left: 55%">
            <button><a href="changepass">Change password</a></button> 
        </div>
            
            </div>
        <c:set var="o" value="${sessionScope.profile}"/>
       <div class="login-main">
        <div class="login-container">
            <div class="login-title">
                <h3>Hello  ${o.customerName}</h3>
            </div>
            <div class="login-chu-y">
                <span><a href="history" style="color: violet">Xem lịch sử giao dịch tại đây.</a></span>
            </div>
            <div class="container-form">
                
                <form action="register" method="post" class="form-account" >
                  <div class="form-group">
                    <label for="">Họ và tên:</label>  ${o.customerName}
                   </div>
                  <div class="form-group">
                        <label for="">Email:</label>${o.email}
                    </div>
                    <div class="form-group">
                        <label for="">Số điện thoại</label>${o.phone}
                    </div>
                    <div class="form-group">
                      <label for="">Address:</label>${o.address}
                    </div>
                  </div>
                    <div class="group-btn" style="justify-content: center">
                        <button type="submit" class="btn-account"><a href="updateprofile">Update profile </a></button>
                    </div>
                </form>
        </div>
    </div>



        <!-- Footer -->
        <jsp:include page="footer.jsp"/>

    </body>
      <script>


            function openCart() {
                var open = document.getElementById("overlay_cart");
                var rgba = document.getElementById("mycart");
                rgba.style.width = "100%";
                open.style.width = "360px";
                open.style.transform = "none";
            }

            function closeCart() {
                var close = document.getElementById("overlay_cart");
                var rgba1 = document.getElementById("mycart");
                rgba1.style.width = "0px";
                close.style.transform = "translateX(100%)";
            }


        </script>
</html>