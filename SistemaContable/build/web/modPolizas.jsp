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
                fila += '<td style="width: 7.0%; min-width: 7.0%;"><input type="text" name="abono[]" maxlength="30" placeholder="Abono"  style="text-align: center; min-width: 100%; width:100%;" onchange="SumarAutomatico(this.value);"></td>'
                fila += '<td style="width: 7.0%; min-width: 7.0%;"><input type="text" name="cargo[]" maxlength="25" placeholder="Cargo"  style="text-align: center; min-width: 100%; width:100%;" onchange="SumarAutomatico2(this.value);"></td>'
                fila += '</tr>'
                $('#tabla').append(fila);

            }
            function eliminarTodasFilas() {
                $('#tabla tr').each(function () {
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
                        <li><a href="AltaPolizaDiario"><span class="segundo"><i class="icon icon-clipboard"> </i></span>Polizas de diario</a></li>
                        <li><a href="menuPolizas.jsp"><span class="tercero"><i class="icon icon-cloud"> </i></span>Polizas de ingreso</a></li>
                        <li><a href="altaPolizaDeEgreso.jsp"><span class="cuarto"><i class="icon icon-superscript"> </i></span>Poliza de egreso</a></li>
                        <li><a href="otro.js"><span class="quinto"><i class="icon icon-lightbulb"> </i></span>Poliza de Compras</a></li>
                        <li><a href="otro.js"><span class="sexto"><i class="icon icon-tools"> </i></span>Poliza de ventas</a></li>
                        <li><a href="BajaModPolizas"><span class="sexto"><i class="icon icon-tools"> </i></span>Modi/Baja</a></li>
                    </ul>
                </nav>
            </header>
        </div>
        <% String a = (String) session.getAttribute("va4");
            if (a == null) { %>
        <h3></h3>
        <% } else {%>
        <h1> <%=a%></h1>
        <% }%>
        
        <% Date date = new Date();
           Object[] tipo = (Object[]) session.getAttribute("tipo");
           String id_global = (String) session.getAttribute("id_global");
            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            String fecha = "Fecha: " + dateFormat.format(date);%>
        <title>Mod/Baja Poliza></title>
        <h4>Poliza de <%=tipo[0]%></h4>
        <h4> <%=fecha%></h4>
        <section class="contenido">
            <button id="bt_add" class="btn btn-default">Agregar</button>
            <button id="bt_delall" class="btn btn-default">Eliminar todo</button>
            <form role="form" name="form" id = "form" method="post" action="ModPoliza">
                <select name="periodo">
                    <%if (tipo[1].toString().equals("1")){%>
                        <option value ="1" selected = "true">01-Enero</option>
                    <%}else{%>
                    <option value ="1" >01-Enero</option>
                    <%}%>
                    <%if (tipo[1].toString().equals("2")){%>
                        <option value ="2" selected = "true">02-Febrero</option>
                    <%}else{%>
                       <option value ="2">02-Febrero</option>
                    <%}%>
                    <%if (tipo[1].toString().equals("3")){%>
                        <option value ="3" selected = "true">03-Marzo</option>
                    <%}else{%>
                    <option value ="3">03-Marzo</option>
                    <%}%>
                    <%if (tipo[1].toString().equals("4")){%>
                        <option value ="4" selected = "true">04-Abril</option>
                    <%}else{%>
                    <option value ="4">04-Abril</option>
                    <%}%>
                    <%if (tipo[1].toString().equals("5")){%>
                        <option value ="5" selected = "true">05-Mayo</option>
                    <%}else{%>
                    <option value ="5">05-Mayo</option>
                    <%}%>
                    <%if (tipo[1].toString().equals("6")){%>
                         <option value ="6" selected = "true">06-Junio</option>
                    <%}else{%>
                    <option value ="6">06-Junio</option>
                    <%}%>
                    <%if (tipo[1].toString().equals("7")){%>
                         <option value ="7" selected = "true">07-Julio</option>
                    <%}else{%>
                     <option value ="7">07-Julio</option>
                    <%}%>
                    <%if (tipo[1].toString().equals("8")){%>
                        <option value ="8" selected = "true">08-Agosto</option>
                    <%}else{%>
                    <option value ="8">08-Agosto</option>
                    <%}%>
                    <%if (tipo[1].toString().equals("9")){%>
                        <option value ="9" selected = "true">09-Semptiembre</option>
                    <%}else{%>
                    <option value ="9">09-Semptiembre</option>
                    <%}%>
                    <%if (tipo[1].toString().equals("10")){%>
                        <option value ="10" selected = "true">10-Octubre</option>
                    <%}else{%>
                    <option value ="10">10-Octubre</option>
                    <%}%>
                    <%if (tipo[1].toString().equals("11")){%>
                        <option value ="11" selected = "true">11-Novimebre</option>
                    <%}else{%>
                     <option value ="11">11-Novimebre</option>
                    <%}%>
                    <%if (tipo[1].toString().equals("12")){%>
                         <option value ="12" selected = "true">12-Diciembre</option>
                    <%}else{%>
                    <option value ="12">12-Diciembre</option>
                    <%}%>
                    
                </select>
                <table border="1" id="tabla" style="display:inline-block;">
                    <thead>
                        <tr id="cabecera">
                            <td class="tds">Cuenta/Nombre</td>
                            <td class="tds">Concepto</td>
                            <td class="tds">Abono</td>
                            <td class="tds">Cargo</td>
                        </tr>
                        <%Object[] mov = (Object[]) session.getAttribute("movimientos"); 
                        for (int ai = 0; ai < mov.length; ai=ai+4) {%>
                        <tr id = "cuerpo">
                            <td style="width: 7.0%; min-width: 7.0%;"><select name="cuenta[]" required> 
                                    <%for (int i = 0; i < r.length; i++) { %>
                                    <% if (mov[ai].toString().equals(s[i].toString())){%>
                                        <option value = "<%=s[i]%>" selected="true"><%=r[i]%> </option>
                                    <%}else{%>
                                        <option value = "<%=s[i]%>"><%=r[i]%> </option>
                                    <%}%>
                                    <%}%>
                                </select></td>
                            <td style="width: 7.0%; min-width: 7.0%;"><input type="text" name="concepto[]" maxlength = "20" placeholder="Concepto "  style="text-align: center; min-width: 100%; width:100%;" value ="<%=mov[ai+1]%>"></td>
                            <td style="width: 7.0%; min-width: 7.0%;"><input type="text" name="abono[]" maxlength="30" placeholder="Abono"  style="text-align: center; min-width: 100%; width:100%;" onchange="SumarAutomatico(this.value);" value ="<%=mov[ai+2]%>"></td>
                            <td style="width: 7.0%; min-width: 7.0%;"><input type="text" name="cargo[]" maxlength="25" placeholder="Cargo"  style="text-align: center; min-width: 100%; width:100%;" onchange="SumarAutomatico2(this.value);" value ="<%=mov[ai+3]%>"></td>
                        </tr>
                        <%}%>
                    </thead>
                </table>
                <button id="aceptar" name="aceptar" type="button" onclick="comprobar();" 
                        ><b>Insertar registros</b></button>
                        <input type="hidden" value="<%=id_global%>" name="id_poliza"> 
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