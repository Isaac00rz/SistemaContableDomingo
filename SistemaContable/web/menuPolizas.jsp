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
        <hr>
    </body>
</html>