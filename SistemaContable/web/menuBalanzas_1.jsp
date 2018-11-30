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
                        <li><a href="Menu.jsp"><span class="primero"><i class="icon icon-home"></i></span>HOME</a></li>
                        <li><a href="elegirFechaBalance.jsp"><span class="segundo"><i class="icon icon-clipboard"> </i></span>Balanza Comprobacion</a></li>
                        <li><a href="DiarioGeneral.jsp"><span class="tercero"><i class="icon icon-cloud"> </i></span>Diario General</a></li>
                        <li><a href="otro.jsp"><span class="cuarto"><i class="icon icon-superscript"> </i></span>Estado de resultado</a></li>
                    </ul>
                </nav>
            </header>
        </div>
        <hr>
    </body>
</html>