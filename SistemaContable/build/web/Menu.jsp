<!DOCTYPE HTML>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="Descripcion" content="Sistema contable"/>
        <title>Menu</title>
        <style type="text/css" media="screen">
            /*la directiva include copia el contenido de un archivo y lo incrusta en la pagina*/
            <%@ include file="estilos/Barra.css" %>
            <%@ include file="estilos/fonts.css" %>
        </style>
    </head>

    <body>
        <div id="navegador">
            <header>
                <nav>	
                    <ul> 
                        <li><a href="index.jsp"><span class="primero"><i class="icon icon-home"></i></span>HOME</a></li>
                        <li><a href="MenuCatalogo.jsp"><span class="segundo"><i class="icon icon-clipboard"> </i></span>Catalogo Cuentas</a></li>
                        <li><a href="menuPolizas.jsp"><span class="tercero"><i class="icon icon-cloud"> </i></span>Polizas</a></li>
                        <li><a href="otro.jsp"><span class="cuarto"><i class="icon icon-superscript"> </i></span>Otro</a></li>
                        <li><a href="otro.js"><span class="quinto"><i class="icon icon-lightbulb"> </i></span>Otro</a></li>
                        <li><a href="otro.js"><span class="sexto"><i class="icon icon-tools"> </i></span>Otro</a></li>
                    </ul>
                </nav>
            </header>
        </div>
        <hr>
    </body>
</html>