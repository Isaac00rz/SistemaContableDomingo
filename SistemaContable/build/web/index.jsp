<!DOCTYPE HTML>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="Descripcion" content="Sistema contable"/>
        <title>Inicio sesion</title>
        <style type="text/css" media="screen">
            /*la directiva include copia el contenido de un archivo y lo incrusta en la pagina*/
            <%@ include file="estilos/iniciosesion.css" %>
        </style>
    </head>

    <body>
        <%
            String r = (String) session.getAttribute("nombre_param");
            if (r == null) { %>
        <h3></h3>
        <% } else{ %>
        <h1> <%=r%></h1>
        <% }%>
 
        
        <div id="inicio">
            <section>
                <article>
                    <header>
                        <hgroup>
                            <form  method="POST" action="InicioSesion">
                                <h1> Inicio de Sesion </h1>
                                <input type="text" max-length="20" placeholder="Usuario" name="usuario"/>
                                <input type="password" max-length="20" placeholder="Password" name="pass"/>
                                <button> Inicia Sesion</button>
                            </form>
                        </hgroup>
                    </header>
                </article>
            </section>
        </div>
        <hr>
    </body>
</html>