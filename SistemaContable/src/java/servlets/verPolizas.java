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
@WebServlet(name = "verPolizas", urlPatterns = {"/verPolizas"})
public class verPolizas extends HttpServlet {

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
        a = request.getRequestDispatcher("/verPolizas.jsp");
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
        float totalA=0,totalB=0;
        conexionDB.iniciarConexion();
        mov = conexionDB.consultaCompleta("select noCuenta,concepto,abono,cargo from PolizasCargos where id_poliza  = "+id, 4);
        tipo = conexionDB.consultaCompleta("select tipo,periodo,fecha from Polizas where id_poliza = "+id, 3);
        cuenta = conexionDB.consultaCompleta("select CONCAT(noCuenta,' ',nombre) from catalogocuentas", 1);
        valor = conexionDB.consultaCompleta("select noCuenta from catalogocuentas", 1);
        conexionDB.cerrarConexion();
        for (int i = 0; i < mov.length; i=i+4) {
            totalA += Float.parseFloat(mov[i+2].toString());
            totalB += Float.parseFloat(mov[i+3].toString());
        }
        RequestDispatcher a;
        request.getSession().setAttribute("movimientos", mov);
        request.getSession().setAttribute("tipo", tipo);
        request.getSession().setAttribute("cuentas", cuenta);
        request.getSession().setAttribute("valor", valor);
        request.getSession().setAttribute("id_global", id);
        request.getSession().setAttribute("totalA", totalA);
        request.getSession().setAttribute("totalB", totalB);
        a = request.getRequestDispatcher("/verPoliza.jsp");
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
