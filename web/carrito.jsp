
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Carrito de Compra</title>
        <link rel="shortcut icon" href="IMG/Logo.ico">
        <%@include file="WEB-INF/jspf/enlaces.jspf" %>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/encabezado.jspf" %>  
        <div class="container mt-4 mb-4">
            <h1 class="mb-4">Carrito de Compra</h1><br>
            <div class="row">
                <div class="col-md-8">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>ITEM</th>
                                    <th>NOMBRES</th>
                                    <th>DESCRIPCIÓN</th>
                                    <th>PRECIO</th>
                                    <th>CANT</th>
                                    <th>SUBTOTAL</th>
                                    <th>ACCIÓN</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="car" items="${carrito}">
                                    <tr>
                                        <td><img src="" alt="Imagen del producto" class="img-thumbnail" style="max-width: 100px;"></td>
                                        <td>${car.getNombre()}</td>
                                        <td class="text-truncate" style="max-width: 200px;">${car.getDescripcion()}</td>
                                        <td>${car.getPrecioCompra()}</td>
                                        <td>
                                            <input type="hidden" id="idprod" value="${car.getIdProducto()}">
                                            <input type="number" id="cant" value="${car.getCantidad()}" class="form-control text-center" min="1"> 
                                        </td>
                                        <td>${car.getSubTotal()}</td>
                                        <td style="text-align: center;">
                                            <a href="#" class="btn btn-outline-primary btn-sm">
                                                <i class="fas fa-pencil-alt"></i>
                                            </a>
                                            <input type="hidden" id="idp" value="${car.getIdProducto()}">
                                            <a href="Controlador?accion=delete" id="btnDelete" class="btn btn-outline-danger btn-sm" onmouseover="this.style.color='red'" onmouseout="this.style.color=''" style="transition: color 0.3s;">
                                                <i class="fas fa-trash-alt"></i>
                                            </a>
                                        </td>
                                    </tr>
                               </c:forEach>  
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-header">
                            <h4>Generar Compra</h4>
                        </div>
                        <div class="card-body">
                            <label>Subtotal:</label>
                            <input type="text" value="$${totalPagar}" readonly class="form-control">
                            <label>Precio de envío:</label>
                            <input type="text" value="$10.0" readonly class="form-control">
                            <label>Descuento:</label>
                            <input type="text" value="$0.0" readonly class="form-control">
                            <label>Total a Pagar:</label>
                            <input type="text" value="$${totalPagar}" readonly class="form-control">
                        </div>
                        <div class="card-footer">
                            <a href="#" class="btn btn-success btn-block">Realizar Compra</a>
                            <a href="#" class="btn btn-danger btn-block">Cancelar Compra</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        
         <%@include file="WEB-INF/jspf/pie.jspf" %>
    </body>
</html>
