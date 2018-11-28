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
                    <li><a href="VerCatalogo"><span class="quinto"><i class="icon icon-superscript"> </i></span>Ver</a></li>
                    <li><a href="SaldoInicial"><span class="quinto"><i class="icon icon-superscript"> </i></span>Saldo Inicial</a></li>
                </ul>
            </nav>
        </header>
    </div>
    <%Object[] cuentas = (Object[]) session.getAttribute("cuentasM");%>
    <% String r = (String) session.getAttribute("var8");
        if (r == null) { %>
    <h3></h3>
    <% } else {%>
    <h1> <%=r%></h1>
    <% }%>
</head>
<form  method="POST" action="SaldoInicial">
    <fieldset>
        <legend>Saldo inicial</legend>
        <p>
            <label for ="cuenta">No. Cuenta</label>: <select name="cuenta" required> <%for (int i = 0; i < cuentas.length; i++) {%><option value = "<%=cuentas[i]%>"><%=cuentas[i]%> </option><%}%></select><br/> 
            <label for ="debe">Debe</label>: <input type="number" name = "debe" id = "debe" size = "30" maxlength = "40" placeholder="Debe" required><br/> 
            <label for ="haber">Haber</label>: <input type="number" name = "haber" id = "haber" size = "30" maxlength = "40" placeholder="Haber" required><br/> 
        <hr>
        <div class = "boton">
            <input type="submit" value="Enviar" ></code>	
        </div>
        </p>
    </fieldset>
</form>
</html>