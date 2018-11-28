/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Grapha
 */
@WebServlet(name = "BalanzeGeneral", urlPatterns = {"/BalanzeGeneral"})
public class BalanzeGeneral extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String consulta = "select noCuenta,nombre,tipo from CatalogoCuentas";
        Object[] datos, datos2;
        String[] separado;
        ArrayList<String> cuentasMayor = new ArrayList();
        ArrayList<String> cuentasMayorS = new ArrayList();
        ArrayList<String> cuentasMenor = new ArrayList();
        ArrayList<String> cuentasMenorS = new ArrayList();
        float[] totalesD,totalesH;
        Integer[] relaciones;

        conexionDB.iniciarConexion();
        datos = conexionDB.consultaCompleta(consulta, 3);
        for (int i = 0; i < datos.length; i = i + 3) {
            separado = String.valueOf(datos[i]).split("");
            if (separado[5].equals("0") && separado[6].equals("0") && separado[7].equals("0")) {
                cuentasMayor.add(datos[i].toString());
                cuentasMayorS.add(separado[0] + separado[1] + separado[2] + separado[3]);
            } else {
                cuentasMenor.add(datos[i].toString());
                cuentasMenorS.add(separado[0] + separado[1] + separado[2] + separado[3]);
            }
        }
        relaciones = new Integer[cuentasMenor.size()];
        totalesD = new float[cuentasMayor.size()];
        totalesH = new float[cuentasMayor.size()];
        for (int i = 0; i < totalesD.length; i++) {
            totalesD[i]=0;
            totalesH[i]=0;
        }
        
        for (int i = 0; i < cuentasMenor.size(); i++) {
            
            for (int j = 0; j < cuentasMayor.size(); j++) {
                if (cuentasMayorS.get(j).equals(cuentasMenorS.get(i))) {
                    relaciones[i] = j;
                }
            }

        }
        
        for (int i = 0; i < cuentasMenor.size(); i++) {
            consulta = "select cargo,abono from PolizasCargos where noCuenta = '" + cuentasMenor.get(i)+"';";
            datos2 = conexionDB.consultaCompleta(consulta, 2);
            for (int j = 0; j < datos.length; j=j+2) {
                totalesD[relaciones[i]] = totalesD[relaciones[i]] + Float.parseFloat(datos[j].toString());
                totalesH[relaciones[i]] = totalesH[relaciones[i]] + Float.parseFloat(datos[j+1].toString());
            }
        }
        
        conexionDB.cerrarConexion();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
