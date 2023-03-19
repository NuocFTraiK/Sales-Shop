

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manager</title>
        <!-- Icon -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
              integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
        <link rel="stylesheet" href="css/manager.css">
        
        <script type="text/javascript">
            function doDelete(id){
                if(confirm("Ngài sure to delete product with id = "+id)){
                    window.location="delete?id="+id;
                }
            }
        </script>
    </head>

    <body>

        <!--shopping cart area start -->
        <div class="shopping_cart_area mt-100">
            <div class="container">
                <form action="#">
                    <div class="row">
                        <div class="col-12">
                            <div class="table_desc">
                                <div class="cart_page table-responsive">
                                    <div class="cart_submit">
                                          <button><a href="home">Back to home </a></button> 
                                        <button><a href="add.jsp">Add new</a></button> 
                                    </div>
                                    <table>
                                        <thead>
                                            <tr>
                                                <th class="product_update">Update</th>
                                                <th class="product_remove">Delete</th>
                                                <th class="product_id">ID</th>
                                                <th class="product_image">Image</th>
                                                <th class="product_name">Product Name</th>
                                                <th class="product-price">Price</th>
                                                <th class="product_origin">Number</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listP}" var="p">
                                                <tr>
                                                    <td class="product_remove"><a href="update?id=${p.id}"><i class="fa-solid fa-file-pen"></i></a>  </td>
                                                    <td class="product_remove"><a href="#" onclick="doDelete(${p.id})"><i class="fa-solid fa-trash"></i></a></td>
                                                    <td class="product_id">${p.id}</td>
                                                    <td class="product_image"><a href="#"><img src="${p.image}" alt=""></a></td>
                                                    <td class="product_name"><a href="#">${p.name}</a></td>
                                                    <td class="product-price">${p.price}</td>
                                                    <td class="product_origin"><label></label> <input value="${p.status}" min="1" max="100" type="number"></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="cart_submit">
                                   
                                    <button><a href="home">Back to home </a></button> 
                                </div>
                            </div>
                        </div>
                    </div>

                </form>
            </div>
        </div>
        <!--shopping cart area end -->


    </body>

</html>
