<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="layout/header.jsp"/>
<h3>${title}</h3>
<form action="${pageContext.request.contextPath}/productos/form" method="post">
    <div class="row mb-2">
        <label class="col-form-label col-sm-2" for="nombre">Nombre</label>
        <div class="col-sm-4">
            <input class="form-control" type="text" name="nombre" id="nombre" value="${producto.nombre}">
        </div>
        <c:if test="${errores != null && errores.containsKey('nombre')}">
            <div style="color: red;">${errores.nombre}</div>
        </c:if>
    </div>
    <div class="row mb-2">
        <label class="col-form-label col-sm-2" for="precio">Precio</label>
        <div class="col-sm-4">
            <input class="form-control" type="number" name="precio" id="precio"
                   value="${producto.precio > 0 ? producto.precio : ""}">
        </div>
        <c:if test="${errores != null && not empty errores.precio}">
            <div style="color: red;">${errores.precio}</div>
        </c:if>
    </div>
    <div class="row mb-2">
        <label class="col-form-label col-sm-2" for="sku">Sku</label>
        <div class="col-sm-4">
            <input class="form-control" type="text" name="sku" id="sku"
                   value="${producto.sku}">
        </div>
        <c:if test="${errores != null && not empty errores.sku}">
            <div style="color: red;">${errores.sku}</div>
        </c:if>
    </div>
    <div class="row mb-2">
        <label class="col-form-label col-sm-2" for="fecha_registro">Fecha Registro</label>
        <div class="col-sm-4">
            <input class="form-control" type="date" name="fecha_registro" id="fecha_registro"
                   value="${producto.fechaRegistro != null ?
                       producto.fechaRegistro.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")) : ""}">
        </div>
        <c:if test="${errores != null && not empty errores.fecha_registro}">
            <div style="color: red;">${errores.fecha_registro}</div>
        </c:if>
    </div>
    <div class="row mb-2">
        <label class="col-form-label col-sm-2" for="categoria">Categoría </label>
        <div class="col-sm-4">
            <select class="form-select" name="categoria" id="categoria">
                <option value="">--- Seleccionar ---</option>
                <c:forEach items="${categorias}" var="c">
                    <option value="${c.id}" ${c.id.equals(producto.categoria.id)? "selected": ""}>${c.nombre}</option>
                </c:forEach>
            </select>
        </div>
        <c:if test="${errores != null && not empty errores.categoria}">
            <div style="color: red;">${errores.categoria}</div>
        </c:if>
    </div>
    <div class="row mb-2">
        <div>
            <input class="btn btn-primary" type="submit"
                   value="${producto.id != null && producto.id > 0 ? "Editar" : "Crear"}">
        </div>
    </div>
    <input type="hidden" name="id" value="${producto.id}">
</form>
<jsp:include page="layout/footer.jsp"/>

