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
        <link rel="stylesheet" href="css/slider.css" />
        <link rel="stylesheet" href="css/listproduct.css"/>
        <link rel="stylesheet" href="css/footer.css"/>
        <link rel="stylesheet" href="css/pageindex.css"/>
        <link rel="stylesheet" href="css/listicon.css"/>
        <!-- JS -->
    </head>

    <body>
        <!--NavBar -->
        <jsp:include page="navigation.jsp"/>
         <!--List_Icon -->
         <jsp:include page="list_icon.jsp"/>

        <!--===================Start slider===================-->

        <div class="slider owl-carousel owl-theme">
            <div class="slider_item slider_item_one">
                <img src="./images/slider/slider_1.png" alt="">
            </div>
            <div class="slider_item slider_item_two">
                <img src="./images/slider/slider_2.png" alt="">
            </div>
            <div class="slider_item slider_item_three">

                <img src="./images/slider/slider_3.png" alt="">
            </div>
            <div class="slider_item slider_item_four">
                <img src="./images/slider/slider_4.png" alt="">
            </div>
            <div class="slider_item slider_item_five">
                <h3 class="text-slider3 text_gradient">Fresh Fruits</h3>
                <img src="./images/slider/slider_5.jpg" alt="">
            </div>
            <div class="slider_item slider_item_six">
                <img src="./images/slider/slider_6.png" alt="">
            </div>
            <div class="slider_item slider_item_seven">
                <img src="./images/slider/slider_7.png" alt="">
            </div>
            <div class="slider_item slider_item_eight">
                <img src="./images/slider/slider_8.png" alt="">
            </div>
        </div>

        <!--End slider-->

        <!--========================== Content ==========================-->

        <div class="home">
            <div class="collection">
                <div class="row">
                    <div class="col-md-3 collect-item nth-1">
                        <div class="content">
                            <h3 class="banner-title">Rau quả tươi</h3>
                            <span>
                                Chúng tôi cam kết 100% các sản phẩm có nguồn gốc xuất xứ rõ
                                ràng, sạch, an toàn và đảm bảo chất lượng ngon nhất giao đến tận
                                tay người tiêu dùng, để san sẻ sự vất vả của các mẹ, các chị
                            </span>
                            <a href="category?cid=${1}"><button class="btn-collection">Xem ngay</button></a>
                        </div>
                    </div>
                    <div class="col-md-3 collect-item nth-2">
                        <div class="content">
                            <h3 class="banner-title">Hoa quả tươi mát</h3>
                            <span>
                                Chúng tôi cam kết 100% các sản phẩm có nguồn gốc xuất xứ rõ
                                ràng, sạch, an toàn và đảm bảo chất lượng ngon nhất giao đến tận
                                tay người tiêu dùng, để san sẻ sự vất vả của các mẹ, các chị
                            </span>
                            <a href="category?cid=${2}"><button class="btn-collection">Xem ngay</button></a>
                        </div>
                    </div>
                    <div class="col-md-3 collect-item nth-3">
                        <div class="content">
                            <h3 class="banner-title">Các loại hạt</h3>
                            <span>
                                Chúng tôi cam kết 100% các sản phẩm có nguồn gốc xuất xứ rõ
                                ràng, sạch, an toàn và đảm bảo chất lượng ngon nhất giao đến tận
                                tay người tiêu dùng, để san sẻ sự vất vả của các mẹ, các chị
                            </span>
                            <a href="category?cid=${3}"><button class="btn-collection">Xem ngay</button></a>
                        </div>
                    </div>
                    <div class="col-md-3 collect-item nth-4">
                        <div class="content">
                            <h3 class="banner-title">Thực phẩm tươi</h3>
                            <span>
                                Chúng tôi cam kết 100% các sản phẩm có nguồn gốc xuất xứ rõ
                                ràng, sạch, an toàn và đảm bảo chất lượng ngon nhất giao đến tận
                                tay người tiêu dùng, để san sẻ sự vất vả của các mẹ, các chị
                            </span>
                             <a href="category?cid=${4}"><button class="btn-collection">Xem ngay</button></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- ================Extension================ -->

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

        <!-- ============ About Us ============= -->

        <section id="aboutus" class="description_content grid wide">
            <div class="text-content container">
                <div class="col-md-6">
                    <div class="about_title text_gradient">
                        <h1>About us</h1>
                    </div>
                    <div class="icon_leaf icon_gradient">
                        <i class="fa-sharp fa-solid fa-leaf"></i>
                        <i class="fa-solid fa-seedling"></i>
                    </div>

                    <p class="desc-text">
                        Hiện tại vùng nguyên liệu của chúng tôi có thể cung cấp các thực tập
                        tươi sạch với số lượng lớn vì đang vào vụ mùa thu hoạch nên chúng
                        tôi có thể cung ứng cho tất cả các đối tác xuất khẩu nông sản trên
                        cả nước.
                    </p>
                </div>
                <div class="col-md-6">
                    <div class="img-section">
                        <img src="./images/aboutus/about_1.jpg" width="250" height="220" />
                        <img src="./images/aboutus/about_2.jpg" width="250" height="220" />
                        <div class="img-section-space"></div>
                        <img src="./images/aboutus/about_3.jpg" width="250" height="220" />
                        <img src="./images/aboutus/about_4.jpg" width="250" height="220" />
                    </div>
                </div>
            </div>
        </section>

        <!-- ============ List Product ============= -->
        <div class="category_home">
            <div class="grid wide">
                <div class="about-title ">
                    <div class="about-heading">
                        <span class="text_gradient">DANH MỤC SẢN PHẨM</span>
                        <i class="fa-solid fa-cart-shopping icon_gradient"></i>
                    </div>
                </div>
                <div class="tab-link-box">
                    <div class="tab-link">
                        <ul class="ul-link-check">

                            <a href="category?cid=${0}  "><li class="tag-li tab-link-item ${(requestScope.tag == c.categoryId || requestScope.tag == 0)?"tab-link-active":""}">All Product</li></a>
                                    <c:forEach items="${requestScope.listC}" var="c">
                                <a href="category?cid=${c.categoryId}"><li class="tag-li tab-link-item ${(requestScope.tag == c.categoryId)?"tab-link-active":""}">${c.categoryName}</li></a>
                                    </c:forEach>
                        </ul>
                    </div>

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
        </div>
         
        <c:set var="page" value="${requestScope.page}"/>
        <div class="pageindex">
            <ul>
                <c:forEach begin="1" end="${requestScope.num}" var="i">
                    <a href="home?page=${i}"><li>${i}</li></a>
                </c:forEach>
                <div class="bar"></div>
            </ul>
        </div>
       
        <div style="height: 70px"></div>

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