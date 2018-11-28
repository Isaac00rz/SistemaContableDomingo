/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author IsaacUlises
 */
@WebServlet(name = "SaldoInicial", urlPatterns = {"/SaldoInicial"})
public class SaldoInicial extends HttpServlet {

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
        Object[] datos;
        String consulta = "select noCuenta,nombre,tipo from CatalogoCuentas";
        String[] separado;
        ArrayList<String> cuentasMayor = new ArrayList();
        conexionDB.iniciarConexion();
        datos = conexionDB.consultaCompleta(consulta, 3);
        for (int i = 0; i < datos.length; i = i + 3) {
            separado = String.valueOf(datos[i]).split("");
            if (separado[5].equals("0") && separado[6].equals("0") && separado[7].equals("0")) {
                cuentasMayor.add(datos[i].toString());
            }
        }
        conexionDB.cerrarConexion();
        datos = null;
        datos = new Object[cuentasMayor.size()];
        for (int i = 0; i < datos.length; i++) {
            datos[i] = cuentasMayor.get(i);
        }
        RequestDispatcher a;
        request.getSession().setAttribute("cuentasM", datos);
        request.getSession().setAttribute("va8", "-");
        a = request.getRequestDispatcher("/altaSaldoInicial.jsp");
        a.forward(request, response);
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
        String noCuenta = request.getParameter("cuenta");
        String debe = request.getParameter("debe");
        String haber = request.getParameter("haber");
        String sql = "insert into CatalogoCuentasMovimientos values "
                + "('" + noCuenta + "'," + haber + ","+debe+");";

        if (insertarCatalogo(sql)) {
            Object[] datos;
            String consulta = "select noCuenta,nombre,tipo from CatalogoCuentas";
            String[] separado;
            ArrayList<String> cuentasMayor = new ArrayList();
            conexionDB.iniciarConexion();
            datos = conexionDB.consultaCompleta(consulta, 3);
            for (int i = 0; i < datos.length; i = i + 3) {
                separado = String.valueOf(datos[i]).split("");
                if (separado[5].equals("0") && separado[6].equals("0") && separado[7].equals("0")) {
                    cuentasMayor.add(datos[i].toString());
                }
            }
            conexionDB.cerrarConexion();
            datos = null;
            datos = new Object[cuentasMayor.size()];
            for (int i = 0; i < datos.length; i++) {
                datos[i] = cuentasMayor.get(i);
            }
            RequestDispatcher a;
            request.getSession().setAttribute("cuentasM", datos);
            request.getSession().setAttribute("va8", "Insertado");
            a = request.getRequestDispatcher("/altaSaldoInicial.jsp");
            a.forward(request, response);
        } else {
            Object[] datos;
            String consulta = "select noCuenta,nombre,tipo from CatalogoCuentas";
            String[] separado;
            ArrayList<String> cuentasMayor = new ArrayList();
            conexionDB.iniciarConexion();
            datos = conexionDB.consultaCompleta(consulta, 3);
            for (int i = 0; i < datos.length; i = i + 3) {
                separado = String.valueOf(datos[i]).split("");
                if (separado[5].equals("0") && separado[6].equals("0") && separado[7].equals("0")) {
                    cuentasMayor.add(datos[i].toString());
                }
            }
            conexionDB.cerrarConexion();
            datos = null;
            datos = new Object[cuentasMayor.size()];
            for (int i = 0; i < datos.length; i++) {
                datos[i] = cuentasMayor.get(i);
            }
            RequestDispatcher a;
            request.getSession().setAttribute("cuentasM", datos);
            request.getSession().setAttribute("va8", "No insertado");
            a = request.getRequestDispatcher("/altaSaldoInicial.jsp");
            a.forward(request, response);
        }
    }

    private boolean insertarCatalogo(String consulta) {
        boolean re = false;
        conexionDB.iniciarConexion();
        re = conexionDB.insertar(consulta);
        conexionDB.cerrarConexion();
        return re;
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
