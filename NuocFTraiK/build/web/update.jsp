<%-- 
    Document   : add
    Created on : Oct 24, 2022, 12:48:49 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Add Product - Dashboard HTML Template</title>
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,700"
            />
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="./css/add/css/fontawesome.min.css" />
        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="./css/add/jquery-ui-datepicker/jquery-ui.min.css" type="text/css" />
        <!-- http://api.jqueryui.com/datepicker/ -->
        <link rel="stylesheet" href="./css/add/css/bootstrap.min.css" />
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="./css/add/css/templatemo-style.css">

    </head>

    <body>
        <c:set var="p" value="${requestScope.product}"></c:set>
        <div class="container tm-mt-big tm-mb-big">
            <div class="row">
                <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
                    <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                        <div class="row">
                            <div class="col-12">
                                <h2 class="tm-block-title d-inline-block">Update Product</h2>
                            </div>
                        </div>
                        <div class="row tm-edit-product-row">
                          
                            <div class="col-xl-6 col-lg-6 col-md-12">
                                <form action="update" method="post" class="tm-edit-product-form">
                                    <div class="form-group mb-3">
                                        <label for="name">Product Name
                                        </label>
                                        <input id="name" name="name" type="text" class="form-control validate" value="${p.name}"/>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="name">ID
                                        </label>
                                        <input  name="id" type="text" class="form-control validate" readonly value="${p.id}" />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="description">Description</label>
                                        <textarea  name="describe" class="form-control validate" rows="3" value="${p.describe}" required></textarea>
                                    </div>
                                      <div class="form-group mb-3">
                                        <label for="name">Image
                                        </label>
                                        <input  name="image" type="text" class="form-control validate" required />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="category">Category</label>
                                        <select class="custom-select tm-select-accounts" id="category" name="category">
                                                <option selected value="1">Rau củ</option>
                                                <option value="2">Hoa quả</option>
                                                <option value="3">Các loại hạt</option>
                                                <option value="4">Thực phẩm tươi sống</option>
                                        </select>
                                    </div>
                                    <div class="row">
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label for="expire_date">Origin
                                            </label>
                                            <input id="expire_date" name="origin" type="text" class="form-control validate" value="${p.origin}"
                                                   data-large-mode="true" />
                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label for="stock">Price
                                            </label>
                                            <input id="stock" name="price" type="text" class="form-control validate" required value="${p.price}" />
                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label for="stock">Number
                                            </label>
                                            <input id="" name="number" type="text" class="form-control validate" required value="${p.status}"/>
                                        </div>
                                    </div>

                            </div>
                             <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
                                <div class="tm-product-img-dummy mx-auto">
                                    <i class="fas fa-cloud-upload-alt tm-upload-icon"
                                       onclick="document.getElementById('fileInput').click();"></i>
                                </div>
                                <div class="custom-file mt-3 mb-3">
                                    <input id="fileInput" type="file" style="display:none;" />
                                    <input type="button" class="btn btn-primary btn-block mx-auto" value="UPLOAD PRODUCT IMAGE"
                                           onclick="document.getElementById('fileInput').click();" />
                                </div>
                            </div>
                            <div class="col-12">
                                <button type="submit" class="btn btn-primary btn-block text-uppercase">Update Product Now</button>
                            </div>
                             </form>
                           
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <script src="js/jquery-3.3.1.min.js"></script>
        <!-- https://jquery.com/download/ -->
        <script src="jquery-ui-datepicker/jquery-ui.min.js"></script>
        <!-- https://jqueryui.com/download/ -->
        <script src="js/bootstrap.min.js"></script>
        <!-- https://getbootstrap.com/ -->
        <script>
                      $(function () {
                          $("#expire_date").datepicker();
                      });
        </script>
    </body>
</html>

