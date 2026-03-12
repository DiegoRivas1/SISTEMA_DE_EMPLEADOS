package gm.empleados.servicio;

import gm.empleados.modelo.Departamento;
import gm.empleados.modelo.Empleado;

import java.util.List;

public interface IEmpleadoServicio {

    public List<Empleado> listarEmpleados();
    public Empleado buscarEmpleadoPorId(Integer idEmpleado);
    public void guardarEmpleado(Empleado empleado);
    public void eliminarEmpleado(Empleado empleado);

    public List<Empleado> listarEmpleadosActivos();
    public List<Empleado> listarPorDepartamento(Departamento departamento);

    public List<Empleado> listarPorActivoYDepartamento(Boolean activo, Departamento departamento);
    public List<Empleado> listarPorActivo(Boolean activo);
}
