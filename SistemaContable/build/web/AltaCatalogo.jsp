<%-- 
    Document   : AltaCatalogo
    Created on : 11/11/2018, 12:41:55 PM
    Author     : IsaacUlises
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alta Catalogo Cuentae</title>
        <style type="text/css" media="screen">
            /*la directiva include copia el contenido de un archivo y lo incrusta en la pagina*/
            <%@ include file="estilos/Barra.css" %>
            <%@ include file="estilos/fonts.css" %>
            <%@ include file="estilos/Formulario.css" %>
        </style>
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
    <% String r = (String) session.getAttribute("nombre_param");
        if (r == null) { %>
    <h3></h3>
    <% } else {%>
    <h1> <%=r%></h1>
    <% }%>
</head>
<form  method="POST" action="AltaCatalogo">
    <fieldset>
        <legend>Datos De la Cuenta</legend>
        <p>
            <label for ="noCuenta">No. Cuenta</label>: <input type="text" name = "noCuenta" id = "noCuenta" size = "30" maxlength = "40" placeholder="No. Cuenta" autofocus required><br/> 
            <label for ="nombre">Nombre</label>: <input type="text" name = "nombre" id = "nombre" size = "30" maxlength = "40" placeholder="Nombre" required><br/> 
            <label for ="descripcion">Descripción</label>: <input type="text" name = "descripcion" id = "descripcion" size = "30" maxlength = "250" placeholder="Descripcion" required><br/> 
        <hr>
        <p>Tipo</p>
        <label for="tipo">Adeudora</label><input type="radio" name="tipo" value="Adeudora" id="tipo" checked/><br/>
        <label for="tipo">Acredora</label><input type="radio" name="tipo" value="Acredora" id="tipo" /><br/>
        <hr>
        <div class = "boton">
            <input type="submit" value="Enviar" ></code>	
        </div>
        </p>
    </fieldset>
</form>
</html>
