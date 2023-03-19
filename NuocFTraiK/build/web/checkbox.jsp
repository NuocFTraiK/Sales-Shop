<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>NuocFTraiK</title>
        <!-- Owl carousel -->
        <link rel="stylesheet" href="./OwlCarousel2-2.3.4/OwlCarousel2-2.3.4/dist/assets/owl.carousel.min.css" />
        <link rel="stylesheet" href="./OwlCarousel2-2.3.4/OwlCarousel2-2.3.4/dist/assets/owl.theme.default.min.css" />
        <!-- Icon -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
              integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
        <!-- CSS -->
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="css/content.css" />
        <link rel="stylesheet" href="css/listproduct.css"/>
        <link rel="stylesheet" href="css/footer.css"/>
        <link rel="stylesheet" href="css/pageindex.css"/>
        <link rel="stylesheet" href="css/checkbox.css"/>
        <link rel="stylesheet" href="css/listicon.css"/>
        <link rel="stylesheet" href="css/account.css"/>
        <!-- JS -->
        <script>
            function check(browser) {
                document.getElementById("answer").value = browser;
            }
        </script>
    </head>

    <body>
        <!--NavBar -->
        <jsp:include page="navigation.jsp"/>

        <!--List_Icon -->
        <jsp:include page="list_icon.jsp"/>



        <div style="height: 30px"></div>

        <!-- ============ List Product ============= -->
        <div class="category_home">
            <div class="grid wide">
                <div class="about-title ">
                    <div class="about-heading">
                        <span class="text_gradient">DANH MỤC SẢN PHẨM</span>
                        <i class="fa-solid fa-cart-shopping icon_gradient"></i>
                    </div>
                </div>

                <c:set var="cat" value="${requestScope.listC}"/>
                <c:set var="ci" value="${requestScope.cid}"/>
                <form action="checkbox">
                    <div class="checkbox">
                        <c:forEach begin="0" end="${cat.size()-1}" var="i">

                            <label class="container_label">${cat.get(i).getCategoryName()}
                                <input type="checkbox" name="id" value="${cat.get(i).getCategoryId()}"
                                       ${ci[i]?"checked":""} onclick="this.form.submit()">
                                <span class="checkmark"></span>
                            </label>

                        </c:forEach>
                    </div>
                </form>
                <form action="radio">
                    <div class="category-header">
                        <div class="arrange">
                            <div class="sort-cate">
                                <div class="sort-cate-left">
                                    <h3>Sắp xếp theo:</h3>
                                    <ul class="sort-cate-list">
                                        <li class="btn-quick-sort sort-cate-item tag-li">
                                            <span><input type="radio" name="sortname" ${requestScope.sortname=="asc"?"checked":""} onclick="this.form.submit()" value="asc"></span>
                                            A → Z
                                        </li>
                                        <li class="btn-quick-sort sort-cate-item tag-li">
                                            <span><input type="radio" name="sortname" ${requestScope.sortname=="desc"?"checked":""} onclick="this.form.submit()" value="desc"></span>
                                            Z → A
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <form action="radio" method="post">
                    <div class="category-header">
                        <div class="arrange">
                            <div class="sort-cate">
                                <div class="sort-cate-left">
                                    <h3>Sắp xếp theo:</h3>
                                    <ul class="sort-cate-list">
                                        <li class="btn-quick-sort sort-cate-item tag-li">
                                            <span><input type="radio" ${requestScope.sortprice=="asc"?"checked":""} name="sortprice" onclick="this.form.submit()" value="asc"></span>
                                            Giá tăng dần
                                        </li>
                                        <li class="btn-quick-sort sort-cate-item tag-li">
                                            <span><input type="radio" ${requestScope.sortprice=="desc"?"checked":""} name="sortprice"onclick="this.form.submit()" value="desc"></span>
                                            Giá giảm dần
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>

                
                <!--                                        <form action="search" method="get">
                                                            <input style="display: none" type="text" name="cid" value="${requestScope.cid}" />
                                                            <table>
                                                                <tr>
                                                                    <th>From price:</th>
                                                                    <th><input class="" type="number" name="from_price" value="${requestScope.from_price}" /></th>
                                                                </tr>
                                                                <tr>
                                                                    <th>To price:</th>
                                                                    <th><input class="" type="number" name="to_price" value="${requestScope.to_price}" /></th>
                                                                </tr>
                                                            </table>
                                                            <input style="text-align: center"type="submit" value="Filter" />
                                                        </form>-->


                
                <div class="container-form">
                    <form action="searchprice" method="get" class="form-account" >
                        <div class="form-group">
                            <label for="">From Price:</label>
                            <input class="" type="number" name="from_price" value="${requestScope.from_price}" />
                        </div>
                        <div class="form-group">
                            <label for="">To Price:</label>
                           <input class="" type="number" name="to_price" value="${requestScope.to_price}" />
                        </div>

                        <div class="group-btn">
                            <button type="submit" class="btn-account">Filter</button>
                        </div>
                    </form>
                </div>                            
                <div class="tabs-content">
                    <div class="row">
                        <c:forEach items="${requestScope.listP}" var="p">
                            <div class="col-md-3 one-product">
                                <div class="content-tab-item">
                                    <div class="product-thumnail">
                                        <a href="detail?pid=${p.id}">
                                            <img src="${p.image}" alt="">
                                        </a>
                                    </div>
                                    <div class="product-info">
                                        <div class="product-name">
                                            <h3>${p.name}</h3>
                                        </div>
                                        <div class="product-price">
                                            <h3>${p.price} VND</h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>


            </div>





            <section class="ftco-section ">
                <div class="container grid wide">
                    <div class="row ftco-services">
                        <div class="col-md-3">
                            <div class="media services">
                                <div class="icon bg-color-1">
                                    <i class="fa-solid fa-paper-plane" style="margin-left: 26px;"></i>
                                </div>
                                <div class="media-body">
                                    <h3 class="heading">Free Shipping</h3>
                                    <span>On order over $100</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="media services">
                                <div class="icon bg-color-2">
                                    <i class="fa-solid fa-carrot"></i>
                                </div>
                                <div class="media-body">
                                    <h3 class="heading">Always Fresh</h3>
                                    <span>Product well package</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="media services">
                                <div class="icon bg-color-3">
                                    <i class="fa-solid fa-award" style="margin-left: 33px;"></i>
                                </div>
                                <div class="media-body">
                                    <h3 class="heading">Superior Quality</h3>
                                    <span>Quality Products</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="media services">
                                <div class="icon bg-color-4">
                                    <i class="fa-solid fa-headset" style="margin-left: 28px;"></i>
                                </div>
                                <div class="media-body">
                                    <h3 class="heading">Support</h3>
                                    <span>24/7 Support</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Footer -->
            <jsp:include page="footer.jsp"/>

            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"
                    integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
            <script src="./OwlCarousel2-2.3.4/OwlCarousel2-2.3.4/dist/owl.carousel.min.js"></script>
            <script>
                                                $(document).ready(function () {
                                                    $(".owl-carousel").owlCarousel();
                                                });

                                                $(".owl-carousel").owlCarousel({
                                                    stagePadding: 260,
                                                    loop: true,
                                                    nav: true,
                                                    margin: 0,
                                                    center: true,
                                                    autoplay: true,
                                                    autoplayTimeout: 5000,
                                                    autoplayHoverPause: true,
                                                    autoplaySpeed: 1500,
                                                    responsive: {
                                                        0: {
                                                            items: 1,
                                                        },
                                                        600: {
                                                            items: 1,
                                                        },
                                                        1000: {
                                                            items: 1,
                                                        },
                                                    },
                                                });

            </script>

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
    </body>

</html>