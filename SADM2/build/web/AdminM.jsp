<%-- 
    Document   : AdminM
    Created on : Apr 8, 2020, 12:47:23 PM
    Author     : marco
--%>

<%@page import="com.sadm.dao.Config"%>
<%@page import="com.sadm.dao.Menu"%>
<%@page import="java.util.List"%>
<%@page import="com.sadm.controlador.Consultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession objSession = request.getSession(false);
    String usuario = (String) objSession.getAttribute("usuario");
    if (null == usuario) {
        response.sendRedirect("Restringido.jsp");
    } else if (usuario.equals("")) {
        response.sendRedirect("Admin099.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <title>Administración de menús</title>
        <meta content="Servicios de agua y drenaje, agua, drenaje, saneamiento, calidad del agua, cuidado del agua, contratos, clic en línea, nuevo leon, transparencia" name="description" />
        <meta content="Servicios de Agua y Drenaje de Monterrey I.P.D." property="og:title" />
        <meta content="Servicios de agua y drenaje, agua, drenaje, saneamiento, calidad del agua, cuidado del agua, contratos, clic en línea, nuevo leon, transparencia" property="og:description" />

        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <!--[if lt IE 9]><script src="archivos/js/html5shiv.min.js" type="text/javascript"></script><![endif]-->
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
            .fondoHeadHome { height: 400px;}
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
                    $("#myTable tr").filter(function () {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                });
                $("#myInput2").on("keyup", function () {
                    var value = $(this).val().toLowerCase();
                    $("#myTable2 tr").filter(function () {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                });
            });
        </script>

    </head>
    <body>

        <div style="min-height:150px;padding-top:40px;background-image:url(/SADM/archivos/uploaded_files/5c50c22234f7c43f1513d8cc_presa_el_cuchillo-p-1080.jpeg);background-position:50% 50%;background-size:cover">
            <div style="text-align: center;">
                <div style="text-align: center;" >
                    <h1 id="dash_heading_h1" style="text-align: center;color: white;font-family: sans-serif;" title="Panel del Administrador">Administración de Menús</h1>
                    <div>
                        <form action="salir"   method="post" id="formsalir" >
                            <button type="button" class="btn btn-outline-success" data-toggle="modal" data-target=".bd-agregarmenu-modal-lg" style="width: 5%;height: 5%;margin: 10px;"><img style="width: 100%;" src="archivos\uploaded_files\agregar_icon.png" title="Agregar nuevo menú"/></button>
                            <button type="button" class="btn btn-outline-warning" data-toggle="modal" onclick="location = '/SADM/DashBoard.jsp'" style="width: 5%;height: 5%;margin: 10px;"><img style="width: 100%;" src="archivos\uploaded_files\regresar.png" title="Regresar al DashBoard"/></button>
                            <button type="submit"  class="btn btn-outline-danger" data-toggle="modal" title="Cerrar Sesión"   style="width: 5%;height: 5%;margin: 10px;"><img style="width: 100%;" src="archivos\uploaded_files\salir.png" /></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="content-section" >
            <div class="fondoHeadHome row text-center"  align="center" >
                <div  align="center" style="alignment-adjust: central;" >
                    <video muted autoplay loop style="background-image:url(/SADM/archivos/uploaded_files/5c50c06a6968a9a3a5d1ba0c_presa_la_boca.jpeg)" >
                        <source src="archivos/uploaded_files/video_base.mp4" > 
                    </video>
                    <div class="form-group" style="text-align:center;background-color: white;width: 100%;" >
                        <div style="overflow: scroll;max-height: 500px;background-color: white;width: 99%;" >
                            <table class="table table-striped"> 
                                <%
                                    Consultas consultas = new Consultas();
                                    List<Menu> listaMenu = consultas.obtAllMenu();
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
                                <thead  >
                                    <tr> 
                                <label style="margin-right: 40px;margin-bottom: 20px;margin-top: 10px;margin-left: 50px;float: left;color: #516179;font-weight: bold;font-size: 22px;font-family: 'Roboto', sans-serif;">  
                                  
                                    <input title="Teclea un criterio de búsqueda." id="myInput" style="border-top: none;border-left: none;border-right: none;border-bottom-color: #90AFCE;width: 350px;color:#A0A0A0;font-size: 22px;font-family: 'Roboto', sans-serif;"   type="search" placeholder="Búsqueda por id, nombre ó tipo.">
                                </label>
                                </tr>
                                <tr style="alignment-adjust: auto;background-color: whitesmoke;">
                                    <th scope="col">Id</th>
                                    <th scope="col">Nombre</th>
                                    <th scope="col">Tipo</th>
                                    <th scope="col">Acciones</th>
                                </tr>
                                </thead>
                                <tbody id="myTable">
                                    <%
                                        for (Menu menu : listaMenu) {

                                            p1 = menu.getId();
                                            p2 = menu.getNombre();
                                            p3 = menu.getValor();
                                            p4 = menu.getTipo();
                                            p5 = menu.getMenu_padre();
                                            p6 = menu.getHref();
                                            p7 = menu.getTarget();
                                            p8 = menu.getActivo();
                                            p9 = menu.getVal1();
                                            p10 = menu.getVal2();
                                            p11 = menu.getVal3();
                                            p12 = menu.getDesc_modif();
                                            p13 = menu.getUser_modif();
                                            p14 = menu.getF_modif();


                                    %>
                                    <tr>
                                        <td style="width: 10%;"><%=p1%></td>
                                        <td style="width: 30%;"><%=p2%></td>
                                        <td style="width: 40%;"><%=p4%></td>
                                        <td style="width: 10%;">
                                            <button type="button" onclick="editarMenu('<%=p1%>', '<%=p2%>', '<%=p3%>', '<%=p4%>', '<%=p5%>', '<%=p6%>', '<%=p7%>', '<%=p8%>', '<%=p9%>', '<%=10%>', '<%=p11%>', '<%=p12%>', '<%=p13%>', '<%=p14%>')"  class="btn btn-outline-info" data-toggle="modal" data-target=".bd-editarmenu-modal-lg" style="width: 30%;height: 30%;margin: 2px;"><img style="width: 100%;" src="archivos\uploaded_files\pencil.png" title="Editar"/></button>

                                            <button type="button" onclick="eliminarMenu('<%=p1%>')" class="btn btn-outline-danger" data-toggle="modal" data-target=".bd-eliminarmenu-modal-lg" style="width: 30%;height: 30%;margin: 2px;"><img style="width: 100%;" src="archivos\uploaded_files\trash.png" title="Eliminar"/></button>
                                        </td>
                                    </tr>
                                    <%         p1 = "";
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
                                <script>
                                    function eliminarMenu(p1) {
                                        document.getElementById("idMenuElim").value = p1;

                                    }

                                    function editarMenu(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14) {
                                        document.getElementById("detalle_uid_Menu").value = p1;
                                        document.getElementById("detalle_menu_nombre").value = p2;
                                        document.getElementById("detalle_menu_valor").value = p3;
                                        document.getElementById("detalle_menu_tipo").value = p4;
                                        document.getElementById("detalle_menu_padre").value = p5;
                                        document.getElementById("detalle_menu_href").value = p6;
                                        document.getElementById("detalle_menu_target").value = p7;
                                        document.getElementById("detalle_menu_activo").value = p8;
                                        document.getElementById("detalle_menu_val1").value = p9;
                                        document.getElementById("detalle_menu_desc_edit").value = p12;

                                    }
                                </script>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!--ELIMINAR MENU-->     
                    <div class="modal fade bd-eliminarmenu-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="background-image:url(&quot;archivos/uploaded_files/fondo_agua_sadm_1_1.jpg&quot;);background-size: cover;">
                        <div class="modal-dialog modal-lg modal-dialog-centered">
                            <form action="eliminarmenu"  method="post" id="formEliminarMenu"  >
                                <input   name="idMenuElim" data-name="idMenuElim" id="idMenuElim" hidden/>
                                <div class="modal-content">

                                    <div class="modal-header">
                                        <h1> <span class="badge badge-secondary">Eliminar Menú</span></h1><br>
                                    </div>
                                    <div class="modal-body">
                                        <div class="card" style="text-align:center;">
                                            <div class="card-body">
                                                <div role="alert">
                                                    <h1 title="¿Estás seguro de eliminar el Menú Seleccionado?"> ¿Estás seguro de eliminar el Menú Seleccionado?</h1>
                                                </div>

                                            </div>   
                                        </div>
                                    </div>
                                    <div class="modal-footer">

                                        <button  title="Confirmar eliminar."  id="btnElimUs" onclick="submit()" type="button" class="btn btn-primary" style="margin: 20px;">Confirmar Eliminar</button>

                                        <button title="Regresar al tabulador." type="button" class="btn btn-secondary" data-dismiss="modal" style="margin: 20px;">Cancelar</button>
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>

                    <!-- AGREGAR MENU -->
                    <div class="modal fade bd-agregarmenu-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="background-image:url(&quot;archivos/uploaded_files/fondo_agua_sadm_1_1.jpg&quot;);background-size: cover;">
                        <div class="modal-dialog modal-lg modal-dialog-centered">
                            <form action="agregarmenu"  method="post" id="formAgregarMenu" class="was-validated" >
                                <div class="modal-content">
                                    <table class="table table-striped" border="0" style="text-align: center;alignment-adjust: central;">
                                        <thead >
                                            <tr style="alignment-adjust: auto;">

                                        <div style="background-color: white;">
                                            <div class="modal-header">
                                                <h1> <span class="badge badge-secondary">Agregar Menú</span></h1><br>
                                            </div>
                                        </div>

                                        </tr>
                                        </thead>
                                        <tbody >
                                            <tr>
                                                <td><h3 title="El identificador relaciona la esencia a la entidad del menú a crear, por este motivo es requerida y no se permite la duplicidad del registro. Debe ser mayor a 2 y menor a 10 caractéres alfanuméricos." ><strong>ID:</strong></h3><input  placeholder="Teclea un identificador." minlength="2" maxlength="10" required class="form-control" id="agregar_uid_Menu" name="agregar_uid_Menu"  style="text-align: center;margin: 5px;alignment-adjust: auto;width: 80%;" ></td>
                                                <td><h3 title="El nombre es la definición del registro y se mostrará ante los contenidos. Representa el nombre que se llevará e menú presentado en el listado. Debe ser mayor a 2 caractéres alfanuméricos y es requerido." ><strong>Nombre:</strong></h3><input minlength="2" required class="form-control" placeholder="Teclea un nombre." id="agregar_menu_nombre" name="agregar_menu_nombre"  style="text-align: center;margin: 5px;alignment-adjust: auto;width: 90%;" ></td>
                                                <td><h3 title="El tipo es el indicador jerárquico del registro. Con este indicador se permite definir y relacionar los elementos y los listados de elementos menú."><strong>Tipo:</strong></h3>
                                                    <select required class="form-control" id="agregar_menu_tipo" name="agregar_menu_tipo" style="width: 100%;">
                                                        <option value="menu">Menú</option>
                                                        <option value="submenu">Submenú</option>
                                                        <option value="menu_f">Menú del Footer</option>
                                                        <option value="menu_fs">Menú de Redes Sociales Footer</option>
                                                    </select></td>
                                            </tr>
                                            <tr>
                                                <td><h3 title="El valor es la característica especifica funcional de un menú, Puede ser un encabezado y contenga submenus ó puede ser una referencia a una url específica redireccionanda en el contenido y footer del diseño homologado en Portal SADM de acceso Público."><strong>Valor:</strong></h3> <select required class="form-control" id="agregar_menu_valor" name="agregar_menu_valor" size="1">
                                                        <option value="lst">Encabezado en lista de submenús</option>
                                                        <option value="ref">Referencia a Endpoint</option>
                                                        <option value="ref_f">Referencia a Endpoint del Footer</option>
                                                        <option value="ref_fs">Referencia a Redes Sociales del Footer</option>
                                                    </select></td>
                                                    <td  >
                                                        <h3 title="El ID Patern es el valor de identificador del encabezado de menu del listado de submenus que pertenece un submenú. Este sólo tiene sentido definirse en caso de ser un submenú de un listado de menús y se tenga relación con su menú superior inmediato. Se debe escribir el identificador del menú al que pertenece identico al id en su registro el cuál deberá estar en activo para generar una relación. Debe ser mayor a 2 y menor a 10 caractéres alfanuméricos.">
                                                            <strong>ID Patern:</strong>
                                                        </h3>
                                                        <!--<input  minlength="2"  placeholder="Teclea un id." class="form-control" id="agregar_menu_padre" name="agregar_menu_padre"  style="text-align: center;margin: 5px;alignment-adjust: auto;width: 100%" >-->
                                                        <select class="form-control" id="agregar_menu_padre" name="agregar_menu_padre" style="width: 100%">
                                                            <option value=" ">Sin Patern</option>
                                                            <%
                                                        
                                                        List<Menu> listMenu = consultas.obtAllMenu();
                                                        
                                                         for (Menu m : listMenu) {
                                                        %>
                                                        
                                                        <option value="<%=m.getId()%>"><%=m.getId()%></option>
                                                    
                                                    <%}%>
                                                     </select>
                                                    
                                                    
                                                    </td>
                                                    
                                                    
                                                    
                                                    <td><h3 title="Ventana es el indicador relevante en el caso de redireccionar en la misma ventana o en una nueva la url referenciada en su parametrización del menú a crear. "><strong>Ventana:</strong></h3>
                                                        <select class="form-control" id="agregar_menu_target" name="agregar_menu_target" style="width: 100%">
                                                        <option value="na" >Abrir refrencia en la misma Ventana</option>
                                                        <option value="_blank">Abrir refrencia en una Nueva Ventana</option>
                                                    </select></td>  
                                            </tr>
                                            <tr> 
                                                <td ><h3 title="URL de Referencia es implícita a la dirección url del destino a redireccionar al ejecutar el nombre del registro del menú. Es relevante definirla si se trata de un menu de referencia y redireccionamiento, ya que es la ruta física de un archivo ó dirección url donde se redireccionará en el contenido público."><strong>URL de Referencia: </strong></h3><input placeholder="Teclea una dirección url física." class="form-control" id="agregar_menu_href" name="agregar_menu_href"  style="text-align: center;margin: 5px;alignment-adjust: auto;width: 100%" ></td>
                                            



                                                <td > <h3 title="Activo es el valor del estatus para el menú, este puede ser activo o inactivo y manipularse a demanda mediante el control que ativa e inactiva el estatus del menú." ><strong>Activo:</strong> </h3><select class="form-control" id="agregar_menu_activo" name="agregar_menu_activo" style="width: 100%">

                                                        <option value="t">Activo</option>
                                                        <option value="f">Inactivo</option>
                                                    </select></td>

                                                    <td   ><h3 title="El Orden Num es el valor numérico para ordenamiento de submenús. Es un idicador referencial a su lugar en lista respectiva de submenús. Es relevante sólo en caso de dar un orden a los submenus de un menú de Encabezado que los agrupa. Su máximo valor es 100 y el mínimo es 1."><strong>Orden Num: </strong></h3><input  placeholder="Teclea un número." class="form-control" type="number" min="1" max="100" id="agregar_menu_val1" name="agregar_menu_val1"  style="text-align: center;margin: 5px;alignment-adjust: auto;width:100%" >

                                                </td>
                                                
                                            </tr>
                                            <tr>
                                                <td title="Guardar Menú." colspan="2" onclick="vagreMenu()" style="text-align: center;"  >
                                                    <script>
                                                        function vagreMenu(){
                                                            if(document.getElementById("agregar_uid_Menu").value ===''){
                                                            document.getElementById("btnAgreM").hidden=true;    
                                                            alert("El ID es requerido para continuar.");
                                                            }else if(document.getElementById("agregar_menu_nombre").value ===''){
                                                                document.getElementById("btnAgreM").hidden=true;    
                                                            alert("El Nombre es requerido para continuar.");
                                                            }else{
                                                                 document.getElementById("btnAgreM").hidden=false;   
                                                            }
                                                        }
                                                    </script>
                                                    <button hidden id="btnAgreM" onclick="submit()" type="button" class="btn btn-primary">Guardar Cambios</button>
                                                </td><td style="text-align: center;"  >
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button></td>
                                            </tr>

                                        </tbody>
                                    </table>
                                    <h2 hidden>idRol : <input hidden id="detalle_idRol" name="detalle_idRol" value="admin" style="text-align: center;margin: 20px;alignment-adjust: auto;width: 90%" ></h2>
                                    <h2 hidden>Usuario Creador  : <input hidden id="detalle_User_Modif" name="detalle_User_Modif" readonly style="text-align: ce nter;margin: 20px;alignment-adjust: auto;width: 90%;border: 0;background-color: #ffffcc;" value="<%=usuario%>" ></h2>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!-- EDITAR MENU -->
        <div class="modal fade bd-editarmenu-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="background-image:url(&quot;archivos/uploaded_files/fondo_agua_sadm_1_1.jpg&quot;);background-size: cover;">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <form action="editarmenu" method="post" id="formEditarMenu" name="formEditarMenu" class="was-validated">
                    <div class="modal-content">
                        <input id="txtusredit" name="txtusredit" value="<%=usuario%>" hidden>
                        <table  class="table table-striped" border="0" style="text-align: center;alignment-adjust: central;">
                            <thead style="text-align: center;">
                                  <tr style="alignment-adjust: auto;">

                                        <div style="background-color: white;">
                                            <div class="modal-header">
                                                <h1> <span class="badge badge-secondary">Editar Menú</span></h1>
                                                <h1 style="margin-left: 150px;" title="El ID es sólo informativo en la edición de menú."><strong>ID:</strong><input readonly id="detalle_uid_Menu" name="detalle_uid_Menu"  style="width: 60%;text-align: center;alignment-adjust: auto;border: 0;background-color: #ffffcc;" ></h1>
                                    
                                            </div>
                                           
                                        </div>
                                        
                                        </tr>
                            </tr>
                            </thead>
                            <tbody >
                                <tr>
                                    <td><h3  title="El nombre es la definición del registro y se mostrará ante los contenidos. Representa el nombre que llevará el menú referente a su id respectivo en el listado de menús. Debe ser mayor a 2 caractéres alfanuméricos y es requerido."><strong>Nombre: </strong></h3><input onblur="valNomEditmenu()" required minlength="2" placeholder="Teclea un Nombre." class="form-control"  id="detalle_menu_nombre" name="detalle_menu_nombre"  style="text-align: center;margin: 5px;alignment-adjust: auto;width: 100%" ></td>
                            <script>
                                function valNomEditmenu(){
                                    
                                    if(document.getElementById("detalle_menu_nombre").value===''){
                                        alert("El Nombre es requerido para continuar.");
                                        document.getElementById("btnEditM").hidden=true;
                                    }else{
                                       document.getElementById("btnEditM").hidden=false; 
                                    }
                                }
                            </script>
                                    <td> <h3 title="El valor es la característica especifica funcional de un menú, Puede ser un encabezado y contenga submenus ó puede ser una referencia a una url específica redireccionanda en el contenido y footer del diseño homologado en Portal SADM de acceso Público."><strong>Valor:</strong></h3> <select class="form-control" id="detalle_menu_valor" name="detalle_menu_valor" style="width: 100%">
                                         
                                            <option value="lst">Lista de Submenús</option>
                                            <option value="ref">Referencia a Endpoint</option>
                                            <option value="ref_f">Referencia a Endpoint del Footer</option>
                                            <option value="ref_fs">Referencia a Redes Sociales del Footer</option>
                                        </select></td>
                                        <td><h3 title="El ID Patern es el valor de identificador del encabezado de menu del listado de submenus que pertenece un submenú. Este sólo tiene sentido definirse en caso de ser un submenú de un listado de menús y se tenga relación con su menú superior inmediato. Se debe escribir el identificador del menú al que pertenece identico al id en su registro el cuál deberá estar en activo para generar una relación. Debe ser mayor a 2 y menor a 10 caractéres alfanuméricos."><strong>ID Patern: </strong></h3>
                                            
                                           <!-- <input class="form-control" placeholder="Teclea ID Patern." id="detalle_menu_padre" name="detalle_menu_padre"  style="text-align: center;margin: 5px;alignment-adjust: auto;width: 100%" ></td>-->
                                    <select class="form-control" id="detalle_menu_padre" name="detalle_menu_padre" style="width: 100%">
                                        <option value=" ">Sin Patern</option>               
                                        <%
                                                        
                                                        List<Menu> lMenu = consultas.obtAllMenu();
                                                        
                                                         for (Menu m : lMenu) {
                                                        %>
                                                        
                                                        <option value="<%=m.getId()%>"><%=m.getId()%></option>
                                                    
                                                    <%}%>
                                                     </select>
                                                    
                                </tr>
                                <tr>

                                    <td><h3 title="El tipo es el indicador jerárquico del registro. Con este indicador se permite definir y relacionar los elementos y los listados de elementos menú."><strong>Tipo:</strong></h3> <select class="form-control" id="detalle_menu_tipo" name="detalle_menu_tipo" style="width: 100%">
                                          
                                            <option value="menu">Menú</option>
                                            <option value="submenu">Submenú</option>
                                            <option value="menu_f">Menú del Footer</option>
                                            <option value="menu_fs">Menú de Redes Sociales Footer</option>
                                        </select></td>
                                        <td><h3 title="URL de Referencia es implícita a la dirección url del destino a redireccionar al ejecutar el nombre del registro del menú. Es relevante definirla si se trata de un menu de referencia y redireccionamiento, ya que es la ruta física de un archivo ó dirección url donde se redireccionará en el contenido público."><strong>URL Referencia: </strong></h3><input placeholder="Teclea una url." class="form-control" id="detalle_menu_href" name="detalle_menu_href"  style="text-align: center;margin: 5px;alignment-adjust: auto;width: 100%" ></td>
                                        <td><h3 title="Ventana es el indicador relevante en el caso de redireccionar en la misma ventana o en una nueva la url referenciada en su parametrización del menú a editar."><strong>Ventana:</strong></h3> <select class="form-control" id="detalle_menu_target" name="detalle_menu_target" style="width: 100%">
                                            <option value="na" >Abrir referencia en la misma Ventana</option>
                                            <option value="_blank">Abrir referencia en una Nueva Ventana</option>
                                        </select></td>
                                </tr>
                                <tr>
                                    <td colspan="2"> <h3 title="Activo es el valor del estatus para el menú, este puede ser activo o inactivo y manipularse a demanda mediante el control que ativa e inactiva el estatus del menú."><strong>Activo:</strong></h3> <select class="form-control" id="detalle_menu_activo" name="detalle_menu_activo" style="width: 100%" class="form-control">
                                           
                                            <option value="t">Activo</option>
                                            <option value="f">Inactivo</option>
                                        </select></td>
                                        <td><h3 title="El Orden Num es el valor numérico para ordenamiento de submenús. Es un idicador referencial a su lugar en lista respectiva de submenús. Es relevante sólo en caso de dar un orden a los submenus de un menú de Encabezado que los agrupa. Su máximo valor es 100 y el mínimo es 1."><strong>Orden Num: </strong></h3><input placeholder="Teclea un número." class="form-control" min="1" max="100" type="number" id="detalle_menu_val1" name="detalle_menu_val1"  style="text-align: center;margin: 5px;alignment-adjust: auto;width: 100%" ></td>
                                </tr>
                                <tr hidden>
                                    <td colspan="2"><h3><strong>Usuario Creador del Menú  : </strong></h3><input id="usuario" name="usuario" readonly style="text-align: center;margin: 5px;alignment-adjust: auto;width: 50%;border: 0;background-color: #ffffcc;" value="<%=usuario%>" ></td>
                                </tr>
                                <tr>
                                    <td colspan="2" ><button title="Guardar Cambios." id="btnEditM" onclick="submit()" type="button" class="btn btn-primary">Guardar Cambios</button></td>

                                    <td> <button title="Regresar al tabulador." type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button></td>
                                </tr>

                            </tbody>
                        </table>
                    </div> 
                </form>
            </div></div> 
    </div>
</div>
</div>
<!-- -->



<%
    
    Config confObj = consultas.obtenerConfig();
    consultas.getConexion().close();

%>
<div style="text-align: center;position: fixed;bottom: 0;float: left;width: 100%;margin-bottom: 10px;"  ><label style="color: black;" ><%=confObj.getCopyRigth()%></label></div>


</body>
</html>
