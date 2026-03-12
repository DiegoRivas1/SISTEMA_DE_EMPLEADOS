<%@include file="comunes/cabecero.jsp"%>

<!-- NAVBAR -->
<%@include file="comunes/navegacion.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<div class="container">
    <div class="text-center" style="margin: 30px">
        <h3>
            Agregar Empleado
        </h3>
    </div>

    <form action="${ctx}/agregar" modelAttribute="empleadoForma" method="post">
        <div class="mb-3">
            <label for="nombreEmpleado" class="form-label">Nombre Empleado</label>
            <input type="text" class="form-control" id="nombreEmpleado" name="nombreEmpleado" required>
            <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
        </div>
        <div class="mb-3">
            <label for="departamento" class="form-label">Departamento</label>

            <select class="form-select" id="departamento" name="departamento" required>

                <option value="">Seleccione un departamento</option>

                <c:forEach var="dep" items="${departamentos}">
                    <option value="${dep}">
                            ${dep}
                    </option>
                </c:forEach>

            </select>
        </div>
        <div class="mb-3">
            <label for="sueldo" class="form-label">Sueldo</label>
            <input type="number" step="any" class="form-control" id="sueldo" name="sueldo" required>
        </div>
        <div class="mb-3 form-check">
            <input type="checkbox"
                   class="form-check-input"
                   id="activo"
                   name="activo">

            <label class="form-check-label" for="activo">
                Empleado Activo
            </label>
        </div>
        <div class="mb-3 form-check">
            <input type="checkbox" class="form-check-input" id="exampleCheck1">
            <label class="form-check-label" for="exampleCheck1">Check me out</label>
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-primary">Submit</button>
            <a href="${ctx}/" class="btn btn-danger btn-sm">Regresar</a>
        </div>
    </form>
</div>

<%@include file="comunes/pie-pagina.jsp"%>