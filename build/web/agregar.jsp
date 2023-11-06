

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="IMG/Logo.ico">
        <%@include file="WEB-INF/jspf/enlaces.jspf" %>
        <title>Agregar Producto</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/encabezado.jspf" %> 
        <div class="container mt-4 p-4 bg-light border">
            <h1 class="mb-4">Agregar Producto nuevo</h1>
            <form action="controlador?accion=agregar" method="POST" enctype="multipart/form-data">
              <div class="row">
                <div class="col-md-6 mb-3">
                  <label>Nombre:</label>
                  <input type="text" name="nombre" class="form-control" placeholder="Ingrese el nombre del producto" required>
                </div>
                <div class="col-md-6 mb-3">
                  <label>Descripción:</label>
                  <textarea class="form-control" name="descripcion" placeholder="Ingrese la descripción del producto" required></textarea>
                </div>
                <div class="col-md-6 mb-3">
                  <label>Precio:</label>
                  <input type="number" step="0.01" name="precio" min="1" class="form-control" placeholder="Ingrese el precio del producto" required>
                </div>
              </div>
              <div class="row">
                <div class="col-md-6 mb-3">
                  <label>Stock:</label>
                  <input type="number" name="stock" min="1" class="form-control" placeholder="Ingrese la cantidad en stock" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label>Insertar Imagen:</label><br>
                    <input type="file" name="imagen" class="form-control-file" required>
                </div>
              </div>
              <button class="btn btn-primary" type="submit">Guardar Producto</button>
            </form>
        </div>
        <div class="container mt-3">
            <h3 class="my-4">Productos Agregados:</h3>
            <div class="col-md-12">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>ITEM</th>
                                <th>NOMBRES</th>
                                <th>DESCRIPCIÓN</th>
                                <th>PRECIO</th>
                                <th>STOCK</th>
                                <th>ACCIÓN</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="p" items="${lista}">
                                <tr>
                                    <td><img src="${p.imagen}" alt="Imagen del producto" style="max-width: 100px;"></td>
                                    <td>${p.nombre}</td>
                                    <td class="text-truncate" style="max-width: 200px;">${p.descripcion}</td>
                                    <td>$${p.precio}</td>
                                    <td>${p.stock}</td>
                                    <td>
                                        <a href="controlador?accion=actualizar&id=${p.id}" class="btn btn-outline-primary btn-sm" style="transition: color 0.3s;" data-bs-toggle="modal" data-bs-target="#miModal">
                                            <i class="fas fa-pencil-alt"></i>
                                        </a>
                                        <a href="controlador?accion=eliminar&id=${p.id}" id="btnDelete" class="btn btn-outline-danger btn-sm"  style="transition: color 0.3s;">
                                            <i class="fas fa-trash-alt"></i>
                                        </a>
                                    </td>
                                </tr>
                           </c:forEach>  
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="modal fade" id="miModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">Modificar Producto</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <!-- Formulario para agregar producto -->
                  <form action="controlador?accion=actualizar" method="POST" enctype="multipart/form-data">
                    <div class="mb-3">
                        <input type="hidden" class="form-control" name="id" value="${producto.id}" required>
                    </div>
                    <div class="mb-3">
                      <label for="nombre" class="form-label">Nombre</label>
                      <input type="text" class="form-control" name="nombre" value="${producto.nombre}" required>
                    </div>
                    <div class="mb-3">
                      <label for="descripcion" class="form-label">Descripción</label>
                      <textarea class="form-control" name="descripcion" value="${producto.descripcion}" required></textarea>
                    </div>
                    <div class="mb-3">
                      <label for="precio" class="form-label">Precio</label>
                      <input type="number" class="form-control" step="0.01" min="1" name="precio" value="${producto.precio}" required>
                    </div>
                    <div class="mb-3">
                      <label for="stock" class="form-label">Stock</label>
                      <input type="number" class="form-control" min="1" name="stock" value="${producto.stock}" required>
                    </div>
                    <div class="mb-3">
                      <label for="imagen">Imagen</label>
                      <input type="file" name="imagen" class="form-control">
                    </div>
                    <button type="submit" class="btn btn-primary">Guardar Producto</button>
                  </form>
                </div>
              </div>
            </div>
          </div>
        <%@include file="WEB-INF/jspf/pie.jspf" %>  
    </body>
</html>
