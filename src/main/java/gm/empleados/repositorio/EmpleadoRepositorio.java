package gm.empleados.repositorio;

import gm.empleados.modelo.Departamento;
import gm.empleados.modelo.Empleado;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface EmpleadoRepositorio extends JpaRepository<Empleado, Integer> {

    List<Empleado> findByActivoTrue();
    List<Empleado> findByDepartamento(Departamento departamento);
}
