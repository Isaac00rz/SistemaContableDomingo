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
@WebServlet(name = "BajaModPolizas", urlPatterns = {"/BajaModPolizas"})
public class BajaModPolizas extends HttpServlet {

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
        Object[] polizas, valor;
        conexionDB.iniciarConexion();
        polizas = conexionDB.consultaCompleta("select id_Poliza,tipo,periodo,fecha from Polizas", 4);
        conexionDB.cerrarConexion();
        RequestDispatcher a;
        request.getSession().setAttribute("polizas", polizas);
        request.getSession().setAttribute("va3", "-");
        a = request.getRequestDispatcher("/BajaModPolizas.jsp");
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
        String id = request.getParameter("id_poliza");
        Object[] mov, tipo,cuenta,valor;
        conexionDB.iniciarConexion();
        mov = conexionDB.consultaCompleta("select noCuenta,concepto,abono,cargo from PolizasCargos where id_poliza  = "+id, 4);
        tipo = conexionDB.consultaCompleta("select tipo,periodo from Polizas where id_poliza = "+id, 2);
        cuenta = conexionDB.consultaCompleta("select CONCAT(noCuenta,' ',nombre) from catalogocuentas", 1);
        valor = conexionDB.consultaCompleta("select noCuenta from catalogocuentas", 1);
        conexionDB.cerrarConexion();
        RequestDispatcher a;
        request.getSession().setAttribute("movimientos", mov);
        request.getSession().setAttribute("tipo", tipo);
        request.getSession().setAttribute("cuentas", cuenta);
        request.getSession().setAttribute("valor", valor);
        request.getSession().setAttribute("va4", "-");
        request.getSession().setAttribute("id_global", id);
        a = request.getRequestDispatcher("/modPolizas.jsp");
        a.forward(request, response);
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
