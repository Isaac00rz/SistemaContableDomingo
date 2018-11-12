<%-- 
    Document   : BaCuenta
    Created on : 11/11/2018, 10:33:46 PM
    Author     : IsaacUlises
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Baja Catalogo Cuentae</title>
        <style type="text/css" media="screen">
            /*la directiva include copia el contenido de un archivo y lo incrusta en la pagina*/
            <%@ include file="estilos/Barra.css" %>
            <%@ include file="estilos/fonts.css" %>
            <%@ include file="estilos/Formulario.css" %>
        </style>
        <% String noCuenta = request.getParameter("noCuenta"); %>
    <div id="navegador">
        <header>
            <nav>	
                <ul> 
                    <li><a href="index.jsp"><span class="primero"><i class="icon icon-home"></i></span>HOME</a></li>
                    <li><a href="AltaCatalogo.jsp"><span class="segundo"><i class="icon icon-clipboard"> </i></span>Alta</a></li>
                    <li><a href="ModCatalogo"><span class="tercero"><i class="icon icon-cloud"> </i></span>Modificacion</a></li>
                    <li><a href="BajaCatalogo"><span class="cuarto"><i class="icon icon-superscript"> </i></span>Baja</a></li>
                    <li><a href="VerCatalogos.jsp"><span class="quinto"><i class="icon icon-superscript"> </i></span>Ver</a></li>
                </ul>
            </nav>
        </header>
    </div>
    <body>
        <form  method="POST" action="BaCatalogo">
    <fieldset>
        <p>
        <h1>¿Eliminar?</h1>
            <label for ="noCuenta">No. Cuenta</label>: <input type="text" name = "noCuenta" id = "noCuenta" value ="<%=noCuenta%>"  disabled><br/> 
            <label for ="noCuentaV"></label> <input type="hidden" name = "noCuentaV" id = "noCuentaV" value ="<%=noCuenta%>" >
        <hr>
        <div class = "boton">
            <input type="submit" value="Borrar:" ></code>	
        </div>
        </p>
    </fieldset>
</form>
    </body>
</html>
