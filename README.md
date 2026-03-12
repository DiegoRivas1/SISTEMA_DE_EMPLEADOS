# Employee Management System

Aplicación web desarrollada con **Spring Boot, JSP y MySQL** para la
gestión de empleados dentro de una organización. Incluye operaciones
CRUD completas, filtrado dinámico y un dashboard visual moderno.

------------------------------------------------------------------------

## Demo

![Demo](screenshots/sistema_empleados_gif.gif)

------------------------------------------------------------------------

## Tecnologías utilizadas

### Backend

-   Java 25
-   Spring Boot 4.0.3
-   Spring MVC
-   Spring Data JPA
-   Hibernate
-   HikariCP

### Frontend

-   JSP
-   JSTL
-   Bootstrap 5
-   Bootstrap Icons
-   CSS3 (gradients y animaciones)

### Base de datos

-   MySQL

### Build Tool

-   Maven

------------------------------------------------------------------------

## Arquitectura

El proyecto sigue el patrón **MVC (Model -- View -- Controller)**.

    Controller → Maneja las peticiones HTTP
    Service → Contiene la lógica de negocio
    Repository → Acceso a datos con JPA
    Model → Entidades de la base de datos
    View → JSP + Bootstrap

Flujo de la aplicación:

    Cliente
     ↓
    Controller
     ↓
    Service
     ↓
    Repository (JPA)
     ↓
    Base de datos

------------------------------------------------------------------------

## Estructura del proyecto

    empleados/
    │
    ├── controlador
    │   └── IndexControlador.java
    │
    ├── modelo
    │   ├── Empleado.java
    │   └── Departamento.java
    │
    ├── servicio
    │   ├── EmpleadoServicio.java
    │   └── EmpleadoServicioImpl.java
    │
    ├── repositorio
    │   └── EmpleadoRepositorio.java
    │
    ├── resources
    │   ├── static
    │   │   └── css
    │   └── application.properties
    │
    └── webapp
        └── WEB-INF
            └── jsp
                ├── index.jsp
                ├── agregar.jsp
                ├── editar.jsp
                └── comunes
                    ├── cabecero.jsp
                    ├── navegacion.jsp
                    └── pie-pagina.jsp

------------------------------------------------------------------------

## Funcionalidades

-   Dashboard con métricas
-   CRUD completo de empleados
-   Filtrado por estado
-   Filtrado por departamento
-   Indicadores visuales de estado
-   Interfaz moderna con animaciones
-   Diseño responsive

------------------------------------------------------------------------

## Configuración del proyecto

### 1. Clonar repositorio

``` bash
git clone https://github.com/tu-usuario/employee-management-system.git
```

------------------------------------------------------------------------

## Variables de entorno

El proyecto utiliza un archivo `.env`.

Crear un archivo `.env` en la raíz del proyecto:

    DB_USERNAME=root
    DB_PASSWORD=tu_password

Spring Boot lo carga automáticamente mediante:

    spring.config.import=optional:file:.env[.properties]

------------------------------------------------------------------------

## Base de datos

Configuración en `application.properties`:

    spring.datasource.url=jdbc:mysql://localhost:3306/empleados_db?createDatabaseIfNotExist=true
    spring.datasource.username=${DB_USERNAME}
    spring.datasource.password=${DB_PASSWORD}

Esto permite que **MySQL cree automáticamente la base de datos si no
existe**.

Hibernate gestiona el esquema con:

    spring.jpa.hibernate.ddl-auto=update

------------------------------------------------------------------------

## Ejecutar la aplicación

Con Maven:

    mvn spring-boot:run

O desde tu IDE (IntelliJ, Eclipse, NetBeans).

------------------------------------------------------------------------

## Acceso a la aplicación

La aplicación utiliza un **context path personalizado**:

    server.servlet.context-path=/empleados

Acceder en:

    http://localhost:8080/empleados

------------------------------------------------------------------------

## Dependencias principales

-   spring-boot-starter-webmvc
-   spring-boot-starter-data-jpa
-   mysql-connector-j
-   tomcat-embed-jasper
-   jakarta.servlet.jsp.jstl

------------------------------------------------------------------------

## Mejoras futuras

-   Autenticación con Spring Security
-   Roles de usuario
-   Paginación de empleados
-   API REST
-   Frontend con React
-   Dockerización del proyecto

------------------------------------------------------------------------

## Autor

**Diego Rivas**

Estudiante de Ciencias de la Computacion.