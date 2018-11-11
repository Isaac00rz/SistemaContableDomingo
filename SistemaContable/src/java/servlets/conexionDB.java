package servlets;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class conexionDB {
    public static Connection conexion;
    public static Statement at;
    public static ResultSet rs;
        
    public static void iniciarConexion(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/SistemaContable","root","");
            
        }catch(ClassNotFoundException | SQLException  e){
            System.out.println("Error en la conexion iniciar");
        }
    }
    
    public static Object[] consultaCompleta(String consulta,int columnas){
        ArrayList<Object> datos = new ArrayList();
        Object[] resultados;
        try {
            at = conexion.createStatement();
            rs = at.executeQuery(consulta);
            while (rs.next()) {
                for(int i=0;i<columnas;i++){
                    datos.add(rs.getObject(i+1));
                }               
            }
            resultados = new Object[datos.size()];
            for(int i=0;i<resultados.length;i++){
                resultados[i] = datos.get(i);
            }
            return resultados;
        } catch (SQLException ex) {
            System.out.println("Error en la conexion consultar");
            return null;
        }
    }
    
    public static boolean actualizar(String consulta){
        try {
            at = conexion.createStatement();
            at.executeUpdate(consulta);
            return true;
        } catch (SQLException ex) {
            System.out.println("Error en la conexion actualizar");
            return false;
            
        }
    }
    
    public static boolean insertar(String consulta){
        try {
            at = conexion.createStatement();
            at.execute(consulta);
            return true;
        } catch (SQLException ex) {
            System.out.println("Error en la conexion actualizar");
            return false;
            
        }
    }
    public static void cerrarConexion(){
        try {
            conexion.close();
        } catch (SQLException ex) {
           System.out.println("Error en el cierre de la conexion");
        }
    }
}
