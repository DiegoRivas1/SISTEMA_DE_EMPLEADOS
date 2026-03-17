<c:set var="ctx" value="${pageContext.request.contextPath}" />

<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow navbar-custom sticky-top">
    <div class="container">

        <!-- LOGO -->
        <a class="navbar-brand brand-custom" href="${ctx}/">
            <i class="bi bi-people-fill"></i> Sistema de Empleados
        </a>

        <!-- BOTON MOBILE -->
        <button class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- MENU -->
        <div class="collapse navbar-collapse" id="navbarNav">

            <ul class="navbar-nav ms-auto align-items-center">

                <!-- INICIO -->
                <li class="nav-item">
                    <a class="nav-link nav-hover" href="${ctx}/">
                        <i class="bi bi-house"></i> Inicio
                    </a>
                </li>

                <!-- DROPDOWN EMPLEADOS -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle nav-hover"
                       href="#"
                       role="button"
                       data-bs-toggle="dropdown">

                        <i class="bi bi-people"></i> Empleados
                    </a>

                    <ul class="dropdown-menu dropdown-menu-dark">

                        <li>
                            <a class="dropdown-item" href="${ctx}/">
                                <i class="bi bi-list"></i> Ver todos
                            </a>
                        </li>

                        <li>
                            <a class="dropdown-item" href="${ctx}/activos">
                                <i class="bi bi-check-circle"></i> Activos
                            </a>
                        </li>

                        <li>
                            <a class="dropdown-item" href="${ctx}/agregar">
                                <i class="bi bi-person-plus"></i> Agregar empleado
                            </a>
                        </li>

                    </ul>
                </li>

                <!-- ESTADISTICAS -->
                <li class="nav-item stats-navbar">
                    <span class="badge bg-success">
                        Activos: ${empleadosActivos.size()}
                    </span>
                </li>

            </ul>

        </div>
    </div>
</nav>