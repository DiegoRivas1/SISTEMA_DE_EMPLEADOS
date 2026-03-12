package gm.empleados.modelo;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Data //Get y set
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Empleado {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer idEmpleado;//id_empleado
    String nombreEmpleado;
    @Enumerated(EnumType.STRING)
    Departamento departamento;
    String sueldo;
    boolean activo;

    //Solo peude tener metoidos que operen ensu misma entidad,m con sus datos
    public String getEstado() {
        return activo ? "Activo" : "Inactivo";
    }
}











