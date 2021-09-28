<%@page import="java.io.File"%>
<%@page import="com.sadm.dao.Pagina"%>
<%@page import="com.sadm.dao.Config"%>
<%@page import="com.sadm.dao.Noticia"%>
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
        <title>Edición y Administración de Noticias</title>
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
            #agregar_cont_pag {width: 100%;border: 2px #000000 solid;overflow: scroll;}
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
                    output.innerHTML = "<div>" + e.target.result + "</div>";

                };
                reader.readAsText(file);

            }
            var dropBox;
            window.onload = function () {
                dropBox = document.getElementById("agregar_cont_pag");
                dropBox.ondragenter = ignoreDrag;
                dropBox.ondragover = ignoreDrag;
                dropBox.ondrop = drop;
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
                    $("#tblNoticias tr").filter(function () {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                });
                $("#myInput2").on("keyup", function () {
                    var value = $(this).val().toLowerCase();
                    $("#tblNoticias2 tr").filter(function () {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                });
                $("#myInput3").on("keyup", function () {
                    var value = $(this).val().toLowerCase();
                    $("#tblNoticias3 tr").filter(function () {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                });
                 $("#myInput4").on("keyup", function () {
                    var value = $(this).val().toLowerCase();
                    $("#tblNoticias4 tr").filter(function () {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                });
                 $("#myInput5").on("keyup", function () {
                    var value = $(this).val().toLowerCase();
                    $("#tblNoticias5 tr").filter(function () {
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
                    <h1 id="dash_heading_h1" style="text-align: center;color: white;font-family: sans-serif;" title="Panel del Administrador">Administración de Noticias</h1>
                    <div>
                        <form action="salir"   method="post" id="formsalir" >
                            <button type="button" class="btn btn-outline-success" onclick="agregarNot.showModal();" data-toggle="modal" style="width: 5%;height: 5%;margin: 10px;"><img style="width: 100%;" src="archivos\uploaded_files\agregar_icon.png" title="Agregar nueva noticia"/></button>
                            <button type="button" class="btn btn-outline-warning" data-toggle="modal" onclick="location = '/SADM/DashBoard.jsp'" style="width: 5%;height: 5%;margin: 10px;"><img style="width: 100%;" src="archivos\uploaded_files\regresar.png" title="Regresar al DashBoard"/></button>
                            <button type="submit"  class="btn btn-outline-danger" data-toggle="modal" title="Cerrar Sesión"   style="width: 5%;height: 5%;margin: 10px;"><img style="width: 100%;" src="archivos\uploaded_files\salir.png" /></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <div class="content-section">
            <div class="fondoHeadHome row text-center"  align="center" >
                <div  align="center" style="alignment-adjust: central;width: 100%;" >
                    <video muted autoplay loop style="background-image:url(/SADM/archivos/uploaded_files/5c50c06a6968a9a3a5d1ba0c_presa_la_boca.jpeg)" >
                        <source src="archivos/uploaded_files/video_base.mp4" > 
                    </video>
                    <div class="form-group" style="text-align:center;background-color: white;width: 100%;" >
                        <div style="overflow: scroll;max-height: 500px;background-color: white;width: 99%;" >
                            <div class="w-dyn-list" >
                                <div class="w-dyn-items">
                                    <div  >
                                        <div  data-ix="move-up-on-load" class="title-box-3" >


                                            <table id="tblNoticias" name="tblNoticias" class="table table-striped"  style="text-align: center;" >
                                                <%
                                                    Consultas consultas = new Consultas();
                                                    List<Noticia> listaNoticias = consultas.obtAllNoticias();
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

                                                %>
                                                <thead>
                                                    <tr > 
                                                <label style="margin-right: 40px;margin-bottom: 20px;margin-top: 10px;margin-left: 150px;float: left;color: #516179;font-weight: bold;font-size: 22px;font-family: 'Roboto', sans-serif;">  
                                                    <input id="myInput" title="Teclea un criterio de búsqueda." style="border-top: none;border-left: none;border-right: none;border-bottom-color: #90AFCE;width: 300px;color:#A0A0A0;font-size: 22px;font-family: 'Roboto', sans-serif;"   type="search" placeholder="Búsqueda por título ó fecha.">
                                                </label>
                                                </tr>
                                                <tr style="alignment-adjust: auto;background-color: whitesmoke;">

                                                    <th >Título</th>
                                                    <th >Fecha</th>
                                                    <th >Acciones</th>
                                                </tr>
                                                </thead>
                                                <tbody  id="myTable" style="background-color: white;">
                                                    <%                                            for (Noticia pagina : listaNoticias) {

                                                            p1 = pagina.getUid_Noticia();
                                                            p2 = pagina.getId_Noticia();
                                                            p3 = pagina.getH3_img_noticia();
                                                            p3 = p3.replaceAll("'", "&quot;");

                                                            p4 = pagina.getTitle_notice_noticia();
                                                            p5 = pagina.getEncab_notice();
                                                            p5 = p5.replaceAll("\"", "&quot;");
                                                            p5 = p5.replaceAll("\r\n", "");
                                                            p5 = p5.replaceAll("'", "´");
                                                            p5 = p5.replaceAll("&#039;", "´");
                                                            p5 = p5.replaceAll("&#027;", "´");
                                                            //p5 = p5.replaceAll("'", "&#039;");//p5 = p5.replaceAll("'", "&#027;");

                                                            p6 = pagina.getCont_notice();
                                                            if (p6 != null && p6 != "") {
                                                                p6 = p6.replaceAll("\"", "&quot;");
                                                                p6 = p6.replaceAll("\r\n", "");
                                                                p6 = p6.replaceAll("'", "´");
                                                                p6 = p6.replaceAll("&#039;", "´");
                                                                p6 = p6.replaceAll("&#027;", "´");
                                                                //p6 = p6.replaceAll("'", "&#039;");//p6 = p6.replaceAll("'", "&#027;");
                                                            }
                                                            p7 = pagina.getNoticia_fecha();
                                                            p8 = pagina.getFechamodif();
                                                            p9 = pagina.getUsuariomodif();
                                                            p10 = pagina.getComents();
                                                            p11 = pagina.getVal1();
                                                            p12 = pagina.getVal2();
                                                            p13 = pagina.getVal3();
                                                            p14 = pagina.getActivo();

                                                           // System.out.println(":pagina:::::::" + p1 + "::" + p2 + "::" + p3 + "::" + p4 + "::" + p5 + "::" + p6 + "::" + p7 + "::" + p8 + "::" + p9 + "::" + p10 + "::" + p11 + "::" + p12 + "::" + p13 + "::" + p14 + "::");

                                                    %>

                                                    <tr>


                                                        <td style="margin: 20px;text-align: center;width: 200px;"><%=p4%></td>
                                                        <td style="margin: 20px;text-align: center;width: 100px;"><%=p7%></td>
                                                        <td style="width: 10%;">
                                                            <button type="button" onclick="editarPagina('<%=p1%>', '<%=p2%>', '<%=p3%>', '<%=p4%>', '<%=p5%>', '<%=p6%>', '<%=p7%>', '<%=p8%>', '<%=p9%>', '<%=p10%>', '<%=p11%>', '<%=p12%>', '<%=p13%>', '<%=p14%>'), editNot.showModal()" class="btn btn-outline-info" data-toggle="modal"  style="width: 30%;height: 30%;margin: 2px;"><img style="width: 100%;" src="archivos\uploaded_files\pencil.png" title="Editar"/></button>
                                                            <button type="button"   onclick="eliminarPagina('<%=p1%>')"  class="btn btn-outline-danger" data-toggle="modal" data-target=".bd-eliminarnoticia-modal-lg" style="width: 30%;height: 30%;margin: 2px;"><img style="width: 100%;" src="archivos\uploaded_files\trash.png" title="Eliminar"/></button>
                                                        </td>
                                                    </tr>
                                                <script>
                                                    function eliminarPagina(p1) {
                                                        document.getElementById("idNotElim").value = p1;
                                                    }
                                                    function editarPagina(pp1, pp2, pp3, pp4, pp5, pp6, pp7, pp8, pp9, pp10, pp11, pp12, pp13, pp14) {

                                                        document.editNotice.edit_id_not.value = pp2;
                                                        document.editNotice.edit_fech_not.value = pp7;
                                                        document.editNotice.edit_urlimagenmini_1.value = pp3;
                                                        document.editNotice.edit_tit_not.value = pp4;
                                                        document.editNotice.edit_encab_not.value = pp5;
                                                        document.editNotice.edit_activo_not.value = pp14;
                                                        if (pp14 === "t") {
                                                            document.getElementById("CheckVal2").checked = true;
                                                        } else {
                                                            document.getElementById("CheckVal2").checked = false;
                                                        }

                                                        document.getElementById("editar_cont_pag").innerHTML = pp6;
                                                        document.getElementById("uid").value = pp1;
                                                    }
                                                </script>
                                                <%
                                                        p1 = "";
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
                                                    }
                                                %>

                                                </tbody>

                                            </table>
                                            <%                                        if (request.getParameter("b") != "" && request.getParameter("b") != null && request.getParameter("b") != " ") {
                                                    System.out.println(":::: eliminarNoticia" + request.getParameter("b") + " ::::");
                                                    
                                                    consultas.eliminarNoticia(request.getParameter("b"));
                                                }%> 
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

                width: 90%;
                height: 90%;

            }
        </style>

        <!--ELIMINAR NOTICIA-->     
        <div class="modal fade bd-eliminarnoticia-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="background-image:url(&quot;archivos/uploaded_files/fondo_agua_sadm_1_1.jpg&quot;);background-size: cover;">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <form action="eliminarnoticia"  method="post" id="formEliminarNot"  >
                    <input type="text" id="idNotElim" name="idNotElim" hidden>

                    <div class="modal-content">

                        <div class="modal-header">
                            <h1> <span class="badge badge-secondary">Eliminar Noticia</span></h1><br>
                        </div>
                        <div class="modal-body">
                            <div class="card" style="text-align:center;background-color: #F78181;">
                                <div class="card-body">
                                    <div class="alert alert-warning" role="alert">
                                        <h1> ¿Estás seguro de eliminar la Noticia Seleccionada?</h1>
                                    </div>

                                </div>   
                            </div>
                        </div>
                        <div class="modal-footer">

                            <button title="Presiona para eliminar el registro" id="btnElimNot" onclick="submit()" type="button" class="btn btn-primary" style="margin: 20px;">Confirmar Eliminar</button>

                            <button title="Presiona para regresar" type="button" class="btn btn-secondary" data-dismiss="modal" style="margin: 20px;">Cancelar</button>
                        </div>
                    </div>
                </form>
            </div>

        </div>

    <dialog id="editNot"   > 
        <div >
            <form id="editNotice" name="editNotice" action="editarnoticia"  method="post" accept-charset="ISO-8859-1">
                <div id="EditarDiv" name="EditarDiv" style="text-align: center;"   >
                    <table class="table table-striped" border="0" style="text-align: center;alignment-adjust: central;">
                        <thead>
                        <th colspan="4" style="height: 30px;">Editar Noticia</th>
                        </thead>
                        <tbody >
                            <tr>
                                <td title="Ingresa un identificador único para la noticia, verifica no exista el id ya que son únicos"><strong>Identificador:</strong><input id="edit_id_not" name="edit_id_not"   ></td>
                                <td title="Selecciona la fecha de la noticia"><strong>Fecha:</strong><br> <input type="date" id="edit_fech_not"  name="edit_fech_not" pattern="[0-9]{2}-[0-9]{2}-[0-9]{4}"  ></td>
                                <td title="Selecciona un imagen para mostrar en la noticia"><strong>Imagen:</strong>
                                    
                           <input title="Selecciona una imagen de la galería del portal" type="button" onclick="vistaIIGa.showModal(), document.getElementById('edit_urlimagenmini').value = '';" value="Insertar Imagen desde la Galería">
                           <input id="edit_urlimagenmini" name="edit_urlimagenmini"  onblur="f2_edit()" hidden></td>


                            </tr>
                            <tr>

                                <td title="Agrega el título para tu noticia" ><strong>Título:</strong><br><input id="edit_tit_not " name="edit_tit_not"   ></td>
                                <td title="Ingresa el Encabezado a mostrar en tu noticia." ><strong>Encabezado:</strong><br><textarea id="edit_encab_not " name="edit_encab_not" cols="55" ></textarea></td>
                                <td title="Elige estatus activo o inactivo a tu noticia para mostrarse."><select hidden id="edit_activo_not" name="edit_activo_not" size="1">
                                        <option value="t">True</option>
                                        <option value="f">False</option>
                                    </select>
                                    <div class="input-group-prepend">
                                        <div  class="demo" style="float: right;">
                                            <input  onclick="valChked()"  style="border-color: #58585A;" type="checkbox" id="CheckVal2" >
                                            <label style="font-family: 'Roboto', sans-serif;color: #58585A;font-size: 14px;"  for="CheckVal"><span></span><strong>Activo</strong></label>
                                        </div>
                                        <script>
                                            function valChked() {

                                                if (document.getElementById('CheckVal2').checked) {

                                                    document.getElementById('edit_activo_not').value = "t";
                                                } else {
                                                    document.getElementById("edit_activo_not").value = "f";
                                                }

                                            }
                                        </script>
                                    </div> 
                                </td> 
                            </tr>

                        </tbody>

                    </table>
                    <input id="edit_urlimagenmini_1" name="edit_urlimagenmini_1"   readonly hidden  >
                    <script>
                        function f2_edit() {
                            var edit = document.getElementById('edit_urlimagenmini');
                            var b_edit = edit.value;

                            var fileN_edit = '';
                            fileN_edit = b_edit.split('\\').pop();
                            document.getElementById('edit_urlimagenmini').value = "archivos/uploaded_files/" + fileN_edit;

                        }</script>

                    <textarea id="edit_con_pag" name="edit_con_pag" hidden ></textarea>

                    <section class="opciones">

                        <input title="Presiona para relacionar el hipervinculo con texto seleccionado." type="button" value="Hipervínculo" onclick="if (document.getElementById('szURL9').checkValidity()) {
                                    document.execCommand('CreateLink', false, document.getElementById('szURL9').value);
                                }">
                        <input title="Ingresa textualmente la url a vincular con el texto seleccionado." type="url" id="szURL9" >
                        <select title="Selecciona de las páginas existentes la url para vincular" id="slctPag" onchange="slctPagHiper();" > 
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
                                if (document.getElementById("slctPag").value === "") {
                                    document.getElementById("szURL9").value = '';
                                } else {
                                    document.getElementById("szURL9").value = 'http:/SADM/index.jsp?id_html=' + document.getElementById("slctPag").value;
                                }
                            }
                        </script>
                        <select title="Selecciona un color para texto seleccionado." onchange="formatoFuente('forecolor', this[this.selectedIndex].value);
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
                        <div contenteditable="true" style="background-color: lightyellow;border-color: black;border-width: medium;" > 
                            <div title="Edita el contenido de la noticia" id="editar_cont_pag" name="editar_cont_pag" contenteditable="true" style="min-height: 100px;border-width: medium;" ><p data-ix="move-up-on-load-3" style="opacity: 1; transform: translateX(0px) translateY(0px) translateZ(0px); transition: opacity 300ms ease 0s, transform 800ms ease 0s;">Agregar Aquí Contenido de la Noticia</p></div>
                        </div>
                        <section class="opciones">

                            <a title="Accesa a la administración de archivos de la galería." target="_blank" href="/SADM/AdminArchivos.jsp" ><strong>Importar nuevas imagenes al Proyecto:</strong></a>

                            <strong>Importar archivo de Texto: </strong>
                            <input title="Selecciona documentos de texto para publicar contenido de tu noticia" id="edit_fileInput" type="file" onchange="processFiles(this.files)">
                            <br>                          

                            <input title="Presiona para utilizar un archivo existente en la galería del portal" type="button" onclick="vistaIIG.showModal(), document.getElementById('edit_in_urlimagenmini_10').value = '';" value="Seleccionar Imagen de la Galería">
                            <input id="edit_in_urlimagenmini_10" name="edit_in_urlimagenmini_10"   readonly  hidden >

                            <input title="Presiona para insertar la imagen seleccionada donde se encuentre el cursor del contenido" type="button" value="Insertar Imagen seleccionada de la galería" onclick="document.execCommand('InsertImage', false, document.getElementById('edit_in_urlimagenmini_10').value);">

                        </section>

                    </div>

                    </h3>

                    <input   name="editUserNot" value="<%=usuario%>" hidden> 
                    <input   id="uid"  name="uid" readonly hidden > 

                    <input title="Regresar" type="button" onclick="editNot.close(), regresarEditar()" value="Regresar">
                    <input title="Limpiar formulario" type="reset"  value="Limpiar">
                    <input title="Genera una vista previa de tu noticia" type="button" onclick="vistaPrevEdit()" value="Vista Previa">
                    <input title="Presiona para continuar a guardar" id="continuarEdit"  name="continuarEdit" type="button"  onclick="continuarEditandol()" style="margin: 20px;alignment-adjust: central;background-color:#A3E7FF;" value="Continuar con la edición de la Noticia">
                    <input title="Presiona para guardar la noticia" id="guardarEdit"  name="guardarEdit" type="submit"    style="margin: 20px;alignment-adjust: central;background-color:#99FF99;" value="Guardar los cambios en la Noticia" hidden>
                </div>
                <script>
                    function  regresarEditar() {
                        //alert("regresarEditar");
                        document.editNotice.continuarEdit.hidden = false;
                        document.editNotice.guardarEdit.hidden = true;
                        document.editNotice.edit_con_pag.value = "";
                        document.editNotice.validarEditar.value = "";

                    }
                </script>
                <script>
                    function continuarEditandol() {

                        var id_Noticia = false;


                        if (document.editNotice.edit_id_not.value === null || document.editNotice.edit_id_not.value === "") {
                            id_Noticia = true;
                            alert("El Id de Noticia es requerido");
                        }



                        if (id_Noticia === false) {
                            document.editNotice.continuarEdit.hidden = true;
                            document.editNotice.guardarEdit.hidden = false;
                            document.editNotice.edit_con_pag.value = document.getElementById("editar_cont_pag").innerHTML;
                            document.editNotice.validarEditar.value = "true";

                        }
                    }
                </script>
            </form>
        </div>
        <script>
            function vistaPrevEdit() {
                editNot.close();
                vistaPrevNotEdit.showModal();
                document.getElementById('pren_img_noticia_edit').style.backgroundImage = "url(' " + document.getElementById('edit_urlimagenmini_1').value;
                +"')";

                document.getElementById('title_new_not_edit').innerHTML = document.editNotice.edit_tit_not.value;
                document.getElementById('p_new_notice_edit').innerHTML = document.editNotice.edit_encab_not.value;


                document.editNotice.edit_con_pag.value = document.getElementById('editar_cont_pag').innerHTML;
                var cont = document.editNotice.edit_con_pag.value;

                document.getElementById("pcont_edit").innerHTML = cont;

                document.getElementById('f_not_edit').value = document.getElementById('edit_fech_not').value;
            }

        </script>

    </dialog>

     <dialog id="vistaIIG">
        <form  name="vistIIGEdit" id="vistIIG">
            <div>

                <table class="table table-striped" id='tblNoticias2'style="text-align: center;">
                    <thead>
                    <label style="margin-right: 40px;margin-bottom: 20px;margin-top: 10px;margin-left: 30px;float: left;color: #516179;font-weight: bold;font-size: 22px;font-family: 'Roboto', sans-serif;">  
                        <input id="myInput2" title="Teclea un criterio de búsqueda." style="border-top: none;border-left: none;border-right: none;border-bottom-color: #90AFCE;width: 300px;color:#A0A0A0;font-size: 22px;font-family: 'Roboto', sans-serif;"   type="search" placeholder="Búsqueda ."></label>
                    <button type="button" title="Presiona aquí para regresar a la edición de noticia" class="close" onclick="vistaIIG.close()" data-dismiss="modal" aria-label="Close" style="margin-right: 50px;">Cerrar ventana</button>
               
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
                        <tr><td><img title="Presiona para seleccionar la imagen" src='<%="archivos/uploaded_files/" + listado[i]%>' width="100" height="100" onclick="a2('<%=listado[i]%>'), vistaIIG.close()" ><br>
                            </td>
                            <td><Label  ><%=listado[i]%></label>
                            </td></tr><%
                                    }

                                }
                            %>
                    </tbody>
                </table>
                <script>
                    function a2(p) {

                        document.getElementById('edit_in_urlimagenmini_10').value = "archivos/uploaded_files/" + p;

                    }</script>
                <br>
            </div>

        </form>
    </dialog>
    
    <dialog id="vistaIIGa">
        <form  name="vistIIGEdit" id="vistIIG">
            <div>
<table class="table table-striped" id='tblNoticias3'style="text-align: center;">
                    <thead>
                    <label style="margin-right: 40px;margin-bottom: 20px;margin-top: 10px;margin-left: 30px;float: left;color: #516179;font-weight: bold;font-size: 22px;font-family: 'Roboto', sans-serif;">  
                        <input id="myInput3" title="Teclea un criterio de búsqueda." style="border-top: none;border-left: none;border-right: none;border-bottom-color: #90AFCE;width: 300px;color:#A0A0A0;font-size: 22px;font-family: 'Roboto', sans-serif;"   type="search" placeholder="Búsqueda"></label>
                    <button type="button" title="Presiona aquí para regresar a la edición de noticia" class="close" onclick="vistaIIGa.close()" data-dismiss="modal" aria-label="Close" style="margin-right: 50px;">Cerrar ventana</button>
               
                    <tr>
                        <th scope="col">Imagen</th>
                        <th scope="col">Nombre</th>
                    </tr>
                    </thead>
                    <tbody>
                        <%
                            
                            confObj = consultas.obtenerConfig();

                            carpeta = new File(confObj.getUrlUploaded_Files());
                            listado = carpeta.list();
                            if (listado == null || listado.length == 0) {
                                System.out.println("No hay elementos dentro de la carpeta actual");
                                return;
                            } else {
                                for (int i = 0; i < listado.length; i++) {
                        %>
                        <tr><td><img title="Presiona para seleccionar la imagen" src='<%="archivos/uploaded_files/" + listado[i]%>' width="100" height="100" onclick="a23('<%=listado[i]%>'), vistaIIGa.close()" ><br>
                            </td>
                            <td><Label  ><%=listado[i]%></label>
                            </td></tr><%
                                    }

                                }
                            %>
                    </tbody>
                </table>
                <script>
                    function a23(p) {

                        document.getElementById('edit_urlimagenmini').value = "archivos/uploaded_files/" +  p;

                    }</script>
                <br>
            </div>

        </form>
    </dialog>

    <dialog id="vistaPrevNot"   >
        <form  name="vistPrevNoticia" id="vistPrevNoticia">

            <div  id="pren_img_noticia" name="pren_img_noticia" class="herosectionnoticias small" style="margin-left: auto;margin-right: auto;width:100%;"></div>

            <div class="contenidonoticias bottom-padding" style="margin-left: auto;margin-right: auto;margin-top: auto;width:100%;" >
                <div class="content-wrapper narrow w-container">
                    <h1 id="title_new_not" name="title_new_not"  data-ix="move-up-on-load-2" class="heading-4 bottom-border"></h1>
                    <h2 id="p_new_notice" name="p_new_notice"></h2>


                    <h3 id="pcont"  data-ix="move-up-on-load-3" style="opacity: 1; transform: translateX(0px) translateY(0px) translateZ(0px); transition: opacity 300ms ease 0s, transform 800ms ease 0s;">

                    </h3>



                    <div data-ix="move-up-on-load-4" class="box-details">
                        <a href="" style="background-image:url(/SADM/archivos/uploaded_files/5ba3db4727f3f3d1df9a077f_logo_sadm_solo.png)" class="authors-pic w-inline-block"></a>
                        <div class="inline-text">Publicación por </div>
                        <a href="" class="inline-text">Servicios de Agua y Drenaje</a>
                        <div class="inline-text"><input readonly  style="border: 0;" name="f_not"></div></div>
                    <div class="top-border-copy w-clearfix">
                        <input title="Presiona para regresar" type="button" onclick="vistaPrevNot.close(), agregarNot.showModal()" value="Regresar"></div></div>
            </div>

        </form>
    </dialog>

    <dialog id="vistaPrevNotEdit"   >
        <form  name="vistPrevNoticiaE" id="vistPrevNoticiaE">

            <div  id="pren_img_noticia_edit" name="pren_img_noticia_edit" class="herosectionnoticias small" style="margin-left: auto;margin-right: auto;width:100%;"></div>

            <div class="contenidonoticias bottom-padding" style="margin-left: auto;margin-right: auto;margin-top: auto;width:100%;" >
                <div class="content-wrapper narrow w-container">
                    <h1 id="title_new_not_edit" name="title_new_not_edit"  data-ix="move-up-on-load-2" class="heading-4 bottom-border"></h1>
                    <h2 id="p_new_notice_edit" name="p_new_notice_edit"></h2>


                    <h3 id="pcont_edit"  data-ix="move-up-on-load-3" style="opacity: 1; transform: translateX(0px) translateY(0px) translateZ(0px); transition: opacity 300ms ease 0s, transform 800ms ease 0s;">
                    </h3>
                    <div data-ix="move-up-on-load-4" class="box-details">
                        <a href="" style="background-image:url(/SADM/archivos/uploaded_files/5ba3db4727f3f3d1df9a077f_logo_sadm_solo.png)" class="authors-pic w-inline-block"></a>
                        <div class="inline-text">Publicación por </div>
                        <a href="" class="inline-text">Servicios de Agua y Drenaje</a>
                        <div class="inline-text"><input readonly  style="border: 0;" id="f_not_edit" name="f_not_edit"></div></div>
                    <div class="top-border-copy w-clearfix">
                        <input title="Presiona para regresar" type="button" onclick="vistaPrevNotEdit.close(), editNot.showModal()" value="Regresar"></div></div>
            </div>

        </form>
    </dialog>
<!-- Agregar -->
    <dialog id="agregarNot"   > 

        <form id="newNot" name="newNot" action="agregarnoticia"  method="post" class="was-validated"   accept-charset="ISO-8859-1">
            <div id="AgregarDiv" name="AgregarDiv" style="text-align: center;"   >
                <table class="table table-striped" border="0" style="text-align: center;alignment-adjust: central;">
                    <thead>
                    <th colspan="4" style="height: 30px;">Nueva Noticia</th>
                    </thead>
                    <tbody >
                        <tr>
                            <td title="Define un identificador único para el registro de la noticia" ><strong>Identificador:</strong><br><input id="agregar_id_not" name="agregar_id_not" style="width: 50%;"></td>
                            <td title="Define una fecha para la noticia"><strong>Fecha:</strong><br><input type="date" id="agregar_fech_not"  name="agregar_fech_not" pattern="[0-9]{2}-[0-9]{2}-[0-9]{4}"  ></td>
                            <td title="Define un imagen para la noticia"><strong>Imagen:</strong><br>
                               
                                <input title="Selecciona para insertar una imagen desde la galería del portal" type="button" onclick="vistaIIIGagre5.showModal(), document.getElementById('in_urlimagenmini').value = '';" value="Insertar Imagen desde la Galería">
                                <input id="in_urlimagenmini" name="in_urlimagenmini" hidden  readonly   >
                            </td>

                        </tr>
                        <tr>

                            <td title="Define el título de la noticia" ><strong>Título:</strong><br><input id="agregar_tit_not " name="agregar_tit_not"  style="width: 100%;" > </td>
                            <td title="Define el encabezado de la noticia" ><strong>Encabezado:</strong><br><textarea id="agregar_encab_not " name="agregar_encab_not" cols="85" style="width: 80%;" ></textarea> </td>
                            <td title="Define el estatus activo de la noticia. El estatus false no se muestra público"><select hidden id="agregar_activo_not" name="agregar_activo_not"  >

                                    <option value="t">True</option>
                                    <option value="f">False</option>
                                </select>
                                <div class="input-group-prepend">
                                    <div  class="demo" style="float: left;">
                                        <input checked onclick="valChk9()"  style="border-color: #58585A;" type="checkbox" id="ChckVal" >
                                        <label style="font-family: 'Roboto', sans-serif;color: #58585A;font-size: 14px;"  for="ChckVal"><span></span>Activo</label>
                                    </div>
                                    <script>
                                        function valChk9() {

                                            if (document.getElementById('ChckVal').checked) {

                                                document.getElementById('agregar_activo_not').value = "t";
                                            } else {
                                                document.getElementById("agregar_activo_not").value = "f";
                                            }

                                        }
                                    </script>
                                </div> 
                            </td>
                        </tr>

                    </tbody>

                </table>
       

                <textarea id="ag_con_pag" name="ag_con_pag" hidden ></textarea>

                <section class="opciones">

                    <input title="Presiona para asignar el hipervínculo al texto seleccionado" type="button" value="Hipervínculo" onclick="if (document.getElementById('szURL').checkValidity()) {
                                document.execCommand('CreateLink', false, document.getElementById('szURL').value);
                            }">
                    <input title="Ingresa la url textual a vincular" type="url" id="szURL" >
                    <select title="Selecciona del listado la url de una página del portal" id="slctPg" onchange="slctPgHiper();" > 
                        <option value = ""  >Selecciona un Página</option> 
                        <%
                            
                            List<Pagina> lstPagi = consultas.obtAllPaginas();

                            for (Pagina p : lstPagi) {
                        %>
                        <option value = "<%=p.getId_pag_html()%>"  ><%=p.getId_Pagina()%></option> 
                        <%}%>
                    </select>  
                    <script>
                        function slctPgHiper() {
                            if (document.getElementById("slctPg").value === "") {
                                document.getElementById("szURL").value = '';
                            } else {
                                document.getElementById("szURL").value = 'http:/SADM/index.jsp?id_html=' + document.getElementById("slctPg").value;
                            }
                        }
                    </script>
                    <select title="Selecciona un color para el texto seleccionado" onchange="formatoFuente('forecolor', this[this.selectedIndex].value);
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
                    <div contenteditable="true" style="background-color: lightyellow;border-color: black;border-width: medium;" > 
                        <div title="Ingresa el contenido de tu noticia" id="agregar_cont_pag" name="agregar_cont_pag" contenteditable="true" style="min-height: 100px;border-width: medium;" ><p data-ix="move-up-on-load-3" style="opacity: 1; transform: translateX(0px) translateY(0px) translateZ(0px); transition: opacity 300ms ease 0s, transform 800ms ease 0s;">Agregar Aquí Contenido de la Noticia</p></div>
                    </div>
                    <section class="opciones">

                        <a  target="_blank" href="/SADM/AdminArchivos.jsp" ><strong>Importar nuevas imagenes al Proyecto:</strong></a>

                        <strong>Importar archivo de Texto: </strong>
                        <input title="Selecciona un documento de texto para importar al contenido" id="fileInput" type="file" onchange="processFiles(this.files)">
                        <br>   
                        <input title="Selecciona para insertar una imagen desde la galería del portal" type="button" onclick="vistaIIGagre4.showModal(), document.getElementById('in_urlimagenmini_10').value = '';" value="Insertar Imagen seleccionada de la galería">
                        <input id="in_urlimagenmini_10" name="in_urlimagenmini_10"   readonly  hidden >

                        <input title="Presiona para insertar la imagen seleccionada en donde posiciones el cursor del contenido" type="button" value="Insertar Imagen" onclick="document.execCommand('InsertImage', false, document.getElementById('in_urlimagenmini_10').value);">

                    </section>

                </div>

                </h3>


                <input name="agregar_usuario" value="<%=usuario%>" hidden>
                <input title="Presiona para regresar" type="button" onclick="agregarNot.close(), regresarAgregar()" value="Regresar">
                <input title="Presiona para limpiar el formulario" type="reset"  value="Limpiar">
                <input title="Presiona para generar una vista previa de la noticia" type="button" onclick="vistaPrev()" value="Vista Previa">
                <input title="Presiona para continuar a guardar" id="continuarA"  name="continuarA" type="button"  onclick="continuarAgre()" style="margin: 20px;alignment-adjust: central;background-color:#A3E7FF;" value="Continuar con la creación de la nueva Noticia">
                <input title="Presiona para guardar la noticia" id="guardarA"  name="guardarA" type="submit"    style="margin: 20px;alignment-adjust: central;background-color:#99FF99;" value="Agregar la nueva Noticia" hidden>
            </div> 
            <script>
                function  regresarAgregar() {
                    //alert("regresarAgregar");
                    document.newNot.continuarA.hidden = false;
                    document.newNot.guardarA.hidden = true;
                    document.newNot.ag_con_pag.value = "";


                }
            </script>
            <script>
                function continuarAgre() {




                    var id_Noticia = false;


                    if (document.newNot.agregar_id_not.value === null || document.newNot.agregar_id_not.value === "") {
                        id_Noticia = true;
                        alert("El Id de Noticia es requerido");
                    }



                    if (id_Noticia === false) {
                        document.newNot.continuarA.hidden = true;
                        document.newNot.guardarA.hidden = false;
                        document.newNot.ag_con_pag.value = document.getElementById("agregar_cont_pag").innerHTML;


                    }
                }
            </script>

        </form>

        <script>
            function vistaPrev() {
                agregarNot.close();
                vistaPrevNot.showModal();
                document.getElementById('pren_img_noticia').style.backgroundImage = "url(' " + document.getElementById('in_urlimagenmini_1').value + "')";

                document.getElementById('title_new_not').innerHTML = document.newNot.agregar_tit_not.value;
                document.getElementById('p_new_notice').innerHTML = document.newNot.agregar_encab_not.value;


                document.newNot.ag_con_pag.value = document.getElementById('agregar_cont_pag').innerHTML;
                var cont = document.newNot.ag_con_pag.value;

                document.getElementById("pcont").innerHTML = cont;

                document.vistPrevNoticia.f_not.value = document.getElementById('agregar_fech_not').value;




            }
        </script>
    </dialog>
    <dialog id="vistaIIGagre4">
        <form  name="vistIIGAgregar" id="vistIIGagre">
            <div>

                <table class="table table-striped" id='tblNoticias4'style="text-align: center;">
                    <thead>
                    <label style="margin-right: 40px;margin-bottom: 20px;margin-top: 10px;margin-left: 30px;float: left;color: #516179;font-weight: bold;font-size: 22px;font-family: 'Roboto', sans-serif;">  
                        <input id="myInput4" title="Teclea un criterio de búsqueda." style="border-top: none;border-left: none;border-right: none;border-bottom-color: #90AFCE;width: 300px;color:#A0A0A0;font-size: 22px;font-family: 'Roboto', sans-serif;"   type="search" placeholder="Búsqueda ."></label>
                    <button type="button" title="Presiona aquí para regresar a la edición de noticia" class="close" onclick="vistaIIGagre4.close()" data-dismiss="modal" aria-label="Close" style="margin-right: 50px;">Cerrar ventana</button>
               
                    <tr>
                        <th scope="col">Imagen</th>
                        <th scope="col">Nombre</th>
                    </tr>
                    </thead>
                    <tbody>
                        <%
                            
                            Config onfObj = consultas.obtenerConfig();

                            File capeta = new File(onfObj.getUrlUploaded_Files());
                            String[] lstado = capeta.list();
                            if (listado == null || listado.length == 0) {
                                System.out.println("No hay elementos dentro de la carpeta actual");
                                return;
                            } else {
                                for (int i = 0; i < listado.length; i++) {
                        %>
                        <tr><td><img title="Presiona para seleccionar la imagen" src='<%="archivos/uploaded_files/" + lstado[i]%>' width="100" height="100" onclick="d2('<%=lstado[i]%>'), vistaIIGagre4.close()" ><br>
                            </td>
                            <td><Label  ><%=listado[i]%></label>
                            </td></tr><%
                                    }

                                }
                            %>
                    </tbody>
                </table>
                <script>
                    function d2(p) {

                        document.getElementById('in_urlimagenmini_10').value = "archivos/uploaded_files/" + p;

                    }</script>
                <br>
            </div>

        </form>
    </dialog>

    <dialog id="vistaIIIGagre5">
        <form  name="vistIIIGAgregar" id="vistIIGagre">
            <div>

                <table class="table table-striped" id='tblNoticias5'style="text-align: center;">
                    <thead>
                    <label style="margin-right: 40px;margin-bottom: 20px;margin-top: 10px;margin-left: 30px;float: left;color: #516179;font-weight: bold;font-size: 22px;font-family: 'Roboto', sans-serif;">  
                        <input id="myInput5" title="Teclea un criterio de búsqueda." style="border-top: none;border-left: none;border-right: none;border-bottom-color: #90AFCE;width: 300px;color:#A0A0A0;font-size: 22px;font-family: 'Roboto', sans-serif;"   type="search" placeholder="Búsqueda ."></label>
                    <button type="button" title="Presiona aquí para regresar a la edición de noticia" class="close" onclick="vistaIIIGagre5.close()" data-dismiss="modal" aria-label="Close" style="margin-right: 50px;">Cerrar ventana</button>
               
                    <tr>
                        <th scope="col">Imagen</th>
                        <th scope="col">Nombre</th>
                    </tr>
                    </thead>
                    <tbody>
                        <%
                            
                            Config ofObj = consultas.obtenerConfig();
                            consultas.getConexion().close();
                            File capet = new File(ofObj.getUrlUploaded_Files());
                            String[] lstad = capet.list();
                            if (listado == null || listado.length == 0) {
                                System.out.println("No hay elementos dentro de la carpeta actual");
                                return;
                            } else {
                                for (int i = 0; i < listado.length; i++) {
                        %>
                        <tr><td><img title="Presiona para seleccionar la imagen" src='<%="archivos/uploaded_files/" + lstad[i]%>' width="100" height="100" onclick="q2('<%=lstad[i]%>'), vistaIIIGagre5.close()" ><br>
                            </td>
                            <td><Label  ><%=listado[i]%></label>
                            </td></tr><%
                                    }

                                }
                            %>
                    </tbody>
                </table>
                <script>
                    function q2(p) {

                        document.getElementById('in_urlimagenmini').value =  p;

                    }</script>
                <br>
            </div>

        </form>
    </dialog>
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
