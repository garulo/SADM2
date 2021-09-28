<%@page import="java.io.File"%>
<%@page import="com.sadm.dao.Config"%>
<%@page import="com.sadm.dao.Pagina"%>
<%@page import="com.sadm.dao.Menu"%>
<%@page import="java.util.List"%>
<%@page import="com.sadm.controlador.Consultas"%>
<%
    HttpSession objSession = request.getSession(false);
    String usuario = (String) objSession.getAttribute("usuario");
    if (null == usuario) {
        response.sendRedirect("Restringido.jsp");
    } else if (usuario.equals("")) {
        response.sendRedirect("Admin099.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <title>Edición y Administración de Páginas</title>
        <meta content="Servicios de agua y drenaje, agua, drenaje, saneamiento, calidad del agua, cuidado del agua, contratos, clic en línea, nuevo leon, transparencia" name="description" />
        <meta content="Servicios de Agua y Drenaje de Monterrey I.P.D." property="og:title" />
        <meta content="Servicios de agua y drenaje, agua, drenaje, saneamiento, calidad del agua, cuidado del agua, contratos, clic en línea, nuevo leon, transparencia" property="og:description" />
        <meta content="summary" name="twitter:card" />
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <script src="js/webfont.js" type="text/javascript"></script>
        <script type="text/javascript">
            WebFont.load({
                google: {
                    families: ["Montserrat:100,100italic,200,200italic,300,300italic,400,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic", "Roboto:100,100italic,300,300italic,regular,500italic,700,700italic,900,900italic"]
                }
            });</script>
        <link href="archivos/css/sadm2021.a2257165c.min.css" rel="stylesheet" type="text/css" />
        <link href="archivos/uploaded_files/5b1ddbe400c01d95eb9dd383_IconoSADM.png" rel="shortcut icon" type="image/x-icon" />
        <link href="archivos/uploaded_files/5b6afb8e41c61684eb69bcee_logo_sadm_color.png" rel="apple-touch-icon" />
        <link rel="stylesheet" href="archivos/css/jquery-ui.css">
        <style>
            .opciones {width: 100%;}
            #agregar_cont_pag {width: 100%;overflow: scroll;}
            #detalle_cont_pag {width: 100%;overflow: scroll;}
        </style>

        <script>
            function formatoFuente(sCmd, sValue) {
                document.execCommand(sCmd, false, sValue);
            }

            function processFiles(files) {
                var file = files[0];
                var reader = new FileReader();
                reader.onload = function (e) {
                    var output = document.getElementById("agregar_cont_pag");
                    var output2 = document.getElementById("detalle_cont_pag");

                    output.innerHTML = "<div>" + e.target.result + "</div>";
                    output2.innerHTML = "<div>" + e.target.result + "</div>";
                };
                reader.readAsText(file);

            }
            var dropBox;
            var dropBox2;
            window.onload = function () {
                dropBox = document.getElementById("agregar_cont_pag");
                dropBox2 = document.getElementById("detalle_cont_pag");
                dropBox.ondragenter = ignoreDrag;
                dropBox2.ondragenter = ignoreDrag;
                dropBox.ondragover = ignoreDrag;
                dropBox2.ondragover = ignoreDrag;
                dropBox.ondrop = drop;
                dropBox2.ondrop = drop;
            }
            function ignoreDrag(e) {
                e.stopPropagation();
                e.preventDefault();
            }
            function drop(e) {
                e.stopPropagation();
                e.preventDefault();
                var data = e.dataTransfer;
                var files = data.files;
                processFiles(files);
            }


        </script>
        <link href="archivos/uploaded_files/5b1ddbe400c01d95eb9dd383_IconoSADM.png" rel="shortcut icon" type="image/x-icon" />
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.23/angular.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"  crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"  crossorigin="anonymous"></script>        
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
        <style>
            .dropdown {
                position: relative;
                display: inline-block;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f9f9f9;
                min-width: 20px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);

                z-index: 1;
                margin-right: 10px;
            }

            .dropdown:hover .dropdown-content {
                display: block;
                margin-right: 10px;
            }
            .desc {

                text-align: center;
                margin-right: 10px;

            }
        </style>

        <style type="text/css">
            .boton_personalizado{
                text-decoration: none;
                padding: 10px;
                font-weight: 500;
                font-size: 20px;
                color: #ffffff;
                background-color: #1883ba;
                border-radius: 15px;
                border: 2px solid #0016b0;
                margin: 10px;
            }
            .fondoHeadHome { height: 600px;}
            .fondoHeadHome>h1 { font-family: 'Lato', sans-serif; font-size: 35px; font-weight: bold; color: white; text-shadow: 0 0 1em black;  padding-bottom: 0px; padding-top: 140px;}
            .fondoHeadHome>p  { font-family: 'Lato', sans-serif; font-size: 25px; color:white; text-shadow: 0 0 1em black; padding-top: 10px; }
            .fondoHeadHome    { /*background-image: url("banner-1920x400-1.jpg");*/ background-position: center;  background-size: 1920px 400px;}


            video { 
                position: fixed;
                min-width: 100%;
                min-height: 100%;
                left: 50%;
                top: 50%;
                transform: translateX(-50%) translateY(-50%);
                z-index: -1;
                /*-webkit-filter:sepia(100%);*/
            }
        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#myInput").on("keyup", function () {
                    var value = $(this).val().toLowerCase();
                    $("#tblPagina tr").filter(function () {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                });
                $("#myInput1").on("keyup", function () {
                    var value = $(this).val().toLowerCase();
                    $("#tblImagenes tr").filter(function () {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                });
                $("#myInput2").on("keyup", function () {
                    var value = $(this).val().toLowerCase();
                    $("#tblImagenesedit tr").filter(function () {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                });
            });
        </script>

    </head>
    <body data-ix="show-up-on-load" class="body" >

        <div style="min-height:150px;padding-top:40px;background-image:url(/SADM/archivos/uploaded_files/5c50c22234f7c43f1513d8cc_presa_el_cuchillo-p-1080.jpeg);background-position:50% 50%;background-size:cover">
            <div style="text-align: center;">
                <div style="text-align: center;" >
                    <h1 id="dash_heading_h1" style="text-align: center;color: white;font-family: sans-serif;" title="Panel del Administrador">Administración de Páginas</h1>
                    <div>
                        <form action="salir"   method="post" id="formsalir" >
                            <button type="button" class="btn btn-outline-success" onclick="agregarD.showModal();" data-toggle="modal" data-target=".bd-agregarpag-modal-lg" style="width: 5%;height: 5%;margin: 10px;"><img style="width: 100%;" src="archivos\uploaded_files\agregar_icon.png" title="Agregar nueva página"/></button>
                            <button type="button" class="btn btn-outline-warning" data-toggle="modal" onclick="location = '/SADM/DashBoard.jsp'" style="width: 5%;height: 5%;margin: 10px;"><img style="width: 100%;" src="archivos\uploaded_files\regresar.png" title="Regresar al DashBoard"/></button>
                            <button type="submit"  class="btn btn-outline-danger" data-toggle="modal" title="Cerrar Sesión"   style="width: 5%;height: 5%;margin: 10px;"><img style="width: 100%;" src="archivos\uploaded_files\salir.png" /></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <div class="content-section">
            <div class="fondoHeadHome row text-center"  align="center" >
                <div  align="center" style="alignment-adjust: central;" >
                    <video muted autoplay loop style="background-image:url(/SADM/archivos/uploaded_files/5c50c06a6968a9a3a5d1ba0c_presa_la_boca.jpeg)" >
                        <source src="archivos/uploaded_files/video_base.mp4" > 
                    </video>
                    <div class="form-group" style="text-align:center;background-color: white;width: 100%;" >
                        <div style="overflow: scroll;max-height: 500px;background-color: white;width: 99%;" >
                            <div class="w-dyn-list" >
                                <div class="w-dyn-items">
                                    <div  >
                                        <div  data-ix="move-up-on-load" class="title-box-3" >


                                            <table id="tblPagina" name="tblPagina" class="table table-striped"  style="text-align: center;">
                                                <%
                                                    Consultas consultas = new Consultas();
                                                    List<Pagina> listaPagina = consultas.obtAllPaginas();
                                                    String p1 = new String();
                                                    String p2 = new String();
                                                    String p3 = new String();
                                                    String p4 = new String();
                                                    String p5 = new String();
                                                    String p6 = new String();
                                                    String p7 = new String();
                                                    String p8 = new String();
                                                    String p9 = new String();
                                                    String p10 = new String();
                                                    String p11 = new String();
                                                    String p12 = new String();
                                                    String p13 = new String();
                                                    String p14 = new String();
                                                    String p15 = new String();
                                                    String p16 = new String();
                                                    String p17 = new String();

                                                %>
                                                <thead >
                                                    <tr > 
                                                <label style="margin-right: 40px;margin-bottom: 20px;margin-top: 10px;margin-left: 30px;float: left;color: #516179;font-weight: bold;font-size: 22px;font-family: 'Roboto', sans-serif;">  
                                                    <input id="myInput" title="Teclea un criterio de búsqueda." style="border-top: none;border-left: none;border-right: none;border-bottom-color: #90AFCE;width: 300px;color:#A0A0A0;font-size: 22px;font-family: 'Roboto', sans-serif;"   type="search" placeholder="Búsqueda por id ó nombre.">
                                                </label>
                                                </tr>
                                                <tr style="alignment-adjust: auto;background-color: whitesmoke;">

                                                    <th ><strong>ID</strong></th>
                                                    <th ><strong>Nombre</strong></th>
                                                    <th ><strong>Acciones</strong></th>
                                                </tr>
                                                </thead>
                                                <tbody style="background-color: white;" id="myTable">
                                                    <%                                            for (Pagina pagina : listaPagina) {

                                                            p1 = pagina.getId_Pagina();
                                                            p2 = pagina.getNom_pag();
                                                            p3 = pagina.getRef_pag();
                                                            p4 = pagina.getVal_pag();
                                                            p5 = pagina.getCont_pag();
                                                            if (p5 != null && p5 != "") {
                                                                //p5 = p5.replaceAll("'", "&#039;");//p5 = p5.replaceAll("'", "&#027;");
                                                                p5 = p5.replaceAll("&#039;;", "´");
                                                                p5 = p5.replaceAll("&#027;", "´");
                                                                p5 = p5.replaceAll("'", "´");
                                                                p5 = p5.replaceAll("\"", "&quot;");
                                                                p5 = p5.replaceAll("\r\n", "");
                                                            }
                                                            p6 = pagina.getTarget();
                                                            p7 = pagina.getActivo();
                                                            p8 = pagina.getPath_pag();
                                                            p9 = pagina.getUrl_pag();
                                                            p10 = pagina.getId_pag_html();
                                                            p11 = pagina.getPagina_desc();
                                                            p12 = pagina.getVal1_pag();
                                                            p13 = pagina.getVal2_pag();
                                                            p14 = pagina.getVal3_pag();
                                                            p15 = pagina.getVal4_pag();
                                                            p16 = pagina.getVal5_pag();

                                                           // System.out.println(":pagina:::::::" + p1 + "::" + p2 + "::" + p3 + "::" + p4 + "::" + p5 + "::" + p6 + "::" + p7 + "::" + p8 + "::" + p9 + "::" + p10 + "::" + p11 + "::" + p12 + "::" + p13 + "::" + p14 + "::" + p15 + "::");

                                                    %>

                                                    <tr>

                                                        <td style="margin: 20px;alignment-adjust: auto;width: 220px;"><%=p1%></td>
                                                        <td style="margin: 20px;alignment-adjust: auto;width: 100px;"><%=p2%></td>
                                                        <td style="width: 10%;">

                                                            <button type="button" onclick="editarD.showModal(), editarPagina('<%=p1%>', '<%=p2%>', '<%=p3%>', '<%=p4%>', '<%=p5%>', '<%=p6%>', '<%=p7%>', '<%=p8%>', '<%=p9%>', '<%=p10%>', '<%=p11%>', '<%=p12%>', '<%=p13%>', '<%=p14%>', '<%=p15%>', '<%=p16%>')"  class="btn btn-outline-info" data-toggle="modal"  style="width: 30%;height: 30%;margin: 2px;"><img style="width: 100%;" src="archivos\uploaded_files\pencil.png" title="Editar"/></button>
                                                            <button type="button" onclick="elimPag('<%=p1%>')"  class="btn btn-outline-danger" data-toggle="modal" data-target=".bd-eliminarpagina-modal-lg" style="width: 30%;height: 30%;margin: 2px;"><img style="width: 100%;" src="archivos\uploaded_files\trash.png" title="Eliminar"/></button>
                                                        </td>
                                                    </tr>
                                                <script>
                                                    function elimPag(p1) {
                                                        document.getElementById("idPagElim").value = p1;
                                                    }
                                                    function editarPagina(pp1, pp2, pp3, pp4, pp5, pp6, pp7, pp8, pp9, pp10, pp11, pp12, pp13, pp14, pp15, pp16) {

                                                        document.getElementById("detalle_id_Pagina").value = pp1;
                                                        document.getElementById("detalle_nom_pag").value = pp2;
                                                        document.getElementById("detalle_ref_pag").value = pp3;
                                                        document.getElementById("detalle_val_pag").value = pp4;

                                                        document.getElementById("detalle_cont_pag").innerHTML = pp5;
                                                        document.getElementById("detalle_target").value = pp6;
                                                        document.getElementById("detalle_activo").value = pp7;

                                                        if (pp7 === "t") {
                                                            document.getElementById("ChckVl").checked = true;
                                                        } else {
                                                            document.getElementById("ChckVl").checked = false;
                                                        }
                                                        document.getElementById("detalle_path_pag").value = pp8;
                                                        document.getElementById("detalle_url_pag").value = pp9;
                                                        document.getElementById("detalle_id_pag_html").value = pp10;
                                                        document.getElementById("detalle_pagina_desc").value = pp11;
                                                        document.getElementById("validarEditar").value = "";
                                                    }
                                                </script>
                                                <%

                                                        p2 = "";
                                                        p3 = "";
                                                        p4 = "";
                                                        p5 = "";
                                                        p6 = "";
                                                        p7 = "";
                                                        p8 = "";
                                                        p9 = "";
                                                        p10 = "";
                                                        p11 = "";
                                                        p12 = "";
                                                        p13 = "";
                                                        p14 = "";
                                                        p15 = "";
                                                    }

                                                %>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>




        <style>
            dialog[open] {
                overflow: scroll;
                width: 100%;
                height: 100%;

            }
        </style>

        <!--ELIMINAR PÁGINA-->     
        <div class="modal fade bd-eliminarpagina-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="background-image:url(&quot;archivos/uploaded_files/fondo_agua_sadm_1_1.jpg&quot;);background-size: cover;">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <form action="eliminarpagina"  method="post" id="formEliminarPag"  >
                    <input type="text" id="idPagElim" name="idPagElim" hidden>

                    <div class="modal-content">

                        <div class="modal-header">
                            <h1> <span class="badge badge-secondary">Eliminar Página</span></h1><br>
                        </div>
                        <div class="modal-body">
                            <div class="card" style="text-align:center;">
                                <div class="card-body">
                                    <div  role="alert">
                                        <h1> ¿Estás seguro de eliminar la Página Seleccionada?</h1>
                                    </div>

                                </div>   
                            </div>
                        </div>
                        <div class="modal-footer">

                            <button title="Presiona para confirmar la eliminación del registro" id="btnElimUs" onclick="submit()" type="button" class="btn btn-primary" style="margin: 20px;">Confirmar Eliminar</button>

                            <button title="Presiona para cancelar y regresar" type="button" class="btn btn-secondary" data-dismiss="modal" style="margin: 20px;">Cancelar</button>
                        </div>
                    </div>
                </form>
            </div>

        </div>

    <dialog id="agregarD"  > 

        <form  action="agregarpagina"  method="post" class="was-validated" name="agrePagForm" id="agrePagForm" accept-charset="ISO-8859-1">
            <div id="AgregarDiv" name="AgregarDiv"   >
                <table class="table table-striped" border="0" style="text-align: center;alignment-adjust: central;">
                    <thead>
                    <th colspan="4" style="height: 30px;">Nueva Página</th>
                    </thead>
                    <tbody >
                        <tr >
                            <td title="El id es un identificador único para el menú, por esto no se permite crear menús con el mismo id. Verifique no exista el id antes de teclearlo."><strong>Id:</strong><input onblur="idVal();" style="height: 20px;"  required id="agregar_id_Pagina" name="agregar_id_Pagina" placeholder="Teclea un id"  ></td>
                    <script>
                        function idVal() {
                            document.getElementById("agregar_id_pag_html").value = document.getElementById("agregar_id_Pagina").value;
                        }
                    </script>
                    <td title="El nombre de la página."><strong>Nombre:</strong><input style="height: 20px;"  required id="agregar_nom_pag" name="agregar_nom_pag"  size="50" placeholder="Teclea un nombre"></td>
                    <td title="El título de la página"><strong>Título de Página:</strong><input style="height: 20px;"  id="agregar_pagina_desc" name="agregar_pagina_desc"  placeholder="Teclea un Título" ></td>
                    <td title="Estatus para habilitar o desactivar una página"><select hidden  id="agregar_activo" name="agregar_activo" size="1">
                            <option value="t">True</option>
                            <option value="f">False</option>
                        </select>

                        <div class="input-group-prepend">
                            <div  class="demo" style="float: left;">
                                <input checked onclick="valChk9()"  style="border-color: #58585A;" type="checkbox" id="CheckVal" >
                                <label style="font-family: 'Roboto', sans-serif;color: #58585A;font-size: 14px;"  for="CheckVal"><span></span><strong>Activo</strong></label>
                            </div>
                            <script>
                                function valChk9() {

                                    if (document.getElementById('CheckVal').checked) {

                                        document.getElementById('agregar_activo').value = "t";
                                    } else {
                                        document.getElementById("agregar_activo").value = "f";
                                    }

                                }
                            </script>
                        </div>       



                        <h3 hidden >Id Menú:</h3> <input hidden id="agregar_id_pag_html" name="agregar_id_pag_html"   >
                        <h3 hidden>Creador:</h3><input hidden id="agregar_val3_pag" name="agregar_val3_pag" readonly style="text-align: center;border: 0;background-color: #ffffcc;" value="<%=usuario%>" >
                        <h2 hidden>Href: <input hidden id="agregar_ref_pag" name="agregar_ref_pag" style="text-align: center;margin: 20px;alignment-adjust: auto;width: 90%"  ></h2>
                        <h2 hidden>Valor : <input hidden id="agregar_val_pag" name="agregar_val_pag"  style="text-align: center;margin: 20px;alignment-adjust: auto;width: 90%" ></h2>
                        <h2 hidden>Target : <input hidden id="agregar_target" name="agregar_target"  style="text-align: center;margin: 20px;alignment-adjust: auto;width: 90%" ></h2>
                        <h2 hidden>Path : <input hidden id="agregar_path_pag" name="agregar_path_pag"  style="text-align: center;margin: 20px;alignment-adjust: auto;width: 90%" ></h2>
                        <h2 hidden>Url : <input hidden id="agregar_url_pag" name="agregar_url_pag"  style="text-align: center;margin: 20px;alignment-adjust: auto;width: 90%" ></h2>
                        <h2 hidden>Val1 : <input hidden id="agregar_val1_pag" name="agregar_val1_pag"  style="text-align: center;margin: 20px;alignment-adjust: auto;width: 90%;height: 100%" ></h2>
                        <h2 hidden>Val2  : <input hidden id="agregar_val2_pag" name="agregar_val2_pag"  style="text-align: center;margin: 20px;alignment-adjust: auto;width: 90%" ></h2>
                    </td>
                </tr><tr>
                <td colspan="4">
                    <section class="opciones">


                        <input title="Selecciona y después preciona este botón para asignar un hipervínculo a la selección en texto." type="button" value="Hipervínculo" onclick="if (document.getElementById('szURL8').checkValidity()) {
                                    document.execCommand('CreateLink', false, document.getElementById('szURL8').value);
                                }">
                        <input title="Ingresa la url destino textualmente a la cuál se asignará el valor presionando el botón anterior" type="url" id="szURL8" placeholder="Teclea un Hipevínculo" >

                        <select title="Selecciona del listado de páginas existentes dentro del portal, para pasar su valor como hipervinculo de texto, al presionar el botón sobre una selección de texto." id="slctPag8" onchange="slctPagHiper();" > 
                            <option value = ""  >Selecciona un Página</option> 
                            <%
                                
                                List<Pagina> lstPag = consultas.obtAllPaginas();

                                for (Pagina p : lstPag) {
                            %>
                            <option value = "<%=p.getId_pag_html()%>"  ><%=p.getId_Pagina()%></option> 
                            <%}%>
                        </select>  
                        <script>
                            function slctPagHiper() {
                                if (document.getElementById("slctPag8").value === "") {
                                    document.getElementById("szURL8").value = '';
                                      } else {
                                    document.getElementById("szURL8").value = 'http:/SADM/index.jsp?id_html=' + document.getElementById("slctPag8").value;

                                }
                            }
                        </script>
                        <select title="Incluye un para asignar a texto seleccionado." onchange="formatoFuente('forecolor', this[this.selectedIndex].value);
                                this.selectedIndex = 0;">
                            <option class="heading" selected>Color</option>
                            <option value="red">Rojo</option>
                            <option value="blue">Azul</option>
                            <option value="green">Verde</option>
                            <option value="black">Negro</option>
                        </select>
                        <input type="button"  onclick="document.execCommand('bold', false, '');" value="Negrilla">
                        <input type="button" onclick="document.execCommand('italic', false, '');" value="Itálica">
                        <input type="button" onclick="document.execCommand('underline', false, '');" value="Subrayado">
                        <input type="button" onclick="document.execCommand('insertunorderedlist', false, '');" value="Biñetas">
                        <input type="button" onclick="document.execCommand('insertorderedlist', false, '');" value="Emuneración">
                        <input type="button" onclick="document.execCommand('justifyleft', false, '');" value="Izquierda">
                        <input type="button" onclick="document.execCommand('justifycenter', false, '');" value="Centro">
                        <input type="button" onclick="document.execCommand('justifyright', false, '');" value="Derecha">

                    </section> </td>


            </tr >
            <tr >
                <td title="Ingresa el contenido a mostrar en a página" colspan="4">




                    <textarea style="overflow: scroll;" id="ag_con_pag" name="ag_con_pag" hidden ></textarea>

                    <br>

                    <!-- -->




                    <div style="border: #000;overflow: scroll;max-height: 500px;">
                        <div contenteditable="true" > 
                            <div id="agregar_cont_pag" name="agregar_cont_pag" contenteditable="true" ><div style="display:flex;min-height:300px;padding-top:80px;background-image:url(/SADM/archivos/uploaded_files/5c50c06a6968a9a3a5d1ba0c_presa_la_boca.jpeg);background-position:50%;background-size:cover"><div class="content-wrapper-antecedentes flex-center w-container"><div class="header-box"><h1 id="edit_pag_heading_h1" data-ix="hero-move-up-on-load" class="heading-1 hero" title="Editor de Menús del Administrador">Banner de la Sección&nbsp;</h1></div></div></div><div class="content-section bottom-padding" style="color: rgb(132, 146, 166);"><div class="content-wrapper w-container"><div class="inner-container"><div class="utility-section-metropolitanos no-top-padding"><div data-ix="move-up-on-load-2" class="_30-percent-column" style="width: 336px; opacity: 1; transform: translateX(0px) translateY(0px) translateZ(0px); transition: opacity 300ms ease 0s, transform 800ms ease 0s;"><h3 class="heading-3 no-border">Título del Contenido.</h3><p>Subtitulo del contenido.</p></div><div data-ix="move-up-on-load-3" class="_66-percent-column" style="width: 739.188px; opacity: 1; transform: translateX(0px) translateY(0px) translateZ(0px); transition: opacity 300ms ease 0s, transform 800ms ease 0s;"><p>Párrafo 1 del Contenido</p><p>Párrafo 2 del Contenido.</p><p>Párrafo 3 del Contenido<br></p></div></div></div></div></div> <div data-ix="move-up-on-load-2" class="_30-percent-column" style="width: 336px; opacity: 1; transform: translateX(0px) translateY(0px) translateZ(0px); color: rgb(132, 146, 166); transition: opacity 300ms ease 0s, transform 800ms ease 0s;"><h3 class="heading-3 no-border"><br></h3></div><div style="text-align:center;"></div><div style="text-align:center;"></div></div>
                        </div>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <section class="opciones">

                        <input title="Presiona este botón para acceder al código fuente y editarlo mediante html." id="fileInput" style="margin: 5px" type="button" onclick="editarHTMLAgregar.showModal(), llenarHtml()" value="Editar HTML del Contenido" >
                        <script>
                            function llenarHtml() {

                                document.getElementById("ag_con_pag_html").value = "<div>" + document.getElementById("agregar_cont_pag").innerHTML + "</div>";

                            }
                        </script>

                        <a title="Presiona sobre este vinculo para ir a la administración de archivos" style="margin: 5px"  href="/SADM/AdminArchivos.jsp" ><strong>Importar nuevas imagenes a la galería</strong></a>

                        <strong>Importar archivo de Texto: </strong>
                        <input title="Selecciona documentos de texto para publicar contenido dentro de tu página. " style="margin: 5px" id="fileInput" type="file" onchange="processFiles(this.files)">
                        <br>
                        <input title="Presiona para utilizar un archivo existente en la galería en el server." type="button" onclick="vistaIIG.showModal(), document.getElementById('in_urlimagenmini_1').value = '';" value="Seleccionar una  Imagen de la Galería">
                        <input id="in_urlimagenmini_1" name="in_urlimagenmini_1"   readonly  hidden >
                        <input title="Presiona para insertar la imagen seleccionada donde se encuentre el cursor del contenido" style="margin: 5px" type="button" value="Insertar Imagen Seleccionada de la galería" onclick="document.execCommand('InsertImage', false, document.getElementById('in_urlimagenmini_1').value);">

                    </section></div>


                </td>
            </tr>

            <br>
            <!-- -->
            <tr>
                <td colspan="4">


                    <input   id="validarAgregar"  name="validarAgregar" readonly hidden> 
                    <br>
                    <input title="Presiona para regresar" type="button" onclick="agregarD.close(), regresarAgregar()" value="Regresar">

                    <input title="Presiona para limpiar el contenido de los inputs de este formulario" type="reset"  style="margin: 20px;alignment-adjust: central;background-color:#ffff99;" value="Limpiar el formulario">
                    <input title="Presiona para generar una vista previa de tu página." type="button" onclick="vistaPrevAgre()" value="Vista Previa">
                    <input title="Presiona para guardar los cambios." id="guardarA"  name="guardarA" type="submit"   style="margin: 20px;alignment-adjust: central;background-color:#99FF99;" value="Guardar" hidden>
                    <input title="Presiona para validar y posteriormente guardar" id="continuarA" type="button" onclick="continuarAgre()" name="continuarA"    style="margin: 20px;alignment-adjust: central;background-color:#A3E7FF;" value="Continuar ">
                </td>
            </tr>

            </tbody>
        </table>
        <script>
            function  regresarAgregar() {
                //alert("regresarAgregar");
                document.getElementById("continuarA").hidden = false;
                document.getElementById("guardarA").hidden = true;
                document.getElementById("ag_con_pag").value = "";
                document.getElementById("validarAgregar").value = "";

            }
        </script>
        <script>
            function continuarAgre() {



                var id_Pagina = false;
                var nom_pag = false;
                var ref_pag = false;
                var val_pag = false;
                var cont_pag = false;
                var path_pag = false;
                var url_pag = false;
                var id_pag_html = false;
                var pagina_desc = false;
                var val1_pag = false;
                var val2_pag = false;
                var val3_pag = false;
                var val4_pag = false;
                if (document.getElementById("agregar_id_Pagina").value === null || document.getElementById("agregar_id_Pagina").value === "") {
                    id_Pagina = true;
                    alert("El Id de Página es requerido");
                }

                if (document.getElementById("agregar_nom_pag").value === null || document.getElementById("agregar_nom_pag").value === "") {
                    nom_pag = true;
                    alert("El Nombre de Página es requerido");
                }


                if (id_Pagina === false
                        && nom_pag === false) {
                    document.getElementById("continuarA").hidden = true;
                    document.getElementById("guardarA").hidden = false;
                    document.getElementById("ag_con_pag").value = "<div>" + document.getElementById("agregar_cont_pag").innerHTML + "</div>";
                    document.getElementById("validarAgregar").value = "true";
                }
                if (document.getElementById("agregar_activo").value === "t") {
                    document.getElementById("ChckVl").checked = true;
                } else {
                    document.getElementById("ChckVl").checked = false;
                }

            }
        </script>


    </div>
</form>
<script>
    function vistaPrevAgre() {
        vistaPrevagre.showModal();
        document.getElementById("ag_con_pag").value = document.getElementById("agregar_cont_pag").innerHTML;
        var cont = document.getElementById("ag_con_pag").value;
        document.getElementById("agregarView").innerHTML = cont;

    }

</script>
</dialog>

<dialog id="vistaIIG">
    <form  name="vistIIGAgregar" id="vistIIG">
        <div>
            
            
            <table class="table table-striped" id='tblImagenes'style="text-align: center;">
                <thead>
                <label style="margin-right: 40px;margin-bottom: 20px;margin-top: 10px;margin-left: 30px;float: left;color: #516179;font-weight: bold;font-size: 22px;font-family: 'Roboto', sans-serif;">  
                    <input id="myInput1" title="Teclea un criterio de búsqueda." style="border-top: none;border-left: none;border-right: none;border-bottom-color: #90AFCE;width: 300px;color:#A0A0A0;font-size: 22px;font-family: 'Roboto', sans-serif;"   type="search" placeholder="Búsqueda ."></label>
                <button type="button" title="Presiona aquí para regresar a la edición de página" class="close" onclick="vistaIIG.close()" data-dismiss="modal" aria-label="Close" style="margin-right: 50px;">Cerrar ventana</button>
                <tr>
                    <th scope="col">Imagen</th>
                    <th scope="col">Nombre</th>
                </tr>
                </thead>
                <tbody>
                    <%
                        
                        Config confObj = consultas.obtenerConfig();

                        File carpeta = new File(confObj.getUrlUploaded_Files());
                        String[] listado = carpeta.list();
                        if (listado == null || listado.length == 0) {
                            System.out.println("No hay elementos dentro de la carpeta actual");
                            return;
                        } else {
                            for (int i = 0; i < listado.length; i++) {
                    %>
                    <tr><td><img title="Presiona para seleccionar la imagen" src='<%="archivos/uploaded_files/" + listado[i]%>' width="100" height="100" onclick="f2('<%=listado[i]%>'), vistaIIG.close()" ><br>
                        </td>
                        <td><Label  ><%=listado[i]%></label>
                        </td></tr><%
                                }

                            }
                        %>
                </tbody>
            </table>
            <script>
                function f2(p) {

                    document.getElementById('in_urlimagenmini_1').value = "archivos/uploaded_files/" + p;

                }</script>
            <br>
        </div>

    </form>
</dialog>

<dialog id="editarHTMLAgregar">
    <form>
        <div style="text-align: center;">
            <textarea title="Edita el codigo fuente de la página" id="ag_con_pag_html" name="ag_con_pag_html" rows="18" cols="130" ></textarea>
        </div>
        <div style="text-align: center;"  >
            <input title="Regresar sin guardar" type="button" value="Regresar" onclick="editarHTMLAgregar.close()" style="margin: 10px;">
            <input title="Guardar y Regresar"type="button" value="Guardar" onclick="editarHTMLAgregar.close(), uploadHtmlagre()" style="margin: 10px;">
            <script>
                function uploadHtmlagre() {

                    document.getElementById("agregar_cont_pag").innerHTML = document.getElementById("ag_con_pag_html").value;
                    document.getElementById("ag_con_pag").value = document.getElementById("agregar_cont_pag").innerHTML;

                }
            </script>
        </div>
    </form>   
</dialog>
<dialog id="editarHTMLEditar">
    <form>
        <div style="text-align: center;">
            <textarea title="Edita el codigo fuente de la página"  id="detalle_cont_pag_html" name="detalle_cont_pag_html" rows="18" cols="130" ></textarea>
        </div>
        <div style="text-align: center;"  >
            <input type="button" title="Regresar sin guardar" value="Regresar" onclick="editarHTMLEditar.close()" style="margin: 10px;">
            <input type="button" title="Guardar y Regresar" value="Guardar" onclick="editarHTMLEditar.close(), uploadHtmleditar()" style="margin: 10px;">
            <script>
                function uploadHtmleditar() {

                    document.getElementById("detalle_cont_pag").innerHTML = document.getElementById("detalle_cont_pag_html").value;
                    document.getElementById("de_con_pag").value = document.getElementById("detalle_cont_pag").innerHTML;

                }
            </script>
        </div>
    </form>   
</dialog>

<dialog id="vistaPrevagre">
    <form  name="vistPrevAgregar" id="vistPrevAgregar">
        <br><br>
        <div  >
            <div title="Esta es una vista previa de la página" id="agregarView">

            </div>

            <br><br>
            <div class="top-border-copy w-clearfix">
                <input title="Presiona para regresar" type="button" onclick="vistaPrevagre.close(), agregarD.showModal()"  value="Regresar">
            </div>
            <br><br>
        </div>


    </form> 
</dialog>

<dialog id="editarD"> 
    <div>
        <form action="editarpagina"  method="post" class="was-validated" id="editPagForm" name="editPagForm" accept-charset="ISO-8859-1">
            <div id="EditarP" name="EditarP" >
                <table class="table table-striped" border="0" style="text-align: center;alignment-adjust: central;">

                    <thead>
                    <th colspan="4" style="height: 30px;">Editar Página</th>
                    </thead>

                    <tbody >
                        <tr>
                            <td title="Es el nombre de la página"><strong>Nombre:</strong> <input id="detalle_nom_pag" name="detalle_nom_pag"  style="text-align: center;height: 20px;" ></td>
                            <td title="Es el título de la página"><strong>Título de la Página:</strong><input id="detalle_pagina_desc" name="detalle_pagina_desc"  style="text-align: center;height: 20px;" ></h3></td>
                            <td title="Estatus para activar y desactivar un página" ><select hidden id="detalle_activo" name="detalle_activo" size="1">

                                    <option value="t">True</option>
                                    <option value="f">False</option>
                                </select>
                                <div class="input-group-prepend">
                                    <div  class="demo" style="float: left;">
                                        <input checked onclick="valChk();"  style="border-color: #58585A;" type="checkbox" id="ChckVl" >
                                        <label style="font-family: 'Roboto', sans-serif;color: #58585A;font-size: 14px;"  for="ChckVl"><span></span><strong>Activo</strong></label>
                                    </div>
                                    <script>
                                        function valChk() {
                                            if (document.getElementById('ChckVl').checked) {
                                                document.getElementById('detalle_activo').value = "t";
                                            } else {
                                                document.getElementById("detalle_activo").value = "f";
                                            }

                                        }
                                    </script>
                                </div>       
                            </td>


                    <h3 hidden><strong>Identificador único de la Página para editar:</strong> <input hidden id="detalle_id_Pagina" name="detalle_id_Pagina" readonly style="text-align: center;border: 0;background-color: #ffffcc;" ></h3>
                    <h3 hidden> <strong>Identificador de Menu para referencia la Página:</strong> <input hidden id="detalle_id_pag_html" name="detalle_id_pag_html"  style="text-align: center;margin: 20px;alignment-adjust: auto;width: 90%;height: 100%" ></h3>
                    <h3 hidden><strong>Usuario Creador de la Página:</strong> <input hidden id="detalle_val1_pag" name="detalle_val1_pag" readonly style="text-align: center;margin: 20px;alignment-adjust: auto;width: 90%;border: 0;background-color: #ffffcc;" value="<%=usuario%>" ></h3>

                    <h3 hidden>Href: <input  hidden id="detalle_ref_pag" name="detalle_ref_pag"  style="text-align: center;margin: 20px;alignment-adjust: auto;width: 90%" ></h3>
                    <h3 hidden>Valor : <input hidden id="detalle_val_pag" name="detalle_val_pag"  style="text-align: center;margin: 20px;alignment-adjust: auto;width: 90%" ></h3>
                    <h3 hidden>Target : <input hidden id="detalle_target" name="detalle_target"  style="text-align: center;margin: 20px;alignment-adjust: auto;width: 90%" ></h3>
                    <h3 hidden>Orden Númerico : <input hidden id="detalle_path_pag" name="detalle_path_pag"  style="text-align: center;margin: 20px;alignment-adjust: auto;width: 90%" ></h3>
                    <h3 hidden>Url  : <input hidden id="detalle_url_pag" name="detalle_url_pag"  style="text-align: center;margin: 20px;alignment-adjust: auto;width: 90%" ></h3>
                    </tr>
                    <tr >
                        <td colspan="4">


                            <textarea  id="de_con_pag" name="de_con_pag" hidden ></textarea>



                            <section class="opciones">

                                <input title="Presiona para asignar el hipervínculo al texto seleccionado" type="button" value="Hipervínculo" onclick="if (document.getElementById('szURLI').checkValidity()) {
                                            document.execCommand('CreateLink', false, document.getElementById('szURLI').value);
                                        }">
                                        <input title="Ingresa la url destino textualmente a la que se le asignará el valor presionando el botón anterior" type="url" id="szURLI" placeholder="Teclea un Hipevínculo">
                                <select id="sltPag" onchange="sltPagHiper2();" > 
                                    <option title="Selecciona del listado de páginas existentes en el portal, para pasar su valor como hipervínculo de texto, al presionar el botón anterior sobre una seleccion del texto" value = ""  >Selecciona un Página</option> 
                                    <%
                                        
                                        List<Pagina> lsPag = consultas.obtAllPaginas();

                                        for (Pagina p : lsPag) {
                                    %>
                                    <option value = "<%=p.getId_pag_html()%>"  ><%=p.getId_Pagina()%></option> 
                                    <%}%>
                                </select>  
                                <script>
                                    function sltPagHiper2() {
                                        if (document.getElementById("sltPag").value === "") {
                                            document.getElementById("szURLI").value = '';
                                        } else {
                                            document.getElementById("szURLI").value = 'http:/SADM/index.jsp?id_html=' + document.getElementById("sltPag").value;


                                        }
                                    }
                                </script>
                                <select title="Selecciona un color para asignar al texto seleccionado" onchange="formatoFuente('forecolor', this[this.selectedIndex].value);
                                        this.selectedIndex = 0;">
                                    <option class="heading" selected>Color</option>
                                    <option value="red">Rojo</option>
                                    <option value="blue">Azul</option>
                                    <option value="green">Verde</option>
                                    <option value="black">Negro</option>
                                </select>
                                <input type="button"  onclick="document.execCommand('bold', false, '');" value="Negrilla">
                                <input type="button" onclick="document.execCommand('italic', false, '');" value="Itálica">
                                <input type="button" onclick="document.execCommand('underline', false, '');" value="Subrayado">
                                <input type="button" onclick="document.execCommand('insertunorderedlist', false, '');" value="Biñetas">
                                <input type="button" onclick="document.execCommand('insertorderedlist', false, '');" value="Emuneración">
                                <input type="button" onclick="document.execCommand('justifyleft', false, '');" value="Izquierda">
                                <input type="button" onclick="document.execCommand('justifycenter', false, '');" value="Centro">
                                <input type="button" onclick="document.execCommand('justifyright', false, '');" value="Derecha">

                            </section>


                            <div style="border: #000;overflow: scroll;max-height: 500px;">
                                <div contenteditable="true" >
                                    <div title="Edita el contenido a mostrar en la página" id="detalle_cont_pag" name="detalle_cont_pag" contenteditable="true" >
                                    </div> 
                                </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <section class="opciones">

                                <input title="Presiona este botón para acceder al código fuente de la página" id="fileInput" style="margin: 5px" type="button" onclick="editarHTMLEditar.showModal(), llenarHtmlEditar()" value="Editar HTML del Contenido" >
                                <script>
                                    function llenarHtmlEditar() {

                                        document.getElementById("detalle_cont_pag_html").value = "<div>" + document.getElementById("detalle_cont_pag").innerHTML + "</div>";

                                    }
                                </script>

                                <a title="Presiona este vonculo para ir a la administración de archivos"  href="/SADM/AdminArchivos.jsp" ><strong>Importar nuevas imagenes a la galeía</strong></a>

                                <strong>Importar archivo de Texto: </strong>
                                <input title="Selecciona documentos de texto para publicar contenido de tu página" id="fileInputd" type="file" onchange="processFiles(this.files)">
                                <br>
                                <input title="Presiona para utilizar un archivo existente en la galería del portal" type="button" onclick="vistaIIGedit.showModal(), document.getElementById('din_urlimagenmini_1').value = '';" value="Seleccionar Imagen de la Galería">

                                <input id="din_urlimagenmini_1" name="din_urlimagenmini_1"   readonly  hidden >

                                <input title="Presiona para insertar la imagen seleccionada donde se encuentre el cursor del contenido" type="button" value="Insertar Imagen seleccionada de la galería" onclick="document.execCommand('InsertImage', false, document.getElementById('din_urlimagenmini_1').value);">

                            </section>

                        </td>
                    </tr>
                    <!-- -->
                    <tr>
                        <td colspan="4">
                            <input title="Presiona para regresar" type="button" onclick="editarD.close(), regresarEditar()" value="REGRESAR">
                            <input title="Presiona para generar una vista previa de la página" type="button" onclick="vistaPrevEdit()" value="VISTA PREVIA">
                            <input title="Presiona para limpiar el formulario"  type="reset"  style="margin: 20px;alignment-adjust: central;background-color:#ffff99;" value="Limpiar el formulario">
                            <input   id="validarEditar"  name="validarEditar" readonly hidden > 
                            <input title="Presiona para validar y posteriormente guardar" id="continuarE"  name="continuarE" type="button"  onclick="continuarEdit()" style="margin: 20px;alignment-adjust: central;background-color:#A3E7FF;" value="CONTINUAR ">
                            <input title="Presiona para guardar los cambios"  id="guardarE"  name="guardarE" type="submit"   style="margin: 20px;alignment-adjust: central;background-color:#99FF99;" value="GUARDAR" hidden>

                        </td>
                    </tr>
                    </tbody>
                </table>
                <script>
                    function  regresarEditar() {
                        //alert("regresarEditar");
                        document.getElementById("continuarE").hidden = false;
                        document.getElementById("guardarE").hidden = true;
                        document.getElementById("validarEditar").value = "";
                        document.getElementById("de_con_pag").value = "";

                    }
                </script>       
                <script>
                    function continuarEdit() {


                        var e_id_Pagina = false;
                        var e_nom_pag = false;
                        var e_ref_pag = false;
                        var e_val_pag = false;
                        var e_cont_pag = false;
                        var detalle_target = false;
                        var detalle_activo = false;
                        var e_path_pag = false;
                        var e_url_pag = false;
                        var e_id_pag_html = false;
                        var e_pagina_desc = false;
                        var e_val1_pag = false;
                        var e_val2_pag = false;
                        var e_val3_pag = false;
                        var e_val4_pag = false;
                        if (document.getElementById("detalle_id_Pagina").value === null || document.getElementById("detalle_id_Pagina").value === "") {
                            e_id_Pagina = true;
                            alert("El Id de Página es requerido");
                        }

                        if (document.getElementById("detalle_nom_pag").value === null || document.getElementById("detalle_nom_pag").value === "") {
                            e_nom_pag = true;
                            alert("El Nombre de Página es requerido");
                        }


                        if (e_id_Pagina === false
                                && e_nom_pag === false) {
                            document.getElementById("continuarE").hidden = true;
                            document.getElementById("guardarE").hidden = false;
                            document.getElementById("validarEditar").value = "true";
                            document.getElementById("de_con_pag").value = document.getElementById("detalle_cont_pag").innerHTML;
                        }
                    }
                </script>
            </div>
        </form>
    </div>
    <script>
        function vistaPrevEdit() {

            vistaPrevedit.showModal();



            document.getElementById("de_con_pag").value = document.getElementById("detalle_cont_pag").innerHTML;
            var cont = document.getElementById("de_con_pag").value;

            document.getElementById("editarView").innerHTML = cont;

        }

    </script>
</dialog>


<dialog id="vistaIIGedit">
    <form  name="vistIIGEditar" id="vistIIGedit">
        <div>

            <table class="table table-striped"  id='tblImagenesedit'style="text-align: center;">
                <thead>
                <label style="margin-right: 40px;margin-bottom: 20px;margin-top: 10px;margin-left: 30px;float: left;color: #516179;font-weight: bold;font-size: 22px;font-family: 'Roboto', sans-serif;">  
                    <input id="myInput2" title="Teclea un criterio de búsqueda." style="border-top: none;border-left: none;border-right: none;border-bottom-color: #90AFCE;width: 300px;color:#A0A0A0;font-size: 22px;font-family: 'Roboto', sans-serif;"   type="search" placeholder="Búsqueda ."></label>
               <button type="button" title="Presiona aquí para regresar a la edición de página" class="close" onclick="vistaIIGedit.close()" data-dismiss="modal" aria-label="Close" style="margin-right: 50px;">Cerrar ventana</button>
               
                <tr>
                    <th scope="col">Imagen</th>
                    <th scope="col">Nombre</th>
                </tr>
                </thead>
                <tbody>
                    <%
                       
                        Config confO = consultas.obtenerConfig();
                        consultas.getConexion().close();
                        File carpet = new File(confO.getUrlUploaded_Files());
                        String[] listad = carpet.list();
                        if (listad == null || listad.length == 0) {
                            System.out.println("No hay elementos dentro de la carpeta actual");
                            return;
                        } else {
                            for (int i = 0; i < listad.length; i++) {
                    %>
                    <tr><td><img title="Presiona para seleccionar la imagen" src='<%="archivos/uploaded_files/" + listad[i]%>' width="100" height="100" onclick="d2('<%=listad[i]%>'), vistaIIGedit.close()" ><br>
                        </td>
                        <td><Label  ><%=listad[i]%></label>
                        </td></tr><%
                                }

                            }
                        %>
                </tbody>
            </table>
            <script>
                function d2(p) {

                    document.getElementById('din_urlimagenmini_1').value = "archivos/uploaded_files/" + p;

                }</script>
            <br>
        </div>

    </form>
</dialog>

<dialog id="vistaPrevedit">
    <form  name="vistPrevEditar" id="vistPrevEditar">
        <br><br>
        <div >
            <div id="editarView">

            </div>

            <br><br>
            <div class="top-border-copy w-clearfix">
                <input title="Presiona para regresar" type="button" onclick="vistaPrevedit.close(), editarD.showModal()" value="Regresar">
            </div>
            <br><br>
        </div>


    </form> 
</dialog>




<!-- -->   
<style>
    dialog {
        position: absolute;
        left: 0; right: 0;
        width: -moz-fit-content;
        width: -webkit-fit-content;
        width: fit-content;
        height: -moz-fit-content;
        height: -webkit-fit-content;
        height: fit-content;
        margin: auto;
        border: solid;
        padding: 1em;
        background: white;
        color: black;
        display: block;
    }

    dialog:not([open]) {
        display: none;
    }

    dialog + .backdrop {
        position: fixed;
        top: 0; right: 0; bottom: 0; left: 0;
        background: rgba(0,0,0,0.1);
    }

    ._dialog_overlay {
        position: fixed;
        top: 0; right: 0; bottom: 0; left: 0;
    }

    dialog.fixed {
        position: fixed;
        top: 50%;
        transform: translate(0, -50%);
    }
</style>



<script>
    (function (global, factory) {
        typeof exports === 'object' && typeof module !== 'undefined' ? module.exports = factory() :
                typeof define === 'function' && define.amd ? define(factory) :
                (global = global || self, global.dialogPolyfill = factory());
    }(this, function () {
        'use strict';

        // nb. This is for IE10 and lower _only_.
        var supportCustomEvent = window.CustomEvent;
        if (!supportCustomEvent || typeof supportCustomEvent === 'object') {
            supportCustomEvent = function CustomEvent(event, x) {
                x = x || {};
                var ev = document.createEvent('CustomEvent');
                ev.initCustomEvent(event, !!x.bubbles, !!x.cancelable, x.detail || null);
                return ev;
            };
            supportCustomEvent.prototype = window.Event.prototype;
        }

        /**
         * @param {Element} el to check for stacking context
         * @return {boolean} whether this el or its parents creates a stacking context
         */
        function createsStackingContext(el) {
            while (el && el !== document.body) {
                var s = window.getComputedStyle(el);
                var invalid = function (k, ok) {
                    return !(s[k] === undefined || s[k] === ok);
                };

                if (s.opacity < 1 ||
                        invalid('zIndex', 'auto') ||
                        invalid('transform', 'none') ||
                        invalid('mixBlendMode', 'normal') ||
                        invalid('filter', 'none') ||
                        invalid('perspective', 'none') ||
                        s['isolation'] === 'isolate' ||
                        s.position === 'fixed' ||
                        s.webkitOverflowScrolling === 'touch') {
                    return true;
                }
                el = el.parentElement;
            }
            return false;
        }

        /**
         * Finds the nearest <dialog> from the passed element.
         *
         * @param {Element} el to search from
         * @return {HTMLDialogElement} dialog found
         */
        function findNearestDialog(el) {
            while (el) {
                if (el.localName === 'dialog') {
                    return /** @type {HTMLDialogElement} */ (el);
                }
                el = el.parentElement;
            }
            return null;
        }

        /**
         * Blur the specified element, as long as it's not the HTML body element.
         * This works around an IE9/10 bug - blurring the body causes Windows to
         * blur the whole application.
         *
         * @param {Element} el to blur
         */
        function safeBlur(el) {
            if (el && el.blur && el !== document.body) {
                el.blur();
            }
        }

        /**
         * @param {!NodeList} nodeList to search
         * @param {Node} node to find
         * @return {boolean} whether node is inside nodeList
         */
        function inNodeList(nodeList, node) {
            for (var i = 0; i < nodeList.length; ++i) {
                if (nodeList[i] === node) {
                    return true;
                }
            }
            return false;
        }

        /**
         * @param {HTMLFormElement} el to check
         * @return {boolean} whether this form has method="dialog"
         */
        function isFormMethodDialog(el) {
            if (!el || !el.hasAttribute('method')) {
                return false;
            }
            return el.getAttribute('method').toLowerCase() === 'dialog';
        }

        /**
         * @param {!HTMLDialogElement} dialog to upgrade
         * @constructor
         */
        function dialogPolyfillInfo(dialog) {
            this.dialog_ = dialog;
            this.replacedStyleTop_ = false;
            this.openAsModal_ = false;

            // Set a11y role. Browsers that support dialog implicitly know this already.
            if (!dialog.hasAttribute('role')) {
                dialog.setAttribute('role', 'dialog');
            }

            dialog.show = this.show.bind(this);
            dialog.showModal = this.showModal.bind(this);
            dialog.close = this.close.bind(this);

            if (!('returnValue' in dialog)) {
                dialog.returnValue = '';
            }

            if ('MutationObserver' in window) {
                var mo = new MutationObserver(this.maybeHideModal.bind(this));
                mo.observe(dialog, {attributes: true, attributeFilter: ['open']});
            } else {
                // IE10 and below support. Note that DOMNodeRemoved etc fire _before_ removal. They also
                // seem to fire even if the element was removed as part of a parent removal. Use the removed
                // events to force downgrade (useful if removed/immediately added).
                var removed = false;
                var cb = function () {
                    removed ? this.downgradeModal() : this.maybeHideModal();
                    removed = false;
                }.bind(this);
                var timeout;
                var delayModel = function (ev) {
                    if (ev.target !== dialog) {
                        return;
                    }  // not for a child element
                    var cand = 'DOMNodeRemoved';
                    removed |= (ev.type.substr(0, cand.length) === cand);
                    window.clearTimeout(timeout);
                    timeout = window.setTimeout(cb, 0);
                };
                ['DOMAttrModified', 'DOMNodeRemoved', 'DOMNodeRemovedFromDocument'].forEach(function (name) {
                    dialog.addEventListener(name, delayModel);
                });
            }
            // Note that the DOM is observed inside DialogManager while any dialog
            // is being displayed as a modal, to catch modal removal from the DOM.

            Object.defineProperty(dialog, 'open', {
                set: this.setOpen.bind(this),
                get: dialog.hasAttribute.bind(dialog, 'open')
            });

            this.backdrop_ = document.createElement('div');
            this.backdrop_.className = 'backdrop';
            this.backdrop_.addEventListener('click', this.backdropClick_.bind(this));
        }

        dialogPolyfillInfo.prototype = {
            get dialog() {
                return this.dialog_;
            },
            /**
             * Maybe remove this dialog from the modal top layer. This is called when
             * a modal dialog may no longer be tenable, e.g., when the dialog is no
             * longer open or is no longer part of the DOM.
             */
            maybeHideModal: function () {
                if (this.dialog_.hasAttribute('open') && document.body.contains(this.dialog_)) {
                    return;
                }
                this.downgradeModal();
            },
            /**
             * Remove this dialog from the modal top layer, leaving it as a non-modal.
             */
            downgradeModal: function () {
                if (!this.openAsModal_) {
                    return;
                }
                this.openAsModal_ = false;
                this.dialog_.style.zIndex = '';

                // This won't match the native <dialog> exactly because if the user set top on a centered
                // polyfill dialog, that top gets thrown away when the dialog is closed. Not sure it's
                // possible to polyfill this perfectly.
                if (this.replacedStyleTop_) {
                    this.dialog_.style.top = '';
                    this.replacedStyleTop_ = false;
                }

                // Clear the backdrop and remove from the manager.
                this.backdrop_.parentNode && this.backdrop_.parentNode.removeChild(this.backdrop_);
                dialogPolyfill.dm.removeDialog(this);
            },
            /**
             * @param {boolean} value whether to open or close this dialog
             */
            setOpen: function (value) {
                if (value) {
                    this.dialog_.hasAttribute('open') || this.dialog_.setAttribute('open', '');
                } else {
                    this.dialog_.removeAttribute('open');
                    this.maybeHideModal();  // nb. redundant with MutationObserver
                }
            },
            /**
             * Handles clicks on the fake .backdrop element, redirecting them as if
             * they were on the dialog itself.
             *
             * @param {!Event} e to redirect
             */
            backdropClick_: function (e) {
                if (!this.dialog_.hasAttribute('tabindex')) {
                    // Clicking on the backdrop should move the implicit cursor, even if dialog cannot be
                    // focused. Create a fake thing to focus on. If the backdrop was _before_ the dialog, this
                    // would not be needed - clicks would move the implicit cursor there.
                    var fake = document.createElement('div');
                    this.dialog_.insertBefore(fake, this.dialog_.firstChild);
                    fake.tabIndex = -1;
                    fake.focus();
                    this.dialog_.removeChild(fake);
                } else {
                    this.dialog_.focus();
                }

                var redirectedEvent = document.createEvent('MouseEvents');
                redirectedEvent.initMouseEvent(e.type, e.bubbles, e.cancelable, window,
                        e.detail, e.screenX, e.screenY, e.clientX, e.clientY, e.ctrlKey,
                        e.altKey, e.shiftKey, e.metaKey, e.button, e.relatedTarget);
                this.dialog_.dispatchEvent(redirectedEvent);
                e.stopPropagation();
            },
            /**
             * Focuses on the first focusable element within the dialog. This will always blur the current
             * focus, even if nothing within the dialog is found.
             */
            focus_: function () {
                // Find element with `autofocus` attribute, or fall back to the first form/tabindex control.
                var target = this.dialog_.querySelector('[autofocus]:not([disabled])');
                if (!target && this.dialog_.tabIndex >= 0) {
                    target = this.dialog_;
                }
                if (!target) {
                    // Note that this is 'any focusable area'. This list is probably not exhaustive, but the
                    // alternative involves stepping through and trying to focus everything.
                    var opts = ['button', 'input', 'keygen', 'select', 'textarea'];
                    var query = opts.map(function (el) {
                        return el + ':not([disabled])';
                    });
                    // TODO(samthor): tabindex values that are not numeric are not focusable.
                    query.push('[tabindex]:not([disabled]):not([tabindex=""])');  // tabindex != "", not disabled
                    target = this.dialog_.querySelector(query.join(', '));
                }
                safeBlur(document.activeElement);
                target && target.focus();
            },
            /**
             * Sets the zIndex for the backdrop and dialog.
             *
             * @param {number} dialogZ
             * @param {number} backdropZ
             */
            updateZIndex: function (dialogZ, backdropZ) {
                if (dialogZ < backdropZ) {
                    throw new Error('dialogZ should never be < backdropZ');
                }
                this.dialog_.style.zIndex = dialogZ;
                this.backdrop_.style.zIndex = backdropZ;
            },
            /**
             * Shows the dialog. If the dialog is already open, this does nothing.
             */
            show: function () {
                if (!this.dialog_.open) {
                    this.setOpen(true);
                    this.focus_();
                }
            },
            /**
             * Show this dialog modally.
             */
            showModal: function () {
                if (this.dialog_.hasAttribute('open')) {
                    throw new Error('Failed to execute \'showModal\' on dialog: The element is already open, and therefore cannot be opened modally.');
                }
                if (!document.body.contains(this.dialog_)) {
                    throw new Error('Failed to execute \'showModal\' on dialog: The element is not in a Document.');
                }
                if (!dialogPolyfill.dm.pushDialog(this)) {
                    throw new Error('Failed to execute \'showModal\' on dialog: There are too many open modal dialogs.');
                }

                if (createsStackingContext(this.dialog_.parentElement)) {
                    console.warn('A dialog is being shown inside a stacking context. ' +
                            'This may cause it to be unusable. For more information, see this link: ' +
                            'https://github.com/GoogleChrome/dialog-polyfill/#stacking-context');
                }

                this.setOpen(true);
                this.openAsModal_ = true;

                // Optionally center vertically, relative to the current viewport.
                if (dialogPolyfill.needsCentering(this.dialog_)) {
                    dialogPolyfill.reposition(this.dialog_);
                    this.replacedStyleTop_ = true;
                } else {
                    this.replacedStyleTop_ = false;
                }

                // Insert backdrop.
                this.dialog_.parentNode.insertBefore(this.backdrop_, this.dialog_.nextSibling);

                // Focus on whatever inside the dialog.
                this.focus_();
            },
            /**
             * Closes this HTMLDialogElement. This is optional vs clearing the open
             * attribute, however this fires a 'close' event.
             *
             * @param {string=} opt_returnValue to use as the returnValue
             */
            close: function (opt_returnValue) {
                if (!this.dialog_.hasAttribute('open')) {
                    throw new Error('Failed to execute \'close\' on dialog: The element does not have an \'open\' attribute, and therefore cannot be closed.');
                }
                this.setOpen(false);

                // Leave returnValue untouched in case it was set directly on the element
                if (opt_returnValue !== undefined) {
                    this.dialog_.returnValue = opt_returnValue;
                }

                // Triggering "close" event for any attached listeners on the <dialog>.
                var closeEvent = new supportCustomEvent('close', {
                    bubbles: false,
                    cancelable: false
                });

                // If we have an onclose handler assigned and it's a function, call it
                if (this.dialog_.onclose instanceof Function) {
                    this.dialog_.onclose(closeEvent);
                }

                // Dispatch the event as normal
                this.dialog_.dispatchEvent(closeEvent);

            }

        };

        var dialogPolyfill = {};

        dialogPolyfill.reposition = function (element) {
            var scrollTop = document.body.scrollTop || document.documentElement.scrollTop;
            var topValue = scrollTop + (window.innerHeight - element.offsetHeight) / 2;
            element.style.top = Math.max(scrollTop, topValue) + 'px';
        };

        dialogPolyfill.isInlinePositionSetByStylesheet = function (element) {
            for (var i = 0; i < document.styleSheets.length; ++i) {
                var styleSheet = document.styleSheets[i];
                var cssRules = null;
                // Some browsers throw on cssRules.
                try {
                    cssRules = styleSheet.cssRules;
                } catch (e) {
                }
                if (!cssRules) {
                    continue;
                }
                for (var j = 0; j < cssRules.length; ++j) {
                    var rule = cssRules[j];
                    var selectedNodes = null;
                    // Ignore errors on invalid selector texts.
                    try {
                        selectedNodes = document.querySelectorAll(rule.selectorText);
                    } catch (e) {
                    }
                    if (!selectedNodes || !inNodeList(selectedNodes, element)) {
                        continue;
                    }
                    var cssTop = rule.style.getPropertyValue('top');
                    var cssBottom = rule.style.getPropertyValue('bottom');
                    if ((cssTop && cssTop !== 'auto') || (cssBottom && cssBottom !== 'auto')) {
                        return true;
                    }
                }
            }
            return false;
        };

        dialogPolyfill.needsCentering = function (dialog) {
            var computedStyle = window.getComputedStyle(dialog);
            if (computedStyle.position !== 'absolute') {
                return false;
            }

            // We must determine whether the top/bottom specified value is non-auto.  In
            // WebKit/Blink, checking computedStyle.top == 'auto' is sufficient, but
            // Firefox returns the used value. So we do this crazy thing instead: check
            // the inline style and then go through CSS rules.
            if ((dialog.style.top !== 'auto' && dialog.style.top !== '') ||
                    (dialog.style.bottom !== 'auto' && dialog.style.bottom !== '')) {
                return false;
            }
            return !dialogPolyfill.isInlinePositionSetByStylesheet(dialog);
        };

        /**
         * @param {!Element} element to force upgrade
         */
        dialogPolyfill.forceRegisterDialog = function (element) {
            if (window.HTMLDialogElement || element.showModal) {
                console.warn('This browser already supports <dialog>, the polyfill ' +
                        'may not work correctly', element);
            }
            if (element.localName !== 'dialog') {
                throw new Error('Failed to register dialog: The element is not a dialog.');
            }
            new dialogPolyfillInfo(/** @type {!HTMLDialogElement} */ (element));
        };

        /**
         * @param {!Element} element to upgrade, if necessary
         */
        dialogPolyfill.registerDialog = function (element) {
            if (!element.showModal) {
                dialogPolyfill.forceRegisterDialog(element);
            }
        };

        /**
         * @constructor
         */
        dialogPolyfill.DialogManager = function () {
            /** @type {!Array<!dialogPolyfillInfo>} */
            this.pendingDialogStack = [];

            var checkDOM = this.checkDOM_.bind(this);

            // The overlay is used to simulate how a modal dialog blocks the document.
            // The blocking dialog is positioned on top of the overlay, and the rest of
            // the dialogs on the pending dialog stack are positioned below it. In the
            // actual implementation, the modal dialog stacking is controlled by the
            // top layer, where z-index has no effect.
            this.overlay = document.createElement('div');
            this.overlay.className = '_dialog_overlay';
            this.overlay.addEventListener('click', function (e) {
                this.forwardTab_ = undefined;
                e.stopPropagation();
                checkDOM([]);  // sanity-check DOM
            }.bind(this));

            this.handleKey_ = this.handleKey_.bind(this);
            this.handleFocus_ = this.handleFocus_.bind(this);

            this.zIndexLow_ = 100000;
            this.zIndexHigh_ = 100000 + 150;

            this.forwardTab_ = undefined;

            if ('MutationObserver' in window) {
                this.mo_ = new MutationObserver(function (records) {
                    var removed = [];
                    records.forEach(function (rec) {
                        for (var i = 0, c; c = rec.removedNodes[i]; ++i) {
                            if (!(c instanceof Element)) {
                                continue;
                            } else if (c.localName === 'dialog') {
                                removed.push(c);
                            }
                            removed = removed.concat(c.querySelectorAll('dialog'));
                        }
                    });
                    removed.length && checkDOM(removed);
                });
            }
        };

        /**
         * Called on the first modal dialog being shown. Adds the overlay and related
         * handlers.
         */
        dialogPolyfill.DialogManager.prototype.blockDocument = function () {
            document.documentElement.addEventListener('focus', this.handleFocus_, true);
            document.addEventListener('keydown', this.handleKey_);
            this.mo_ && this.mo_.observe(document, {childList: true, subtree: true});
        };

        /**
         * Called on the first modal dialog being removed, i.e., when no more modal
         * dialogs are visible.
         */
        dialogPolyfill.DialogManager.prototype.unblockDocument = function () {
            document.documentElement.removeEventListener('focus', this.handleFocus_, true);
            document.removeEventListener('keydown', this.handleKey_);
            this.mo_ && this.mo_.disconnect();
        };

        /**
         * Updates the stacking of all known dialogs.
         */
        dialogPolyfill.DialogManager.prototype.updateStacking = function () {
            var zIndex = this.zIndexHigh_;

            for (var i = 0, dpi; dpi = this.pendingDialogStack[i]; ++i) {
                dpi.updateZIndex(--zIndex, --zIndex);
                if (i === 0) {
                    this.overlay.style.zIndex = --zIndex;
                }
            }

            // Make the overlay a sibling of the dialog itself.
            var last = this.pendingDialogStack[0];
            if (last) {
                var p = last.dialog.parentNode || document.body;
                p.appendChild(this.overlay);
            } else if (this.overlay.parentNode) {
                this.overlay.parentNode.removeChild(this.overlay);
            }
        };

        /**
         * @param {Element} candidate to check if contained or is the top-most modal dialog
         * @return {boolean} whether candidate is contained in top dialog
         */
        dialogPolyfill.DialogManager.prototype.containedByTopDialog_ = function (candidate) {
            while (candidate = findNearestDialog(candidate)) {
                for (var i = 0, dpi; dpi = this.pendingDialogStack[i]; ++i) {
                    if (dpi.dialog === candidate) {
                        return i === 0;  // only valid if top-most
                    }
                }
                candidate = candidate.parentElement;
            }
            return false;
        };

        dialogPolyfill.DialogManager.prototype.handleFocus_ = function (event) {
            if (this.containedByTopDialog_(event.target)) {
                return;
            }

            if (document.activeElement === document.documentElement) {
                return;
            }

            event.preventDefault();
            event.stopPropagation();
            safeBlur(/** @type {Element} */ (event.target));

            if (this.forwardTab_ === undefined) {
                return;
            }  // move focus only from a tab key

            var dpi = this.pendingDialogStack[0];
            var dialog = dpi.dialog;
            var position = dialog.compareDocumentPosition(event.target);
            if (position & Node.DOCUMENT_POSITION_PRECEDING) {
                if (this.forwardTab_) {
                    // forward
                    dpi.focus_();
                } else if (event.target !== document.documentElement) {
                    // backwards if we're not already focused on <html>
                    document.documentElement.focus();
                }
            }

            return false;
        };

        dialogPolyfill.DialogManager.prototype.handleKey_ = function (event) {
            this.forwardTab_ = undefined;
            if (event.keyCode === 27) {
                event.preventDefault();
                event.stopPropagation();
                var cancelEvent = new supportCustomEvent('cancel', {
                    bubbles: false,
                    cancelable: true
                });
                var dpi = this.pendingDialogStack[0];
                if (dpi && dpi.dialog.dispatchEvent(cancelEvent)) {
                    dpi.dialog.close();
                }
            } else if (event.keyCode === 9) {
                this.forwardTab_ = !event.shiftKey;
            }
        };

        /**
         * Finds and downgrades any known modal dialogs that are no longer displayed. Dialogs that are
         * removed and immediately readded don't stay modal, they become normal.
         *
         * @param {!Array<!HTMLDialogElement>} removed that have definitely been removed
         */
        dialogPolyfill.DialogManager.prototype.checkDOM_ = function (removed) {
            // This operates on a clone because it may cause it to change. Each change also calls
            // updateStacking, which only actually needs to happen once. But who removes many modal dialogs
            // at a time?!
            var clone = this.pendingDialogStack.slice();
            clone.forEach(function (dpi) {
                if (removed.indexOf(dpi.dialog) !== -1) {
                    dpi.downgradeModal();
                } else {
                    dpi.maybeHideModal();
                }
            });
        };

        /**
         * @param {!dialogPolyfillInfo} dpi
         * @return {boolean} whether the dialog was allowed
         */
        dialogPolyfill.DialogManager.prototype.pushDialog = function (dpi) {
            var allowed = (this.zIndexHigh_ - this.zIndexLow_) / 2 - 1;
            if (this.pendingDialogStack.length >= allowed) {
                return false;
            }
            if (this.pendingDialogStack.unshift(dpi) === 1) {
                this.blockDocument();
            }
            this.updateStacking();
            return true;
        };

        /**
         * @param {!dialogPolyfillInfo} dpi
         */
        dialogPolyfill.DialogManager.prototype.removeDialog = function (dpi) {
            var index = this.pendingDialogStack.indexOf(dpi);
            if (index === -1) {
                return;
            }

            this.pendingDialogStack.splice(index, 1);
            if (this.pendingDialogStack.length === 0) {
                this.unblockDocument();
            }
            this.updateStacking();
        };

        dialogPolyfill.dm = new dialogPolyfill.DialogManager();
        dialogPolyfill.formSubmitter = null;
        dialogPolyfill.useValue = null;

        /**
         * Installs global handlers, such as click listers and native method overrides. These are needed
         * even if a no dialog is registered, as they deal with <form method="dialog">.
         */
        if (window.HTMLDialogElement === undefined) {

            /**
             * If HTMLFormElement translates method="DIALOG" into 'get', then replace the descriptor with
             * one that returns the correct value.
             */
            var testForm = document.createElement('form');
            testForm.setAttribute('method', 'dialog');
            if (testForm.method !== 'dialog') {
                var methodDescriptor = Object.getOwnPropertyDescriptor(HTMLFormElement.prototype, 'method');
                if (methodDescriptor) {
                    // nb. Some older iOS and older PhantomJS fail to return the descriptor. Don't do anything
                    // and don't bother to update the element.
                    var realGet = methodDescriptor.get;
                    methodDescriptor.get = function () {
                        if (isFormMethodDialog(this)) {
                            return 'dialog';
                        }
                        return realGet.call(this);
                    };
                    var realSet = methodDescriptor.set;
                    methodDescriptor.set = function (v) {
                        if (typeof v === 'string' && v.toLowerCase() === 'dialog') {
                            return this.setAttribute('method', v);
                        }
                        return realSet.call(this, v);
                    };
                    Object.defineProperty(HTMLFormElement.prototype, 'method', methodDescriptor);
                }
            }

            /**
             * Global 'click' handler, to capture the <input type="submit"> or <button> element which has
             * submitted a <form method="dialog">. Needed as Safari and others don't report this inside
             * document.activeElement.
             */
            document.addEventListener('click', function (ev) {
                dialogPolyfill.formSubmitter = null;
                dialogPolyfill.useValue = null;
                if (ev.defaultPrevented) {
                    return;
                }  // e.g. a submit which prevents default submission

                var target = /** @type {Element} */ (ev.target);
                if (!target || !isFormMethodDialog(target.form)) {
                    return;
                }

                var valid = (target.type === 'submit' && ['button', 'input'].indexOf(target.localName) > -1);
                if (!valid) {
                    if (!(target.localName === 'input' && target.type === 'image')) {
                        return;
                    }
                    // this is a <input type="image">, which can submit forms
                    dialogPolyfill.useValue = ev.offsetX + ',' + ev.offsetY;
                }

                var dialog = findNearestDialog(target);
                if (!dialog) {
                    return;
                }

                dialogPolyfill.formSubmitter = target;

            }, false);

            /**
             * Replace the native HTMLFormElement.submit() method, as it won't fire the
             * submit event and give us a chance to respond.
             */
            var nativeFormSubmit = HTMLFormElement.prototype.submit;
            var replacementFormSubmit = function () {
                if (!isFormMethodDialog(this)) {
                    return nativeFormSubmit.call(this);
                }
                var dialog = findNearestDialog(this);
                dialog && dialog.close();
            };
            HTMLFormElement.prototype.submit = replacementFormSubmit;

            /**
             * Global form 'dialog' method handler. Closes a dialog correctly on submit
             * and possibly sets its return value.
             */
            document.addEventListener('submit', function (ev) {
                if (ev.defaultPrevented) {
                    return;
                }  // e.g. a submit which prevents default submission

                var form = /** @type {HTMLFormElement} */ (ev.target);
                if (!isFormMethodDialog(form)) {
                    return;
                }
                ev.preventDefault();

                var dialog = findNearestDialog(form);
                if (!dialog) {
                    return;
                }

                // Forms can only be submitted via .submit() or a click (?), but anyway: sanity-check that
                // the submitter is correct before using its value as .returnValue.
                var s = dialogPolyfill.formSubmitter;
                if (s && s.form === form) {
                    dialog.close(dialogPolyfill.useValue || s.value);
                } else {
                    dialog.close();
                }
                dialogPolyfill.formSubmitter = null;

            }, false);
        }

        return dialogPolyfill;

    }));

    var dialogos = document.getElementsByTagName('dialog');
    for (var n = 0; n < dialogos.length; n++) {
        var dialogo = dialogos[n];
        dialogPolyfill.registerDialog(dialogo);
    }
</script>


<div style="text-align: center;position: fixed;bottom: 0;float: left;width: 100%;margin-bottom: 10px;"  ><label style="color: black;" ><%=confObj.getCopyRigth()%></label></div>

</body>
</html>
