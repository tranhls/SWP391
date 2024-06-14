<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--begin of menu-->
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <style>
        body {

            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
        #logreg-forms {
            background: rgba(255, 255, 255, 0.8); /* Make form background semi-transparent */
            padding: 15px;
            border-radius: 10px;
        }
        .jumbotron {
            background-image: url('https://annicoffee.vn/public/manipulate/0x0/slider-images/1657529785-ca-phe-hat-chat-luong-den-tu-vung-tay-nguyen-anni-coffee.jpg?watermark=0'); /* Thay thế bằng đường dẫn đến ảnh của bạn */
            background-size: cover;
            background-position: center;
            padding: 9rem 2rem;
        }
        a{
            color: #856404;
            text-decoration: none;
            background-color: transparent;

        }
        .card-body {
            -webkit-box-flex: 1;
            -ms-flex: 1 1 auto;
            flex: 1 1 auto;
            padding: 1.25rem;
            text-align: center;
        }
        .bg-primary {
            background-color: #6c5309 !important;
        }
        .bg-success {
            background-color: #6c5309 !important;
        }
        .btn-success {
            color: #fff;
            background-color:#6c5309 ;
            border-color: #6c5309;
        }
        .btn-danger {
            color: #383d41;
            background-color: #fff;
            border-color: black;

        }
    </style>
    <div class="container">
        <a class="navbar-brand" href="home">The Coffee Cute</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
            <ul class="navbar-nav m-auto">

                <c:if test="${sessionScope.acc != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Hello ${user}</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="profile">Profile</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc.isAdmin == 1}">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Manager Account</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc.isAdmin == 1 || sessionScope.acc.isSeller == 1}">
                    <li class="nav-item">
                        <a class="nav-link" href="manager">Manager Products</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc != null}">
                    <li class="nav-item">
                        <a class="nav-link" href="logout">Logout</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.acc == null}">
                    <li class="nav-item">
                        <a class="nav-link" href="Login.jsp">Login</a>
                    </li>
                </c:if>

            </ul>

            <form action="search" method="post" class="form-inline my-2 my-lg-0">
                <div class="input-group input-group-sm">
                    <input value="${txtSearch}" name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary btn-number">
                            <i>Search</i>
                        </button>
                    </div>
                </div>
                <a class="btn btn-success btn-sm ml-3" href="ListCart">
                    <i class="fa fa-shopping-cart"></i> Cart
                    <!--                            <span class="badge badge-light">0</span>-->
                </a>
            </form>
        </div>
    </div>
</nav>
<section class="jumbotron text-center">
    <div class="container">
        <h1 class="jumbotron-heading"></h1>
        <p class="lead text-muted mb-0"></p>
    </div>
</section>
<!--end of menu-->
