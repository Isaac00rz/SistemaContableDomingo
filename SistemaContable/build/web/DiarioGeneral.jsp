<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Balanza de comprobacion</title>
        <style type="text/css" media="screen">
            /*la directiva include copia el contenido de un archivo y lo incrusta en la pagina*/
            <%@ include file="estilos/Barra.css" %>
            <%@ include file="estilos/fonts.css" %>
            <%@ include file="estilos/tablas.css" %>
        </style>
        <%
            Object[] cuentas = (Object[]) session.getAttribute("cuentas");
            float[] deudorD = (float[]) session.getAttribute("deudorD");
            float[] acredorD = (float[]) session.getAttribute("acredorD");
            float[] totalSaldoD = (float[]) session.getAttribute("totalSaldoD");
            float[] totalSaldoA = (float[]) session.getAttribute("totalSaldoA");
            float s1 = (Float) session.getAttribute("s1");
            float s2 = (Float) session.getAttribute("s2");
            float s3 = (Float) session.getAttribute("s3");
            float s4 = (Float) session.getAttribute("s4");
            String periodo = (String) session.getAttribute("periodo");
        %>
    <div id="navegador">
        <header>
            <nav>	
                <ul> 
                    <li><a href="Menu.jsp"><span class="primero"><i class="icon icon-home"></i></span>HOME</a></li>
                    <li><a href="elegirFechaBalance.jsp"><span class="segundo"><i class="icon icon-clipboard"> </i></span>Balanza Comprobacion</a></li>
                    <li><a href="menuPolizas.jsp"><span class="tercero"><i class="icon icon-cloud"> </i></span>Diario General</a></li>
                    <li><a href="otro.jsp"><span class="cuarto"><i class="icon icon-superscript"> </i></span>Estado de resultado</a></li>
                </ul>
            </nav>
        </header>
    </div>
</head>
<body>
    <h1>Balanza General, periodo <%=periodo%></h1>
    <table>
        <tr>
            <th>-</th>
            <th>Movimientos</th>
            <th>-</th>
            <th>Saldos</th>
            <th>-</th>
        </tr>
        <tr>
            <th>Cuentas</th>
            <th>Deudor</th>
            <th>Acredor</th>
            <th>Deudor</th>
            <th>Acredor</th>
        </tr>
        <%
            for (int i = 0; i < cuentas.length; i++) {%>
        <tr>
            <th><%= cuentas[i]%></th>
            <th><%= deudorD[i]%></th>
            <th><%= acredorD[i]%></th>
            <th><%= totalSaldoD[i]%></th>
            <th><%= totalSaldoA[i]%></th>
                <% }%>
        </tr> 
        <th>Totales:</th>
        <th><%= s1%></th>
        <th><%= s2%></th>
        <th><%= s3%></th>
        <th><%= s4%></th>
    </table>

</body>
</html>
