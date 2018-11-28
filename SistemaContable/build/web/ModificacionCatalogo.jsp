<%-- 
    Document   : ModificacionCatalogo
    Created on : 11/11/2018, 08:07:58 PM
    Author     : IsaacUlises
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificacion Catalogo Cuentae</title>
        <style type="text/css" media="screen">
            /*la directiva include copia el contenido de un archivo y lo incrusta en la pagina*/
            <%@ include file="estilos/Barra.css" %>
            <%@ include file="estilos/fonts.css" %>
            <%@ include file="estilos/tablas.css" %>
        </style>
    <div id="navegador">
        <header>
            <nav>	
                <ul> 
                    <li><a href="index.jsp"><span class="primero"><i class="icon icon-home"></i></span>HOME</a></li>
                    <li><a href="AltaCatalogo.jsp"><span class="segundo"><i class="icon icon-clipboard"> </i></span>Alta</a></li>
                    <li><a href="ModCatalogo"><span class="tercero"><i class="icon icon-cloud"> </i></span>Modificacion</a></li>
                    <li><a href="BajaCatalogo"><span class="cuarto"><i class="icon icon-superscript"> </i></span>Baja</a></li>
                    <li><a href="VerCatalogo"><span class="quinto"><i class="icon icon-superscript"> </i></span>Ver</a></li>
                    <li><a href="SaldoInicial"><span class="quinto"><i class="icon icon-superscript"> </i></span>Saldo Inicial</a></li>
                </ul>
            </nav>
        </header>
    </div>
    </head>
    <body>
        <table>
            <tr>
                <th>No Cuenta</th>
                <th>Nombre</th>
                <th>Tipo</th>
                <th>Accion</th>
            </tr>
            <% Object[] r = (Object[]) session.getAttribute("cuentas");
            for (int i = 0; i < r.length; i=i+3) {%>
        <tr>
            <th><%= r[i]%></th>
            <th><%= r[i+1]%></th>
            <th><%= r[i+2]%></th>
            <th><a href="ModCuenta.jsp?noCuenta=<%= r[i]%>">Modificar</a></th>
        <% }%>
        </tr>    
        </table>
    </body>
</html>
