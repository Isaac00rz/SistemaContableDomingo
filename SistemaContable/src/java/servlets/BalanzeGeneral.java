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
        String periodo = request.getParameter("periodo");;
        String consulta = "select noCuenta,nombre,tipo from CatalogoCuentas";
        String sql;
        Object[] datos, datos2, tipo, cuentasMayorT;
        String[] separado;
        ArrayList<String> cuentasMayor = new ArrayList();
        ArrayList<String> cuentasMayorS = new ArrayList();
        ArrayList<String> cuentasMenor = new ArrayList();
        ArrayList<String> cuentasMenorS = new ArrayList();
        float[] totalesD, totalesH, totalSaldoD, totalSaldoA;
        Integer[] relaciones;
        float s1 = 0, s2 = 0, s3 = 0, s4 = 0;

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
        totalSaldoD = new float[cuentasMayor.size()];
        totalSaldoA = new float[cuentasMayor.size()];
        for (int i = 0; i < totalesD.length; i++) {
            totalesD[i] = 0;
            totalesH[i] = 0;
        }

        for (int i = 0; i < cuentasMenor.size(); i++) {

            for (int j = 0; j < cuentasMayor.size(); j++) {
                if (cuentasMayorS.get(j).equals(cuentasMenorS.get(i))) {
                    relaciones[i] = j;
                }
            }

        }

        for (int i = 0; i < cuentasMenor.size(); i++) {
            consulta = "select cargo,abono from PolizasCargos inner join Polizas on PolizasCargos.id_Poliza = Polizas.id_Poliza where noCuenta = '" + cuentasMenor.get(i) + "' and periodo = " + periodo;
            datos2 = conexionDB.consultaCompleta(consulta, 2);
            for (int j = 0; j < datos2.length; j = j + 2) {
                totalesD[relaciones[i]] = totalesD[relaciones[i]] + Float.parseFloat(datos2[j].toString());
                totalesH[relaciones[i]] = totalesH[relaciones[i]] + Float.parseFloat(datos2[j + 1].toString());
            }
        }

        for (int i = 0; i < cuentasMayor.size(); i++) {
            consulta = "select cargo,abono from CatalogoCuentasMovimientos where noCuenta = '" + cuentasMayor.get(i) + "';";
            datos2 = conexionDB.consultaCompleta(consulta, 2);
            if (datos2 != null) {
                totalesD[i] = totalesD[i] + Float.parseFloat(datos2[0].toString());
                totalesH[i] = totalesH[i] + Float.parseFloat(datos2[1].toString());
            }

        }

        cuentasMayorT = new Object[cuentasMayor.size()];
        for (int i = 0; i < cuentasMayor.size(); i++) {
            cuentasMayorT[i] = cuentasMayor.get(i);
            sql = "select tipo from CatalogoCuentas where noCuenta = '" + cuentasMayor.get(i) + "'";
            tipo = conexionDB.consultaCompleta(sql, 1);
            if (tipo[0].toString().equals("Acredora")) {
                totalSaldoD[i] = 0;
                totalSaldoA[i] = totalesH[i] - totalesD[i];
            } else {
                totalSaldoD[i] = totalesH[i] - totalesD[i];
                totalSaldoA[i] = 0;
            }
        }

        conexionDB.cerrarConexion();
        for (int i = 0; i < cuentasMayor.size(); i++) {
            s1 += totalesH[i];
            s2 += totalesD[i];
            s3 += totalSaldoD[i];
            s4 += totalSaldoA[i];
        }
        RequestDispatcher a;
        request.getSession().setAttribute("cuentas", cuentasMayorT);
        request.getSession().setAttribute("deudorD", totalesH);
        request.getSession().setAttribute("acredorD", totalesD);
        request.getSession().setAttribute("totalSaldoD", totalSaldoD);
        request.getSession().setAttribute("totalSaldoA", totalSaldoA);
        request.getSession().setAttribute("s1", s1);
        request.getSession().setAttribute("s2", s2);
        request.getSession().setAttribute("s3", s3);
        request.getSession().setAttribute("s4", s4);
        request.getSession().setAttribute("periodo", periodo);
        a = request.getRequestDispatcher("/balanzaGeneral.jsp");
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
