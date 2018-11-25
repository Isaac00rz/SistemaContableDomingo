<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
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
            <%@ include file="estilos/tablaDatos.css" %>

        </style>
        <script src="js/jquery-2.1.1.min.js"></script>
        <script src="js/bootstrap.js"></script>
        <style>
            #content{
                position: absolute;
                min-height: 50%;
                width: 80%;
                top: 20%;
                left: 5%;
            }

            .selected{
                cursor: pointer;
            }
            .selected:hover{
                background-color: #0585C0;
                color: white;
            }
            .seleccionada{
                background-color: #0585C0;
                color: white;
            }
        </style>
        <script>
            $(document).ready(function () {
                $('#bt_add').click(function () {
                    agregar();
                });
                $('#bt_del').click(function () {
                    eliminar(id_fila_selected);
                });
                $('#bt_delall').click(function () {
                    eliminarTodasFilas();
                });


            });
            var cont = 0;
            var id_fila_selected = [];
            function agregar() {
                cont++;
                var fila = '<tr>';
                fila += '<td style="width: 7.0%; min-width: 7.0%;"><select name="cuenta[]" required> <%Object[] r = (Object[]) session.getAttribute("cuentas");
                    Object[] s = (Object[]) session.getAttribute("valor");
                    for (int i = 0; i < r.length; i++) {%><option value = "<%=s[i]%>"><%=r[i]%> </option><%}%></select></td>';
                fila += '<td style="width: 7.0%; min-width: 7.0%;"><input type="text" name="concepto[]" maxlength = "20" placeholder="Concepto "  style="text-align: center; min-width: 100%; width:100%;"></td>'
                fila += '<td style="width: 7.0%; min-width: 7.0%;"><input type="text" name="abono[]" maxlength="30" placeholder="Abono"  style="text-align: center; min-width: 100%; width:100%;" onchange="SumarAutomatico(this.id);"></td>'
                fila += '<td style="width: 7.0%; min-width: 7.0%;"><input type="text" name="cargo[]" maxlength="25" placeholder="Cargo"  style="text-align: center; min-width: 100%; width:100%;" onchange="SumarAutomatico2(this.value);"></td>'
                fila += '</tr>'
                $('#tabla').append(fila);

            }
            function eliminarTodasFilas() {
                $('#tabla tbody tr').each(function () {
                    $(this).remove();
                });

            }


        </script>
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
        <% String a = (String) session.getAttribute("va");
            if (a == null) { %>
        <h3></h3>
        <% } else {%>
        <h1> <%=a%></h1>
        <% }%>
        
        <% Date date = new Date();
            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            String fecha = "Fecha: " + dateFormat.format(date);%>
        <title>Alta De Poliza de Egreso></title>
        <h4>Poliza de Egreso</h4>
        <h4> <%=fecha%></h4>
        <section class="contenido">
            <button id="bt_add" class="btn btn-default">Agregar</button>
            <button id="bt_delall" class="btn btn-default">Eliminar todo</button>
            <form role="form" name="form" id = "form" method="post" action="AltaPolizaEgreso">
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
                <table border="1" id="tabla" style="display:inline-block;">
                    <thead>
                        <tr id="cabecera">
                            <td class="tds">Cuenta/Nombre</td>
                            <td class="tds">Concepto</td>
                            <td class="tds">Abono</td>
                            <td class="tds">Cargo</td>
                        </tr>

                        <tr id = "cuerpo">
                            <td style="width: 7.0%; min-width: 7.0%;"><select name="cuenta[]" required> <%for (int i = 0; i < r.length; i++) {%><option value = "<%=s[i]%>"><%=r[i]%> </option><%}%></select></td>
                            <td style="width: 7.0%; min-width: 7.0%;"><input type="text" name="concepto[]" maxlength = "20" placeholder="Concepto "  style="text-align: center; min-width: 100%; width:100%;"></td>
                            <td style="width: 7.0%; min-width: 7.0%;"><input type="text" name="abono[]" maxlength="30" placeholder="Abono"  style="text-align: center; min-width: 100%; width:100%;" onchange="SumarAutomatico(this.value);"></td>
                            <td style="width: 7.0%; min-width: 7.0%;"><input type="text" name="cargo[]" maxlength="25" placeholder="Cargo"  style="text-align: center; min-width: 100%; width:100%;" onchange="SumarAutomatico2(this.value);"></td>
                        </tr>
                    </thead>
                </table>
                <button id="aceptar" name="aceptar" type="button" onclick="comprobar();" 
                        ><b>Insertar registros</b></button>
            </form>
            <span>Total Abonos: </span> <span id="MiTotal"></span> </br>
            <span>Total cargos: </span> <span id="MiTotal2"></span>
    </body>
    <script type="text/javascript">
        /* Funcion suma. */
        function SumarAutomatico(valor) {
            var TotalSuma = 0;
            valor = parseFloat(valor); // Convertir a numero entero (número).
            TotalSuma = document.getElementById('MiTotal').innerHTML;
            // Valida y pone en cero "0".
            TotalSuma = (TotalSuma == null || TotalSuma == undefined || TotalSuma == "") ? 0 : TotalSuma;
            /* Variable genrando la suma. */
            TotalSuma = (parseFloat(TotalSuma) + parseFloat(valor));
            // Escribir el resultado en una etiqueta "span".
            document.getElementById('MiTotal').innerHTML = TotalSuma;
        }

    </script>
    <script type="text/javascript">
        /* Funcion suma. */
        function SumarAutomatico2(valor) {
            var TotalSuma = 0;
            valor = parseFloat(valor); // Convertir a numero entero (número).
            TotalSuma = document.getElementById('MiTotal2').innerHTML;
            // Valida y pone en cero "0".
            TotalSuma = (TotalSuma == null || TotalSuma == undefined || TotalSuma == "") ? 0 : TotalSuma;
            /* Variable genrando la suma. */
            TotalSuma = (parseFloat(TotalSuma) + parseFloat(valor));
            // Escribir el resultado en una etiqueta "span".
            document.getElementById('MiTotal2').innerHTML = TotalSuma;
        }

    </script>
    <script type="text/javascript">
        function comprobar() {
            /* var TotalSumaA = 0;
             var TotalSumaC = 0;
             TotalSumaA = document.getElementById('MiTotal').innerHTML;
             TotalSumaC = document.getElementById('MiTotal2').innerHTML;
             if(parseInt(TotalSumaA)=== parseInt(TotalSumaC)){*/
            document.getElementById("form").submit();
            /*}else{
             alert("Las sumas no coinciden");
             }*/

        }

    </script>
</html>