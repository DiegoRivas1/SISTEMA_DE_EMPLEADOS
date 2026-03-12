package gm.empleados.controlador;

import gm.empleados.modelo.Departamento;
import gm.empleados.modelo.Empleado;
import gm.empleados.servicio.EmpleadoServicio;
import jakarta.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class IndexControlador {
    private static final Logger logger = LoggerFactory.getLogger(IndexControlador.class);

    @Autowired
    EmpleadoServicio empleadoServicio;

    @ModelAttribute
    public void agregarDatosGlobales(Model model){
        model.addAttribute("departamentos", Departamento.values());
        model.addAttribute("totalDepartamentos", Departamento.values().length);
        model.addAttribute("empleadosActivos", empleadoServicio.listarEmpleadosActivos());
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)//  http://localhost:8080/empleados/
    public String iniciar(ModelMap modelo){//Enviara datos a la vista (clave - valor)
        List<Empleado> empleados = empleadoServicio.listarEmpleados();
        List<Empleado> empleadosActivos = empleadoServicio.listarEmpleadosActivos();
        empleados.forEach(empleado -> logger.info(empleado.toString()));

        //Compartimos el modelo con la vista
        modelo.put("empleados", empleados);//"empleados" -> List<Empleado> total de empleados

        //modelo.put("totalDepartamentos", Departamento.values().length);//Enviamos la cantidad de deparamentos
        //modelo.put("empleadosActivos", empleadosActivos);
        //modelo.put("departamentos", Departamento.values());

        return "index";//index.jsp
    }
    /*
    @RequestMapping(value =   "/agregar", method = RequestMethod.GET)
    public String mostrarAgregar(){

        return "agregar";//agregar.jsp
    }
     */

    //empleadoForma modelAttribute en form de agregar.jsp
    @RequestMapping(value = "/agregar", method = RequestMethod.POST)
    public String agregar(@ModelAttribute("empleadoForma") Empleado empleado){
        logger.info("Empleadoa agregar: " + empleado);
        empleadoServicio.guardarEmpleado(empleado);
        return "redirect:/";//redirige al path /
    }

    @RequestMapping(value = "/agregar", method = RequestMethod.GET)
    public String mostrarAgregar(ModelMap model){
        //model.put("departamentos", Departamento.values());

        return "agregar";//agregar.jsp
    }

    @RequestMapping(value = "/editar", method = RequestMethod.GET)
    public String mostrarEditar(@RequestParam int idEmpleado, ModelMap model){
        Empleado empleado = empleadoServicio.buscarEmpleadoPorId(idEmpleado);
        //model.put("departamentos", Departamento.values());
        logger.info("Empleado a editar: " + empleado);
        model.put("empleado", empleado);
        return "editar";//editar.jsp
    }

    @RequestMapping(value = "/editar", method = RequestMethod.POST)
    public String editar(@ModelAttribute("empleadaoForma") Empleado empleado){
        logger.info("Empleado a guardar (editar):" + empleado);
        empleadoServicio.guardarEmpleado(empleado);
        return "redirect:/"; //para que se llame de neuvo e index para que se recargue la linea de empleados
    }

    @RequestMapping(value = "/eliminar", method = RequestMethod.GET)
    public String eliminar(@RequestParam int idEmpleado){
        Empleado empleadoEliminar = empleadoServicio.buscarEmpleadoPorId(idEmpleado);
        empleadoServicio.eliminarEmpleado(empleadoEliminar);
        return "redirect:/";
    }

    @RequestMapping(value = "/filtrar", method = RequestMethod.GET)
    public String filtrar(
            @RequestParam(required = false) Boolean activo,
            @RequestParam(required = false) Departamento departamento,
            ModelMap modelo){
        List<Empleado> empleados;
        if(activo != null && departamento != null){
            empleados = empleadoServicio.listarPorActivoYDepartamento(activo, departamento);
        }
        else if(activo != null){//departamento == null
            //empleados = empleadoServicio.listarEmpleadosActivos();
            empleados = empleadoServicio.listarPorActivo(activo);
        }
        else if(departamento != null){// activo == null
            empleados = empleadoServicio.listarPorDepartamento(departamento);
        }
        else{// activo == null and departamento == null
            empleados = empleadoServicio.listarEmpleados();
        }

        modelo.put("empleados", empleados);
        //modelo.put("departamentos", Departamento.values());

        //Debemosvolver a mandar
        List<Empleado> empleadosActivos = empleadoServicio.listarEmpleadosActivos();
        //modelo.put("totalDepartamentos", Departamento.values().length);//Enviamos la cantidad de deparamentos
        //modelo.put("empleadosActivos", empleadosActivos);


        return "index";
    }









}
