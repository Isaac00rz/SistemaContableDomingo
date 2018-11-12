/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ModCatalogo", urlPatterns = {"/ModCatalogo"})
public class ModCatalogo extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Object[] cuenta;
            conexionDB.iniciarConexion();
            cuenta = conexionDB.consultaCompleta("select noCuenta,nombre,tipo from catalogocuentas", 3);
            conexionDB.cerrarConexion();
            RequestDispatcher a;
            request.getSession().setAttribute("cuentas", cuenta);
            a = request.getRequestDispatcher("/ModificacionCatalogo.jsp");
            a.forward(request, response);
        }
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
        String noCuenta = request.getParameter("noCuenta");
        String noCuentaV = request.getParameter("noCuentaV");
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        String tipo = request.getParameter("tipo");

        conexionDB.iniciarConexion();
        if (conexionDB.actualizar("update catalogocuentas"
                + " set noCuenta = '" + noCuenta + "',nombre = '" + nombre + "',"
                + "descripcion = '" + descripcion + "',tipo = '" + tipo + "'"
                + " where noCuenta = '" + noCuentaV + "';")) {
            RequestDispatcher a;
            request.getSession().setAttribute("nombre_param", "Actualizado");
            a = request.getRequestDispatcher("/ModCuenta.jsp?noCuenta=" + noCuenta);
            a.forward(request, response);
        } else {
            RequestDispatcher a;
            request.getSession().setAttribute("nombre_param", "Error");
            a = request.getRequestDispatcher("/ModCuenta.jsp?noCuenta=" + noCuenta);
            a.forward(request, response);
        }
        conexionDB.cerrarConexion();
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
