<%@include file="comunes/cabecero.jsp"%>

<!-- NAVBAR -->
<%@include file="comunes/navegacion.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!-- HERO / ENCABEZADO -->
<div class="container mt-4">

    <div class="p-5 bg-dark text-white rounded-3 shadow">

        <div class="text-center">

            <h1 class="display-5 fw-bold">
                Sistema de Gestion de Empleados
            </h1>

            <p class="fs-5">
                Administra y controla los empleados de tu empresa facilmente
            </p>

            <a href="${ctx}/agregar" class="btn btn-primary btn-lg">
                <i class="bi bi-person-plus"></i> Agregar Empleado
            </a>

        </div>

    </div>

</div>


<!-- DASHBOARD CARDS -->
<div class="container mt-5">

    <div class="row text-center">

        <div class="col-md-4 mb-4">

            <div class="card shadow">

                <div class="card-body">

                    <i class="bi bi-people display-4 text-primary"></i>

                    <h5 class="card-title mt-3">Empleados</h5>

                    <p class="display-6">
                        ${empleados.size()}
                    </p>

                </div>

            </div>

        </div>


        <div class="col-md-4 mb-4">

            <div class="card shadow">

                <div class="card-body">

                    <i class="bi bi-building display-4 text-success"></i>

                    <h5 class="card-title mt-3">Departamentos</h5>

                    <p class="display-6">
                        ${totalDepartamentos}
                    </p>

                </div>

            </div>

        </div>


        <div class="col-md-4 mb-4">

            <div class="card shadow">

                <div class="card-body">

                    <i class="bi bi-person-check display-4 text-warning"></i>

                    <h5 class="card-title mt-3">Activos</h5>

                    <p class="display-6">
                        ${empleadosActivos.size()}
                    </p>

                </div>

            </div>

        </div>

    </div>

</div>

<!-- Filtros para tabla -->

<div class="container mt-4">

    <form action="${ctx}/filtrar" method="get" class="row g-3">

        <!-- filtro activo -->
        <div class="col-md-3">
            <label class="form-label">Estado</label>
            <select name="activo" class="form-select">
                <option value="">Todos</option>
                <option value="true">Activos</option>
                <option value="false">Inactivos</option>
            </select>
        </div>

        <!-- filtro departamento -->
        <div class="col-md-3">
            <label class="form-label">Departamento</label>
            <select name="departamento" class="form-select">
                <option value="">Todos</option>

                <c:forEach var="dep" items="${departamentos}">
                    <option value="${dep}">
                            ${dep}
                    </option>
                </c:forEach>

            </select>
        </div>

        <div class="col-md-3 align-self-end">
            <button class="btn btn-primary">
                Filtrar
            </button>

            <a href="${ctx}/" class="btn btn-secondary">
                Limpiar
            </a>
        </div>

    </form>

</div>

<!-- TABLA EJEMPLO -->
<div class="container mt-5">

    <h3 class="text-center mb-4">
        Lista de Empleados
    </h3>

    <table class="table table-striped table-hover shadow">

        <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Departamento</th>
            <th>Sueldo</th>
            <th>Estado</th>
            <th>Acciones</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="empleado" items="${empleados}">
            <tr>
                <td>${empleado.idEmpleado}</td>
                <td>${empleado.nombreEmpleado}</td>
                <td>${empleado.departamento}</td>
                <td>
                    <fmt:setLocale value="en_US"/>
                    <fmt:formatNumber type="currency" value="${empleado.sueldo}"/>
                </td>
                <td>
                        <span class="badge ${empleado.activo ? 'bg-success' : 'bg-danger'}">
                                ${empleado.estado}
                        </span>
                </td>

                <!--
                     <td>
                        <c:choose>
                            <c:when test="${empleado.activo}">
                                <span class="badge bg-success">Activo</span>
                            </c:when>
                            <c:otherwise>
                                <span class="badge bg-danger">Inactivo</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                     -->
                <td>
                    <!-- Modificar -->
                    <!-- Modificar /empleados/editar?idEmpleado=3 -->
                    <!-- agrega automaticamente ctx/editar -->
                    <c:set var="urlEditar">
                        <c:url value="/editar">
                            <c:param name="idEmpleado"
                                     value="${empleado.idEmpleado}"/>
                        </c:url>
                    </c:set>


                    <a href="${urlEditar}"
                       class="btn btn-warning btn-sm">
                        <i class="bi bi-pencil"></i>
                    </a>

                    <!-- Eliminar -->
                    <!-- Eliminar /empleados/eliminar?idEmpleado=3 -->
                    <c:set var="urlEliminar">
                        <c:url value="/eliminar">
                            <c:param name="idEmpleado"
                                     value="${empleado.idEmpleado}"/>
                        </c:url>
                    </c:set>
                    <a href="${urlEliminar}"
                       class="btn btn-danger btn-sm">
                        <i class="bi bi-trash"></i>
                    </a>

                </td>
            </tr>
        </c:forEach>
        <!--
         <tr>
            <td>1</td>
            <td>Juan Perez</td>
            <td>IT</td>
            <td>$3000</td>
            <td>

                <button class="btn btn-warning btn-sm">
                    <i class="bi bi-pencil"></i>
                </button>

                <button class="btn btn-danger btn-sm">
                    <i class="bi bi-trash"></i>
                </button>

                </td>
            </tr>
             -->
        </tbody>

    </table>

</div>


<!-- JS Bootstrap Pie de pagina-->
<%@include file="comunes/pie-pagina.jsp"%>
