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
        <title>Mod/Baja de Polizas</title>
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
                </ul>
            </nav>
        </header>
    </div>
</head>
<% String a = (String) session.getAttribute("va2");
        if (a == null) { %>
<h3></h3>
<% } else {%>
<h1> <%=a%></h1>
<% }%>
<body>
    <table>
        <tr>
            <th>No Cuenta</th>
            <th>Nombre</th>
            <th>Tipo</th>
            <th>Descripción</th>
        </tr>
        <% Object[] r = (Object[]) session.getAttribute("cuentas");
                for (int i = 0; i < r.length; i = i + 4) {%>
        <tr>
            <th><%= r[i]%></th>
            <th><%= r[i + 1]%></th>
            <th><%= r[i + 2]%></th>
            <th><%= r[i + 3]%></th>
                <% }%>
        </tr>    
    </table>
</body>
</html>
