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
 * @author Grapha
 */
@WebServlet(name = "AltaCatalogo", urlPatterns = {"/AltaCatalogo"})
public class AltaCatalogo extends HttpServlet {

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
            out.println("<title>Servlet AltaCatalogo</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AltaCatalogo at " + request.getContextPath() + "</h1>");
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
        Object[] cuenta;
        String noCuenta = request.getParameter("noCuenta");
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        String tipo = request.getParameter("tipo");
        int con = 0;

        String sql = "insert into catalogocuentas values "
                + "('" + noCuenta + "','" + nombre + "','" + tipo + "','" + descripcion + "');";
        conexionDB.iniciarConexion();
        cuenta = conexionDB.consultaCompleta("select noCuenta from catalogocuentas where noCuentas = '" + noCuenta+"'", 1);
        conexionDB.cerrarConexion();
        if (cuenta != null) {
            for (Object cuenta1 : cuenta) {
                con = 1;
            }
            if (con == 0) {
                if (insertarCatalogo(sql)) {
                    RequestDispatcher a;
                    request.getSession().setAttribute("nombre_param", "Insertado");
                    a = request.getRequestDispatcher("/AltaCatalogo.jsp");
                    a.forward(request, response);
                } else {
                    RequestDispatcher a;
                    request.getSession().setAttribute("nombre_param", "Error desconocido");
                    a = request.getRequestDispatcher("/AltaCatalogo.jsp");
                    a.forward(request, response);
                }
            } else {
                RequestDispatcher a;
                request.getSession().setAttribute("nombre_param", "No. de catalogo ya existe");
                a = request.getRequestDispatcher("/AltaCatalogo.jsp");
                a.forward(request, response);
            }
        } else {
            if (insertarCatalogo(sql)) {
                RequestDispatcher a;
                request.getSession().setAttribute("nombre_param", "Insertado");
                a = request.getRequestDispatcher("/AltaCatalogo.jsp");
                a.forward(request, response);
            } else {
                RequestDispatcher a;
                request.getSession().setAttribute("nombre_param", "Error desconocido");
                a = request.getRequestDispatcher("/AltaCatalogo.jsp");
                a.forward(request, response);
            }
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
