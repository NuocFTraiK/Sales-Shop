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

        <link rel="stylesheet" href="css/footer.css">
        <link rel="stylesheet" href="css/listproduct.css">
        <link rel="stylesheet" href="css/listicon.css"/>
        <link rel="stylesheet" href="css/checkout.css"/>

        <style>
            link {
                display: none;
            }
            a {
                text-decoration: none!important;
            }
            .breadcrumb_bg {
                margin-bottom: 40px;
                width: 100%;
                position: relative;
            }
            .breadcrumb-box-img img {
                width: 100%;
                height: 160px;
                object-fit: cover;
            }

            .title-full {
                text-align: center;
                position: absolute;
                width: 100%;
                height: 100%;
                top: 55px;
                display: flex;
                justify-content: center !important;
            }

            .title-full .title-page {
                font-weight: 700 !important;
                font-size: 36px;
                line-height: 50px;
                font-family: "Quicksand", sans-serif;
                color: #000;
                margin: 0;
            }
        </style>
    </head>
    <body>


            <!--NavBar -->
       <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="row">
            <div class="navbar-header col-md-2">
                <a class="navbar-brand" href="home">Restaurant</a>
            </div>
            <!-- Navigation -->
            <div class="nav navbar-nav col-md-8">
                <ul>
                    
                    <c:if test="${sessionScope.account != null}">
                        <li style="text-transform: uppercase;"><a class="navactive color_animation" href="#">WELCOME ${sessionScope.account.user}</a></li>
                    </c:if>
                    <c:if test="${sessionScope.account == null}">
                        <li><a class="navactive color_animation" href="#">WELCOME</a></li>
                    </c:if>
                    
                    <c:if test="${sessionScope.account.role == 1}">
                        <li><a class="color_animation" href="manager">MANAGER</a></li>
                    </c:if>
                   
                    <li><a class="color_animation" href="checkbox">PRODUCT</a></li>
                    <li><a class="color_animation" href="#">BLOG</a></li>
                    <li><a class="color_animation" href="#">CONTACT</a></li>
                </ul>
            </div>
            <!-- Search,Login,Cart -->
            <div class="col-md-2">
                <div class="cart-group">
                    <form action="search" method="get">
                        <div class="search-icon cart-group-item">
                            <i class="fa-solid fa-magnifying-glass"></i>
                            <div class="search-mini">
                                <input  value="${requestScope.save}" name="txt" type="text" placeholder="Search..." class="button_gradient input-header" />
                                <button type="submit" class="btn-search-mini">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                    <div class="user-icon cart-group-item">
                        <i class="fa-solid fa-user-plus"></i>
                        <div class="user-group">
                            <c:if test="${sessionScope.account != null}">
                                <button class="button_gradient" id="button_circle" style="width: 100%">
                                    <a href="logout">Logout</a>
                                </button>
                                <button class="button_gradient" id="button_circle" style="width: 100%">
                                <a href="profile.jsp">Profile User</a>
                            </button>
                            </c:if>
                            <c:if test="${sessionScope.account == null}">
                                <button class="button_gradient" id="button_circle" style="width: 100%">
                                    <a href="login">Login</a>
                                </button>
                                <button class="button_gradient" id="button_circle" style="width: 100%">
                                <a href="register.jsp">Register</a>
                                </button>
                            </c:if>
                            
                        </div>
                    </div>
                    <div class="cart-icon cart-group-item">
                        <a href="cart"><button style="background: transparent; border: none" onclick="openCart()">
                            <i class="fa-solid fa-basket-shopping"></i>
                        </button></a>
                        <!--======================== Cart======================== -->
                        <div class="overlay" id="mycart">
                            <div class="cart" id="overlay_cart">
                                <div class="cart-contain">
                                    <div class="cart-title">
                                        <p>Cart</p>
                                        <button style="background: transparent; border: none" onclick="closeCart()">
                                            <i class="fa-solid fa-x"></i>
                                        </button>
                                    </div>

                                    <ul class="cart-list"></ul>

                                    <div class="cart-footer">
                                        <div class="cart__sub-total cart__total-price">
                                            <p>Sub total:</p>
                                            <span>$0</span>
                                        </div>
                                        <div class="cart__total cart__total-price">
                                            <p>Total:</p>
                                            <span>$0</span>
                                        </div>

                                        <div class="btn-cart__contain">
                                            <a href="cart" class="btn-cart btn--view">
                                                <i class="fa-solid fa-cart-shopping"></i>
                                                VIEW CART
                                            </a>
                                            <a href="#" class="btn-cart btn--checkout">
                                                <i class="fa-solid fa-arrow-right-to-bracket"></i>
                                                CHECKOUT
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Cart -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</nav>
<div style="height: 85px"></div>
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
                    <p class="title-page">Lịch sử giao dịch - NuocFTraiK</p>
                </div>
            </div>
        </div>
        <c:forEach items="${requestScope.listO}" var="o"> 
      <div class="order-success">
    <div class="grid wide">
        <div class="row">
            <div class="order-success2col l-7">
                <div class="order-heading">
                    <h2 class="order-head-title flex">
                        Đặt hàng thành công
                        <div class="icon-check">
                            <i class="fa-solid fa-check"></i>
                        </div>
                    </h2>
                    <span class="ma-don-hang">Mã đơn hàng #${o.id}</span>
<!--                    <span class="order-thank-you">Cảm ơn bạn đã mua hàng</span>-->
                </div>
                <div class="infor-order">
                    <h3>Thông tin giao hàng</h3>
                    <div class="content-main">
                        <div class="form-group flex">
                            <span>Mã khách hàng:</span>
                            <span>${o.cusid}</span>
                        </div>
                        
                        <div class="form-group flex">
                            <span>Ngày đặt hàng:</span>
                            <span>${o.date}</span>
                        </div>
                        <div class="form-group flex">
                            <span>Tổng tiền:</span>
                            <span>${o.totalmoney}</span>
                        </div>
                    </div>
                </div>
            </div>
           
        </div>
    </div>
</div>
                        </c:forEach>



            <!-- Footer -->
            <jsp:include page="footer.jsp"/>

    </body>
</html>
