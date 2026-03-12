package gm.empleados.controlador;

import gm.empleados.modelo.Departamento;
import gm.empleados.modelo.Empleado;
import gm.empleados.servicio.EmpleadoServicio;
import jakarta.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class IndexControlador {
    private static final Logger logger = LoggerFactory.getLogger(IndexControlador.class);

    @Autowired
    EmpleadoServicio empleadoServicio;

    @RequestMapping(value = "/", method = RequestMethod.GET)//  http://localhost:8080/empleados/
    public String iniciar(ModelMap modelo){//Enviara datos a la vista (clave - valor)
        List<Empleado> empleados = empleadoServicio.listarEmpleados();
        List<Empleado> empleadosActivos = empleadoServicio.listarEmpleadosActivos();
        empleados.forEach(empleado -> logger.info(empleado.toString()));

        //Compartimos el modelo con la vista
        modelo.put("empleados", empleados);//"empleados" -> List<Empleado> total de empleados
        modelo.put("totalDepartamentos", Departamento.values().length);//Enviamos la cantidad de deparamentos
        modelo.put("empleadosActivos", empleadosActivos);
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
        model.put("departamentos", Departamento.values());
        //modelo.put("empleadoForma", new Empleado());
        return "agregar";//agregar.jsp
    }




}
