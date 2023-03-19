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
                    <p class="title-page">Đặt hàng - NuocFTraiK</p>
                </div>
            </div>
        </div>

        <div class="checkouts">
            <div class="grid wide">
                <div class="row">
                    <div class="col l-7 c-12">
                        <div class="infor-order">
                            <form action="success" method="post">
                                <div class="title-infor">
                                    <h2>Thông tin giao hàng</h2>
                                </div>
                                <div class="form-group">
                                    <div class="input-item">
                                        <input type="text" name="name" placeholder="Họ và tên người nhận hàng" required>
                                    </div>
                                    <div class="input-item">
                                        <input type="email" name="email" placeholder="Email" class="input-email" required>
                                        <input type="phone" name="phone" placeholder="Số điện thoại" required>
                                    </div>
                                    <div class="input-item">
                                        <div class="tinh-thanh-pho flex">
                                            <label for="">Tỉnh/thành phố:</label>
                                            <select  name="tinh" id="matp" required>
                                                <option value="#">Chọn tỉnh/thành phố</option>
                                                <option value="An Giang">An Giang
                                                <option value="Bà Rịa - Vũng Tàu">Bà Rịa - Vũng Tàu
                                                <option value="Bắc Giang">Bắc Giang
                                                <option value="Bắc Kạn">Bắc Kạn
                                                <option value="Bạc Liêu">Bạc Liêu
                                                <option value="Bắc Ninh">Bắc Ninh
                                                <option value="Bến Tre">Bến Tre
                                                <option value="Bình Định">Bình Định
                                                <option value="Bình Dương">Bình Dương
                                                <option value="Bình Phước">Bình Phước
                                                <option value="Bình Thuận">Bình Thuận
                                                <option value="Bình Thuận">Bình Thuận
                                                <option value="Cà Mau">Cà Mau
                                                <option value="Cao Bằng">Cao Bằng
                                                <option value="Đắk Lắk">Đắk Lắk
                                                <option value="Đắk Nông">Đắk Nông
                                                <option value="Điện Biên">Điện Biên
                                                <option value="Đồng Nai">Đồng Nai
                                                <option value="Đồng Tháp">Đồng Tháp
                                                <option value="Đồng Tháp">Đồng Tháp
                                                <option value="Gia Lai">Gia Lai
                                                <option value="Hà Giang">Hà Giang
                                                <option value="Hà Nam">Hà Nam
                                                <option value="Hà Tĩnh">Hà Tĩnh
                                                <option value="Hải Dương">Hải Dương
                                                <option value="Hậu Giang">Hậu Giang
                                                <option value="Hòa Bình">Hòa Bình
                                                <option value="Hưng Yên">Hưng Yên
                                                <option value="Khánh Hòa">Khánh Hòa
                                                <option value="Kiên Giang">Kiên Giang
                                                <option value="Kon Tum">Kon Tum
                                                <option value="Lai Châu">Lai Châu
                                                <option value="Lâm Đồng">Lâm Đồng
                                                <option value="Lạng Sơn">Lạng Sơn
                                                <option value="Lào Cai">Lào Cai
                                                <option value="Long An">Long An
                                                <option value="Nam Định">Nam Định
                                                <option value="Nghệ An">Nghệ An
                                                <option value="Ninh Bình">Ninh Bình
                                                <option value="Ninh Thuận">Ninh Thuận
                                                <option value="Phú Thọ">Phú Thọ
                                                <option value="Quảng Bình">Quảng Bình
                                                <option value="Quảng Bình">Quảng Bình
                                                <option value="Quảng Ngãi">Quảng Ngãi
                                                <option value="Quảng Ninh">Quảng Ninh
                                                <option value="Quảng Trị">Quảng Trị
                                                <option value="Sóc Trăng">Sóc Trăng
                                                <option value="Sơn La">Sơn La
                                                <option value="Tây Ninh">Tây Ninh
                                                <option value="Thái Bình">Thái Bình
                                                <option value="Thái Nguyên">Thái Nguyên
                                                <option value="Thanh Hóa">Thanh Hóa
                                                <option value="Thừa Thiên Huế">Thừa Thiên Huế
                                                <option value="Tiền Giang">Tiền Giang
                                                <option value="Trà Vinh">Trà Vinh
                                                <option value="Tuyên Quang">Tuyên Quang
                                                <option value="Vĩnh Long">Vĩnh Long
                                                <option value="Vĩnh Phúc">Vĩnh Phúc
                                                <option value="Yên Bái">Yên Bái
                                                <option value="Phú Yên">Phú Yên
                                                <option value="Tp.Cần Thơ">Tp.Cần Thơ
                                                <option value="Tp.Đà Nẵng">Tp.Đà Nẵng
                                                <option value="Tp.Hải Phòng">Tp.Hải Phòng
                                                <option value="Tp.Hà Nội">Tp.Hà Nội
                                                <option value="TP HCM">TP HCM
                                            </select>
                                        </div>
                                    </div>
                                    <div class="input-item">
                                        <div class="quan-huyen-main flex">
                                            <label for="">Quận/huyện:</label>
                                            <div class="input-item">
                                                <input type="text" name="huyen" placeholder="Quận/huyện" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="input-item">
                                        <div class="xa-phuong flex">
                                            <label for="">Thị trấn/xã/phường:</label>
                                            <div class="input-item">
                                                <input type="text" name="xa" placeholder="Thị trấn/xã/phường" required>
                                            </div>
                                        </div>  
                                    </div>
                                    <div class="phuong-thuc-pay" style="margin-top:20px;">
                                        <div class="phuong-thuc-pay-items-box">
                                            <div class="phuong-thuc-pay-items flex">
                                                <input required="" type="radio" name="radio" value="Thanh toán khi nhận hàng">
                                                <span>Thanh toán khi nhận hàng</span>
                                            </div>
                                        </div>
                                        <div class="phuong-thuc-pay-items-box">
                                            <div class="phuong-thuc-pay-items flex">
                                                <input required="" type="radio" name="radio" value="Chuyển khoản ngân hàng">
                                                <span>Chuyển khoản ngân hàng</span>
                                            </div>
                                        </div>
                                        <div class="phuong-thuc-pay-items-box">
                                            <div class="phuong-thuc-pay-items flex">
                                                <input required="" type="radio" name="radio" value="Thanh toán với PayPal">
                                                <span>Thanh toán với PayPal</span>
                                            </div>
                                        </div>
                                        <div class="phuong-thuc-pay-items-box">
                                            <div class="phuong-thuc-pay-items flex">
                                                <input required="" type="radio" name="radio" value="Quét mã MoMo">
                                                <span>Quét mã MoMo</span>
                                            </div>
                                        </div>
                                        <div class="phuong-thuc-pay-items-box">
                                            <div class="phuong-thuc-pay-items flex">
                                                <input required="" type="radio" name="radio" value="Cổng thanh toán nội địa OnePay">
                                                <span>Cổng thanh toán nội địa OnePay</span>
                                            </div>
                                        </div>
                                        <div class="phuong-thuc-pay-items-box">
                                            <div class="phuong-thuc-pay-items flex">
                                                <input required="" type="radio" name="radio" value="Cổng thanh toán Quốc tế OnePay">
                                                <span>Cổng thanh toán Quốc tế OnePay</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="infor-order-end">
                                    <div class="go-to-cart">
                                        <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@600&display=swap" rel="stylesheet">
                                        <a href="cart" class="tag-a">Giỏ hàng</a>
                                    </div>
                                    <div class="continue-pay">
                                        <button type="submit">Hoàn tất đơn hàng</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- Checkout_Product -->
                    <div class="col l-5 c-12 " style="background-color: #fafafa;border-radius: 15px;width: 42%">
                        <div class="checkout_product">
                            <div class="title-infor" style="padding: 5px 0;">
                                <h2>Thông tin đơn hàng</h2>
                            </div>
                            <div class="infor-product-order">
                                <div class="product-order">
                                    <c:set var="o" value="${requestScope.cart}"/>
                                    <c:forEach items="${o.items}" var="i">
                                        <div class="product-item flex">
                                            <div class="product-left flex">
                                                <div class="product-img">
                                                    <img src="${i.product.image}" alt="'.$baseUrl.$data['img'].'">
                                                    <div class="quantity-product"><span>${i.quantity}</span></div>
                                                </div>
                                                <div class="product-name">
                                                    <span>${i.product.name}</span>
                                                </div>
                                            </div>
                                            <div class="product-price"><p>${(i.price*i.quantity/2)}<sup>đ</sup></p></div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="ma-giam-gia flex">
                                <input type="text" placeholder="Mã giảm giá">
                                <div class="ap-dung-ma">
                                    <span>Áp dụng</span>
                                </div>
                            </div>
                            <div class="tam-tinh">
                                <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@600&display=swap" rel="stylesheet">
                                <div class="tam-tinh-main flex">
                                    <span>Tạm tính</span>
                                    <span>${o.totalMoney/2}đ<sup>đ</sup></span>
                                </div>
                                <div class="phi-van-chuyen flex">
                                    <span>Phí vận chuyển</span>
                                    <span>20,000 <sup>đ</sup></span>
                                </div>
                            </div>
                            <div class="tong-cong flex">
                                <span>Tổng cộng</span>
                                <h3>${(o.totalMoney/2)+20000}đ<sup>đ</sup></h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>




            <!-- Footer -->
            <jsp:include page="footer.jsp"/>

    </body>
</html>
