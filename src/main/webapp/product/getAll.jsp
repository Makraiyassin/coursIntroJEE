<%@ page import="com.introjee.service.ProductService" %>
<%@ page import="com.introjee.models.Product" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: JAVA
  Date: 12-07-22
  Time: 15:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Detail</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<style>
    #main{
        display: flex;
        justify-content: space-around;
        flex-wrap: wrap;
        width: 60%;
        margin: auto;
    }
    #main .card{
        margin: 1%;
    }
    #link{
        text-align: center;
    }
</style>
    <%! ProductService service = ProductService.getInstance(); %>
    <%
        List<Product> productList = service.getAll();
        if(productList.size() == 0) {
            response.setStatus(404);
            return;
        }
    %>
    <h1>liste produits: </h1>

    <div id="main">

        <%for (Product product: productList) {%>
            <div class="card" >
                <img src="https://picsum.photos/200" class="card-img-top" alt="image random">
                <div class="card-body">
                    <h5 class="card-title"><%= product.getName() %></h5>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item"><span>id: </span> <%= product.getId() %></li>
                    <li class="list-group-item"><span>marque: </span> <%= product.getBrand() %></li>
                    <li class="list-group-item"><span>categorie: </span> <%= product.getCategory() %></li>
                    <li class="list-group-item"><span>prix: </span> <%= product.getPrice() %> </li>
                </ul>
                <div class="card-body">
                    <a class="card-link" href="<%=request.getContextPath()%>/product/getOne.jsp?id=<%=Integer.toString(product.getId())%>">détail</a>
                    <a class="card-link" href="<%=request.getContextPath()%>/update?id=<%=Integer.toString(product.getId())%>">modifier</a>
                    <a class="card-link" href="<%=request.getContextPath()%>/remove?id=<%=Integer.toString(product.getId())%>">supprimer</a>
                </div>
            </div>
        <% };%>
    </div>
    <div id="link">
        <a href=".." class=" btn btn-outline-primary">retour</a>
        <a href="./addProduct.jsp" class=" btn btn-outline-primary">ajouter produit</a>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
