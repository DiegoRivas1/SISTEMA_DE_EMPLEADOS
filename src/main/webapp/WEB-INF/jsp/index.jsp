<%@include file="comunes/cabecero.jsp"%>

<!-- NAVBAR -->
<%@include file="comunes/navegacion.jsp"%>

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

            <a href="/agregar" class="btn btn-primary btn-lg">
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
                        20
                    </p>

                </div>

            </div>

        </div>

    </div>

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
                        <button class="btn btn-warning btn-sm">
                            <i class="bi bi-pencil"></i>
                        </button>
                        <button class="btn btn-danger btn-sm">
                            <i class="bi bi-trash"></i>
                        </button>
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

