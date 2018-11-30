<%-- 
    Document   : BajaModPolizas
    Created on : 25/11/2018, 06:34:24 PM
    Author     : IsaacUlises
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver Catalogo Cuentae</title>
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
                        <li><a href="AltaPolizaDiario"><span class="segundo"><i class="icon icon-clipboard"> </i></span>Polizas de diario</a></li>
                        <li><a href="altaPolizaDeIngresos.jsp"><span class="tercero"><i class="icon icon-cloud"> </i></span>Polizas de ingreso</a></li>
                        <li><a href="AltaPolizaEgreso"><span class="cuarto"><i class="icon icon-superscript"> </i></span>Poliza de egreso</a></li>
                        <li><a href="altaPolizaDeCompras.jsp"><span class="quinto"><i class="icon icon-lightbulb"> </i></span>Poliza de Compras</a></li>
                        <li><a href="altaPolizaDeVentas.jsp"><span class="sexto"><i class="icon icon-tools"> </i></span>Poliza de ventas</a></li>
                        <li><a href="BajaModPolizas"><span class="sexto"><i class="icon icon-tools"> </i></span>Modi/Baja</a></li>
                        <li><a href="verPolizas"><span class="segundo"><i class="icon icon-tools"> </i></span>Ver</a></li>
                       
                </ul>
            </nav>
        </header>
    </div>
</head>
<body>
    <table>
        <tr>
            <th>ID Poliza</th>
            <th>Tipo</th>
            <th>Periodo</th>
            <th>Fecha</th>
            <th>Ver</th>
        </tr>
        <% Object[] r = (Object[]) session.getAttribute("polizas");
                for (int i = 0; i < r.length; i = i + 4) {%>
         <form role="form" name="form" id = "form" method="post" action="verPolizas">      
        <tr>
            <th><input type="text" name="id_p" value="<%= r[i]%>" disabled></th>
            <th><%= r[i + 1]%></th>
            <th><%= r[i + 2]%></th>
            <th><%= r[i + 3]%></th>
            <td><input type="submit" value="Ver"></td>
            <th><input type="hidden" name="id_poliza" value="<%= r[i]%>"></th>
            
        </tr>  
        </form>
        <% }%>
    </table>
</body>
</html>