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
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/account.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/listproduct.css">
    <link rel="stylesheet" href="css/detail.css">
    <link rel="stylesheet" href="css/listicon.css"/>
    <!-- JS -->
   
</head>

<body>


     <!--NavBar -->
        <jsp:include page="navigation.jsp"/>

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
                <p class="title-page">${requestScope.detail.name}</p>
            </div>
        </div>
    </div>

    <!-- Detail San Pham -->

    <div class="grid wide">
        <div class="chitietsanpham">
            <div class="chitiet-header">
                <div class="row">
                    <div class="col-md-6">
                        <div class="chitiet-big-img">
                            <img src="${requestScope.detail.image}" alt="" style="object-fit: cover">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="chitiet-description">
                            <div class="type-product">
                                <a href="" class="tag-a"><span style="text-transform: uppercase;">${requestScope.detail.name}</span></a>
                            </div>
                            <div class="group-status">
                                <span class="frist-status">
                                    Thương hiệu: <span class="status-name">${requestScope.detail.origin}</span>
                                </span>
                                <span class="frist-status status-2">
                                    <span class="line_tt hidden-sm" style="margin-right: 10px;">|</span>
                                    Tình trạng: <span class="status-name">Còn ${requestScope.detail.status} sản phẩm</span>
                                </span>
                            </div>
                            <div class="chitiet-des-name">
                                <span>
                                    ${requestScope.detail.name}
                                </span>
                            </div>
                            <div class="chitiet-des-price">
                                <span>
                                    ${requestScope.detail.price}<sup>đ</sup>
                                </span>
                            </div>
                            <div class="product-description">
                                <span>Thông tin sản phẩm đang được cập nhật</span>
                            </div>
                                <form name="f" action="" method="post" class="quantity-product">
                                <div class="box-quantity-product">
                                    <div class="so-luong">
                                        <h1>Số lượng: </h1>
                                    </div>
                                    <input type="button" value="-" class="tru">
                                    <input type="number" name="num" class="value-quantity" value="1">
                                    <input type="button" value="+" class="cong">
                                </div>
                                <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@600&display=swap"
                                    rel="stylesheet">
                                
                                    <button onclick="addToCart('${requestScope.detail.id}')" type="submit"  name="btn-add-cart" value="'.$id.'" class="chitiet-add-cart ">
                                        <h3>Thêm vào giỏ hàng</h3>
                                    </button>
                              
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="banner-product" style="margin-bottom: 30px; overflow: hidden">
                <img src="./images/login/bg_pro.jpg" alt="">
                <h1>NuocFTraiK</h1>
                <h3>Thực phẩm an toàn 100%</h3>
            </div>
            <div class="chitiet-body" style="margin-bottom: 30px;">
                <div class="chitiet-body-header">
                    <div class="chitiet-body-title">
                        <span class="chitiet-title-mota chitiet-body-active" data-title="#chitiet-mota">
                            Mô tả
                        </span>
                        <span class="chitiet-title-rate" data-title="#chitiet-rate">ĐÁNH GIÁ <p class="quantity-rate">
                                (0)</p></span>
                    </div>
                    <div class="chitiet-mota chitiet-active" id="chitiet-mota">
                        <div class="chitiet-mota-text">
                            ${requestScope.detail.describe}
                        </div>
                    </div>
                    <div class="chitiet-rate" id="chitiet-rate">
                        <span>Chưa có đánh giá nào</span>
                        <div class="chitiet-rate-foot">Chỉ những khách hàng đã đăng nhập và mua sản phẩm này mới có thể
                            đưa ra đánh giá.</div>
                    </div>
                </div>
            </div>
            <div class="chitiet-foot">
                <div class="chitiet-foot-title">
                    <span>SẢN PHẨM TƯƠNG TỰ</span>
                </div>
                <div class="grid wide product-selling-main" style="overflow: hidden">
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
    </div>
   
<!-- Footer -->
<jsp:include page="footer.jsp"/>


<script>
    let a1=1;
document.querySelector('.cong').onclick = function() {
    a1= a1+1;
    document.querySelector('.value-quantity').value = a1;
}
document.querySelector('.tru').onclick = function() {
    if(a1<2){
        return ;
    }else{
        a1= a1-1;
        document.querySelector('.value-quantity').value = a1;
    }
}
</script>

<script type="text/javascript">
    function addToCart(id){
        var m=document.f.num.value;
        document.f.action="addtocart?id="+id+"&num="+m;
        document.f.submit();
    }
</script>    
</body>

</html>
