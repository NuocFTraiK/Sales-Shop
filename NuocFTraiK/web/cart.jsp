<%-- 
    Document   : detail
    Created on : Oct 16, 2022, 1:19:00 PM
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
        <title>Detail Product</title>

        <!-- Icon -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
              integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
        <!-- CSS -->
        <link rel="stylesheet" href="css/style_header_cart.css" />
        <link rel="stylesheet" href="css/footer.css">
        <link rel="stylesheet" href="css/cart.css">
        <link rel="stylesheet" href="css/listicon.css"/>
        <link rel="stylesheet" href="css/listproduct.css"/>


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
                                <button style="background: transparent; border: none">
                                    <i class="fa-solid fa-basket-shopping"></i>
                                </button>
                                <!--======================== Cart======================== -->
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
        <!-- Breadcrumb -->

        <div class="breadcrumb_bg">
            <div class="breadcrumb-box-img">
                <img src="./images/login/bg_breadcrumb.png" alt="">
            </div>
            <div class="title-full">
                <div class="container">
                    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@600&display=swap" rel="stylesheet">
                    <p class="title-page">Giỏ hàng của bạn - NuocFTraiK</p>
                </div>
            </div>
        </div>

        <div class="cart">
            <div class="grid wide">
                <div class="cart-title">
                   
                    <h3>Giỏ hàng của bạn (${requestScope.cart.countListItems()} sản phẩm)</h3>

                </div>
<!--                <form action="" method="post">-->
                    <div class="cart-main">
                        <c:set var="o" value="${requestScope.cart}"/>
                        <c:forEach items="${o.items}" var="i">
                            <div class="cart-item">
                                <div class="cart-item-left">
                                    <div class="cart-img">
                                        <img src="${i.product.image}" alt="">
                                    </div>
                                    <div class="cart-name-price">
                                        <div class="cart-name">
                                            <span>${i.product.name}</span>
                                        </div>
                                        <div class="cart-price" style="margin-top:10px;">
                                            <h3>${i.product.price}đ</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="cart-item-right">
                                    <div class="quantity-product">
                                        <div class="box-quantity-product">
                                            <a href="process?num=-1&id=${i.product.id}"><input type="button" value="-" class="tru"></a>
                                            <input type="number" name="'.$item['product_id'].'" id="" class="value-quantity" value="${i.quantity}">
                                            <a href="process?num=1&id=${i.product.id}"><input type="button" value="+" class="cong"></a>
                                        </div>
                                    </div>
                                    <div class="total-item">
                                        <div class="total-title" style="text-align:end;">
                                            <span>Tổng tiền:</span>
                                        </div>
                                        <div class="total-item-main">
                                            <h3 style="text-align:end;">${(i.price*i.quantity/2)}đ</h3>
                                        </div>
                                        <div class="cart-item-delete">
                                            <a href="process?num=0&id=${i.product.id}" class="tag-a">
                                                <i class="fa-solid fa-trash"></i>
                                                Xóa
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
<!--                        <div class="cart-update">
                            <button type="submit">Cập nhật</button>
                        </div>-->
                        <div class="cart-footer-box">
                            <div class="cart-footer">
                                <div class="total-main">
                                    <span>Thành tiền: </span>
                                    <h1>${o.totalMoney/2}đ</h1>
                                </div>
                                <div class="cart-footer-main">
                                    <div class="continue-buy">
                                        <a href="home" class="tag-a">
                                            Tiếp tục mua hàng
                                        </a>
                                    </div>
                                    <div class="dat-hang button_gradient">
                                        <a href="checkout" class="tag-a">
                                            Đặt hàng ngay
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <!--</form>-->
            </div>
        </div>
        <div class="cart-empty-main">
            <div class="grid wide">
                <div class="box-img-cart-empty">
                    <img src="./images/login/cart-empty.png" alt="">
                </div>
                <div class="cart-empty-main-title">
                    <span>GIỎ HÀNG TRỐNG</span>
                </div>
                <a href="home" class="tag-a">
                    <div class="continue_view" style="width:200px;margin-top:40px; margin-left:15px;">
                        <i class="fas fa-long-arrow-alt-left"></i>
                        <span>QUAY LẠI CỬA HÀNG</span>
                    </div>
                </a>
            </div>
        </div>          


        <!-- Footer -->
        <jsp:include page="footer.jsp"/>
        <script>
        const $1 = document.querySelector.bind(document);
        const $2 = document.querySelectorAll.bind(document);
        for (let i = 0; i < $2('.cong').length; i++) {
            let a1 = $2('.value-quantity')[i].value;
            a1 = parseInt(a1);
            $2('.cong')[i].onclick = function () {
                a1 = a1 + 1;
                $2('.value-quantity')[i].value = a1;
                console.log($1('.cart-update button'));
                $1('.cart-update button').style.backgroundColor = '#b9b9b9';
            };
            $2('.tru')[i].onclick = function () {
                if (a1 < 2) {
                    return;
                } else {
                    a1 = a1 - 1;
                    $2('.value-quantity')[i].value = a1;
                    $1('.cart-update button').style.backgroundColor = '#b9b9b9';
                }
            };
        }
        const cart_list = $2('.cart-item');
        if (cart_list.length < 1) {
            $1('.cart').style.display = 'none';
            $1('.cart-empty-main').style.display = 'block';
        }
    </script>
    </body>
    

</html>
