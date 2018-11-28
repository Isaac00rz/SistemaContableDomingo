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
        <title>Balanza de comprobacion</title>
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
    <h1>Elegir periodo</h1>
    
<form role="form" name="form" id = "form" method="post" action="BalanzeGeneral">
                <select name="periodo">
                    <option value ="1">01-Enero</option>
                    <option value ="2">02-Febrero</option>
                    <option value ="3">03-Marzo</option>
                    <option value ="4">04-Abril</option>
                    <option value ="5">05-Mayo</option>
                    <option value ="6">06-Junio</option>
                    <option value ="7">07-Julio</option>
                    <option value ="8">08-Agosto</option>
                    <option value ="9">09-Semptiembre</option>
                    <option value ="10">10-Octubre</option>
                    <option value ="11">11-Novimebre</option>
                    <option value ="12">12-Diciembre</option>
                </select>
    <button id="aceptar" name="aceptar" type="submit"  
                        ><b>Ver</b></button>
</form>
</body>
</html>

