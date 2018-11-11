<!DOCTYPE HTML>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="Descripcion" content="Sistema contable"/>
        <title>Menu Catalogos</title>
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
                        <li><a href="AltaCatalogo.jsp"><span class="segundo"><i class="icon icon-clipboard"> </i></span>Alta</a></li>
                        <li><a href="BajaModCatalogo.jsp"><span class="tercero"><i class="icon icon-cloud"> </i></span>Baja/Modificacion</a></li>
                        <li><a href="VerCatalogos.jsp"><span class="cuarto"><i class="icon icon-superscript"> </i></span>Ver</a></li>
                    </ul>
                </nav>
            </header>
        </div>
        <hr>
    </body>
</html>