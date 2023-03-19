<%-- 
    Document   : navigation
    Created on : Oct 16, 2022, 1:59:41 PM
    Author     : dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        <li><a class="color_animation" href="admin">ADMIN</a></li>
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
                                <a href="profile">Profile User</a>
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
                        <button style="background: transparent; border: none" onclick="openCart()">
                            <i class="fa-solid fa-basket-shopping"></i>
                        </button>
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

<style>
    /* Cartttttttttttttt */
    .overlay {
        position: fixed;
        top: 0;
        right: 0;
        background-color: rgba(0,0,0, 0.15);
        width: 0px;
        height: 100%;
        z-index: 100;
       
    }
    
.cart {
    background-color: #fff;
    width: 0px;
    min-height: 100vh;
    float: right;
    transition: all 0.5s ease;
  
}


.cart-contain {
    padding: 6px 32px 0 28px;
    transition: all 0.25s ease-in-out;
    
   
}

.cart-title {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 20px;
    transition: all 0.25s ease-in-out;

}

.cart-title p {
    font-size: 18px;
    font-weight:bold;
    margin-top: 10px;
    transition: all 0.25s ease-in-out;
    
  
}

.cart-title i {
    font-size: 20px;
    transition: all 0.25s ease-in-out;

}

.cart-list {
    list-style: none;
    padding-left: 0;
    max-height: 360px;
    overflow-y: scroll;
    transition: all 0.5s ease-in-out;
}

.cart-item {
    display: flex;
    position: relative;
} 

 .cart-item + .cart-item {
    margin-top: 42px;
} 

 .cart-item::before {
    content: "";
    position: absolute;
    top: -22px;
    left: 0;
    width: 100%;
    border-top: 1px solid #e1e1e1;
} 

 .cart-item__img {
    width: var(--size-image);
    height: var(--size-image)
} 

 .cart-content {
    margin-left: 12px;
    flex: 1;
} 

 .cart-name {
    font-size: 14px;
    margin: 0 0 16px;
    color: var(--black-color);
}

.cart-price {
    font-size: 12px;
}

.cart-price span {
    font-weight: bolder;
}

.cart-item .cart-close-item {
    font-size: 16px;
    margin-right: 16px;
    height: 20px;
    padding: 0 5px 5px;
} 

/* Cart-footer */

.cart__total-price {
    display: flex;
    align-items: center;
    justify-content: space-between;
    font-size: 14px;
}

.cart-footer {
    position: relative;
    margin-top: 48px;
}

.cart-footer::before {
    content: "";
    position: absolute;
    top: -28px;
    left: 0;
    width: 100%;
    border-top: 1px solid #e1e1e1;
}

.cart__total-price p {
    margin: 0 0 10px;
}

.cart__total-price span {
    font-weight: bolder;
}

.btn-cart__contain {
    margin-top: 16px;
}

.btn-cart {
    display: block;
    text-decoration: none;
    background-color: #eef0f1;
    width: 100%;
    text-align: center;
    padding: 16px 0;
     color: var(--black-color); 
    font-size: 12px;
    font-weight: bold;
    border-radius: 3px;
    border: 1px solid #e1e1e1;
    transition: all 0.25s ease;
    box-shadow: 0 0 10px rgba(0,0,0, 0.15);
}

.btn--view:hover {
    background-color: #79a206;
    color: var(--white-color);
    text-decoration: none;
}

.btn--checkout {
    background-color: #79a206;
    color: var(--white-color);
    text-decoration: none !important;
    transition: all 0.25s ease;
    box-shadow: 0 0 10px rgba(0,0,0, 0.3) !important;
}
.btn--checkout:hover {
    background-color: #79a206;
    color: var(--white-color);
    text-decoration: none !important;
}

.btn-cart + .btn-cart {
    margin-top: 16px;
}



    


        

</style>
