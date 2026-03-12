package gm.empleados.servicio;

import gm.empleados.modelo.Departamento;
import gm.empleados.modelo.Empleado;
import gm.empleados.repositorio.EmpleadoRepositorio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmpleadoServicio implements IEmpleadoServicio{

    //EmpleadoRepositorio empleadoRepositorio = new EmpleadoRepositorio();
    @Autowired //inyecta automáticamente una instancia de EmpleadoRepositorio dentro de EmpleadoServicio.
    private EmpleadoRepositorio empleadoRepositorio;

    /*
    RECOMENDADO
    private final EmpleadoRepositorio empleadoRepositorio;

    public EmpleadoServicio(EmpleadoRepositorio empleadoRepositorio) {
        this.empleadoRepositorio = empleadoRepositorio;
    }
     */

    @Override
    public List<Empleado> listarEmpleados() {

        return empleadoRepositorio.findAll();
    }

    @Override
    public Empleado buscarEmpleadoPorId(Integer idEmpleado) {
        return empleadoRepositorio.findById(idEmpleado).orElse(null);
    }

    @Override
    public void guardarEmpleado(Empleado empleado) {
        empleadoRepositorio.save(empleado);//null agrega, no null actueliza
    }

    @Override
    public void eliminarEmpleado(Empleado empleado) {
        empleadoRepositorio.delete(empleado);
    }

    @Override
    public List<Empleado> listarEmpleadosActivos() {
        return empleadoRepositorio.findByActivoTrue();
    }

    @Override
    public  List<Empleado> listarPorDepartamento(Departamento departamento){
        return empleadoRepositorio.findByDepartamento(departamento);
    }
    @Override
    public List<Empleado> listarPorActivoYDepartamento(Boolean activo, Departamento departamento){
        return empleadoRepositorio.findByActivoAndDepartamento(activo, departamento);
    }
    @Override
    public List<Empleado> listarPorActivo(Boolean activo){
        return empleadoRepositorio.findByActivo(activo);
    }
}
