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
@WebServlet(name = "ModPoliza", urlPatterns = {"/ModPoliza"})
public class ModPoliza extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ModPoliza</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ModPoliza at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String[] cuenta = request.getParameterValues("cuenta[]");
        String[] concepto = request.getParameterValues("concepto[]");
        String[] abono = request.getParameterValues("abono[]");
        String[] cargo = request.getParameterValues("cargo[]");
        Object[] dato;
        String periodo = request.getParameter("periodo");
        String id_poliza = request.getParameter("id_poliza");
        String consulta = "";
        String id = "";
        float car = 0, abo = 0;
        for (int i = 0; i < abono.length; i++) {
            car = car + Float.parseFloat(cargo[i]);
            abo = abo + Float.parseFloat(abono[i]);
        }

        if (car == abo) {
            System.out.println("ID: "+id_poliza);
            consulta = "update Polizas set periodo = " + periodo + " where id_poliza = " + id_poliza;
            conexionDB.iniciarConexion();
            conexionDB.actualizar(consulta);
            consulta = "delete from PolizasCargos where id_poliza = " + id_poliza;
            conexionDB.actualizar(consulta);
            id = id_poliza;
            for (int i = 0; i < cuenta.length; i++) {
                consulta = "insert into PolizasCargos values (" + id + "," + abono[i] + "," + cargo[i] + ",'" + concepto[i] + "','" + cuenta[i] + "');";
                conexionDB.insertar(consulta);
            }
            conexionDB.cerrarConexion();

            Object[] mov, tipo, cuenta2, valor;
            conexionDB.iniciarConexion();
            mov = conexionDB.consultaCompleta("select noCuenta,concepto,abono,cargo from PolizasCargos where id_poliza  = " + id, 4);
            tipo = conexionDB.consultaCompleta("select tipo,periodo from Polizas where id_poliza = " + id, 2);
            cuenta2 = conexionDB.consultaCompleta("select CONCAT(noCuenta,' ',nombre) from catalogocuentas", 1);
            valor = conexionDB.consultaCompleta("select noCuenta from catalogocuentas", 1);
            conexionDB.cerrarConexion();
            RequestDispatcher a;
            request.getSession().setAttribute("movimientos", mov);
            request.getSession().setAttribute("tipo", tipo);
            request.getSession().setAttribute("cuentas", cuenta2);
            request.getSession().setAttribute("valor", valor);
            request.getSession().setAttribute("va4", "Modificado");
            request.getSession().setAttribute("id_global", id);
            a = request.getRequestDispatcher("/modPolizas.jsp");
            a.forward(request, response);

        } else {
            Object[] mov, tipo, cuenta2, valor;
            conexionDB.iniciarConexion();
            mov = conexionDB.consultaCompleta("select noCuenta,concepto,abono,cargo from PolizasCargos where id_poliza  = " + id, 4);
            tipo = conexionDB.consultaCompleta("select tipo,periodo from Polizas where id_poliza = " + id, 2);
            cuenta2 = conexionDB.consultaCompleta("select CONCAT(noCuenta,' ',nombre) from catalogocuentas", 1);
            valor = conexionDB.consultaCompleta("select noCuenta from catalogocuentas", 1);
            conexionDB.cerrarConexion();
            RequestDispatcher a;
            request.getSession().setAttribute("movimientos", mov);
            request.getSession().setAttribute("tipo", tipo);
            request.getSession().setAttribute("cuentas", cuenta2);
            request.getSession().setAttribute("valor", valor);
            request.getSession().setAttribute("va4", "No capturado, no coindicen los montos");
            request.getSession().setAttribute("id_global", id);
            a = request.getRequestDispatcher("/modPolizas.jsp");
            a.forward(request, response);
        }
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
