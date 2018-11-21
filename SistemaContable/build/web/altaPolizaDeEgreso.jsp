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
            <%@ include file="estilos/tablaPoliza.css" %>
               
        </style>
        <script src="js/tablaPoliza.js"></script>
    </head>

    <body>
        <div id="navegador">
            <header>
                <nav>	
                    <ul> 
                        <li><a href="index.jsp"><span class="primero"><i class="icon icon-home"></i></span>HOME</a></li>
                        <li><a href="alta.jsp"><span class="segundo"><i class="icon icon-clipboard"> </i></span>Polizas de diario</a></li>
                        <li><a href="menuPolizas.jsp"><span class="tercero"><i class="icon icon-cloud"> </i></span>Polizas de ingreso</a></li>
                        <li><a href="altaPolizaDeEgreso.jsp"><span class="cuarto"><i class="icon icon-superscript"> </i></span>Poliza de egreso</a></li>
                        <li><a href="otro.js"><span class="quinto"><i class="icon icon-lightbulb"> </i></span>Poliza de Compras</a></li>
                        <li><a href="otro.js"><span class="sexto"><i class="icon icon-tools"> </i></span>Poliza de ventas</a></li>
                    </ul>
                </nav>
            </header>
        </div>
        <title>Alta De Poliza de Egreso</title>
        <h4>Poliza de Egreso</h4>
        <section class="contenido">
            <form role="form" name="form" method="post" action="">
                <table border="1" id="tab" style="display:inline-block;">
                    <tr id="cabecera">
                        <td class="tds">Cuenta</td>
                        <td class="tds">Nombre</td>
                        <td class="tds">Folio</td>
                        <td class="tds">Concepto</td>
                        <td class="tds">Abono</td>
                        <td class="tds">Cargo</td>
                        <td class="tds">Eliminar</td>
                    </tr>
                    <tr>
                        <td class="tds"><input class="inputs" type="text" name="cuenta[]" maxlength = "20" placeholder="Cuenta" required></td>
                        <td class="tds"><input class="inputs" type="text" name="nombre[]" maxlength = "20" placeholder="Nombre " required></td>
                        <td class="tds"><input class="inputs" type="text" name="folio[]" maxlength = "20" placeholder="Folio" required></td>
                        <td class="tds"><input class="inputs" type="text" name="concepto[]" maxlength="30" placeholder="Concepto" required></td>
                        <td class="tds"><input class="inputs" type="text" name="abono[]" maxlength="25" placeholder="Abono" required></td>
                        <td class="tds"><input class="inputs" type="text" name="cargo[]" maxlength="25" placeholder="Cargo" required></td>
                        <td class="tds"><input class="inputs" type="reset" class="noEliminar" value="Eliminar" /></td>
                    </tr>

                </table>
                <button id="add" type="button" ><b>Añadir registro</b></button>
                <button id="aceptar" name="aceptar" type="submit" 
                        ><b>Insertar registros</b></button>
            </form>
        </body>
</html>