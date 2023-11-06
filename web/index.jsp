

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>OfferLink</title>
        <%@include file="WEB-INF/jspf/enlaces.jspf" %>
        <link rel="shortcut icon" href="IMG/Logo.ico">
    </head>
    <body>
        <%@include file="WEB-INF/jspf/encabezado.jspf" %>       
        <div class="container mt-4">
            <div class="row">   
                <c:forEach var="p" items="${lista}" >
                    <div class="col-md-4">
                        <div class="card">
                            <img src="${p.imagen}" class="card-img-top img-thumbnail" alt="">
                            <div class="card-body">
                                <h5 class="card-title">${p.nombre}</h5>
                                <p class="card-text">${p.descripcion}</p>
                                <p class="card-text">$${p.precio}</p>
                                <a href="ControladorCar?accion=AgregarCarrito&id=${p.getId()}" class="btn btn-alert btn-buy">Agregar al Carrito <i class="bi bi-cart3"></i></a>
                                <a href="ControladorCar?accion=Carrito" class="btn btn-primary btn-buy">Ir a Comprar</a>
                            </div>
                        </div>
                  </div>
                </c:forEach>    
            </div>
        </div>
        <%@include file="WEB-INF/jspf/pie.jspf" %>
    </body>
</html>
