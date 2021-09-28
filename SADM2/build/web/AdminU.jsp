
<%@page import="com.sadm.dao.Config"%>
<%@page import="java.util.List"%>
<%@page import="com.sadm.dao.Usuario"%>
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
        <title>Administración de Usuarios</title>
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
                    <h1 id="dash_heading_h1" style="text-align: center;color: white;font-family: sans-serif;" title="Panel del Administrador">Administración de Usuarios</h1>
                    <div>
                        <form action="salir"   method="post" id="formsalir" >
                            <button type="button" class="btn btn-outline-success" data-toggle="modal" data-target=".bd-agregaruser-modal-lg" style="width: 5%;height: 5%;margin: 10px;"><img style="width: 100%;" src="archivos\uploaded_files\newUser.png" title="Agregar nuevo usuario"/></button>
                            <button type="button" class="btn btn-outline-warning" data-toggle="modal" onclick="location = '/SADM/DashBoard.jsp'" style="width: 5%;height: 5%;margin: 10px;"><img style="width: 100%;" src="archivos\uploaded_files\regresar.png" title="Regresar al DashBoard"/></button>
                            <button type="submit"  class="btn btn-outline-danger" data-toggle="modal" title="Cerrar Sesión"   style="width: 5%;height: 5%;margin: 10px;"><img style="width: 100%;" src="archivos\uploaded_files\salir.png" /></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="content-section" >
            <div style="text-align: center;width: 100%;">

            </div>
            <div class="fondoHeadHome row text-center"  align="center" >
                <div  align="center" style="alignment-adjust: central;" >
                    <video muted autoplay loop style="background-image:url(/SADM/archivos/uploaded_files/5c50c06a6968a9a3a5d1ba0c_presa_la_boca.jpeg)" >
                        <source src="archivos/uploaded_files/video_base.mp4" > 
                    </video>
                    <div class="form-group" style="text-align:center;background-color: white;" >
                        <div style="overflow: scroll;max-height: 500px;background-color: white;" >
                            <table class="table table-striped">
                                <%
                                    Consultas consultas = new Consultas();
                                    List<Usuario> listaUsuarios = consultas.obtAllUsuarios();
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
                                %>
                                <thead>
                                    <tr> 
                                <label style="margin-right: 40px;margin-bottom: 20px;margin-top: 10px;margin-left: 50px;float: left;color: #516179;font-weight: bold;font-size: 22px;font-family: 'Roboto', sans-serif;">  
                                   
                                    <input title="Teclea un criterio de búsqueda." id="myInput" style="border-top: none;border-left: none;border-right: none;border-bottom-color: #90AFCE;width: 600px;color:#A0A0A0;font-size: 22px;font-family: 'Roboto', sans-serif;"   type="search" placeholder="Búsqueda por usuario, nombre, activo y fecha de creación.">
                                </label>
                                </tr>
                                <tr>
                                    <th scope="col">Usuario</th>
                                    <th scope="col">Nombre</th>
                                    <th scope="col">Activo</th>
                                    <th scope="col">Fecha creación</th>
                                    <th scope="col">Acciones</th>
                                </tr>
                                </thead>
                                <tbody id="myTable">
                                    <%
                                        for (Usuario us : listaUsuarios) {
                                            p1 = new String();
                                            p2 = new String();
                                            p3 = new String();
                                            p4 = new String();
                                            p5 = new String();
                                            p6 = new String();
                                            p7 = new String();
                                            p8 = new String();
                                            p9 = new String();
                                            p10 = new String();
                                            p11 = new String();
                                            p12 = new String();
                                            p13 = new String();
                                            p1 = us.getUsuario();
                                            p2 = us.getPassword();
                                            p3 = us.getNombres();
                                            p4 = us.getApellido_p();
                                            p5 = us.getApellido_m();
                                            p6 = us.getRfc();
                                            p7 = us.getCurp();
                                            p8 = us.getIdrol();
                                            p9 = us.getActivo();
                                            p10 = us.getDesc_modif();
                                            p11 = us.getUser_modif();
                                            p12 = us.getF_modif();
                                            p13 = us.getIdusuario();
                                            String nombre_completo = new String();
                                            nombre_completo = p3 + " " + p4 + " " + p5;
                                    %>
                                    <tr>

                                        <td><%=p1%></td>
                                        <td><%=nombre_completo%></td>
                                        <td><%=p9%></td>
                                        <td><%=p12%></td>
                                        <td style="width: 10%;">

                                            <button type="button" onclick="editarUsu('<%=p13%>', '<%=p1%>', '<%=p2%>', '<%=p9%>', '<%=p3%>', '<%=p4%>', '<%=p5%>');" class="btn btn-outline-info" data-toggle="modal" data-target=".bd-editaruser-modal-lg" style="width: 30%;height: 30%;margin: 2px;"><img style="width: 100%;" src="archivos\uploaded_files\pencil.png" title="Editar"/></button>

                                            <button type="button" onclick="eliminarUsu('<%=p13%>');" class="btn btn-outline-danger" data-toggle="modal" data-target=".bd-eliminaruser-modal-lg" style="width: 30%;height: 30%;margin: 2px;"><img style="width: 100%;" src="archivos\uploaded_files\trash.png" title="Eliminar"/></button>
                                        </td>
                                    </tr>
                                    <%}%>
                                    <tr>
                                        <%
                                           
                                            Config confObj = consultas.obtenerConfig();
                                            consultas.getConexion().close();

                                        %>
                                <div style="text-align: center;position: fixed;bottom: 0;float: left;width: 100%;margin-bottom: 10px;"  ><label style="color: black;" ><%=confObj.getCopyRigth()%></label></div>
                                </tr>
                                </tbody>
                                <script>
                                    function eliminarUsu(p1) {
                                        document.getElementById("idUsElim").value = p1;
                                    }

                                    function editarUsu(p1, p2, p3, p4, p5, p6, p7) {
                                        document.getElementById("editar_idUsuario").value = p1;
                                        document.getElementById("editar_Usuario").value = p2;
                                        document.getElementById("editar_Password").value = p3;
                                        document.getElementById("editar_Activo").value = p4;
                                        document.getElementById("editar_Nombres").value = p5;
                                        document.getElementById("editar_A_Paterno").value = p6;
                                        document.getElementById("editar_A_Materno").value = p7;
                                    }


                                </script>
                            </table>
                        </div>
                    </div>
                    <!--ELIMINAR USUARIOS-->     
                    <div class="modal fade bd-eliminaruser-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="background-image:url(&quot;archivos/uploaded_files/fondo_agua_sadm_1_1.jpg&quot;);background-size: cover;">
                        <div class="modal-dialog modal-lg modal-dialog-centered">
                            <form action="eliminarusuario"  method="post" id="formEliminarUsuario"  >
                                <input   name="idUsElim" data-name="idUsElim" id="idUsElim" hidden/>
                                <div class="modal-content">

                                    <div class="modal-header">
                                        <h1 title="Eliminar el registro." > <span class="badge badge-secondary">Eliminar Usuario</span></h1><br>
                                    </div>
                                    <div class="modal-body">
                                        <div class="card" style="text-align:center;background-color: #F78181;">
                                            <div class="card-body">
                                                <div class="alert alert-warning" role="alert">
                                                    <h1 title="¿Estás seguro de eliminar el Usuario Seleccionado?" > ¿Estás seguro de eliminar el Usuario Seleccionado?</h1>
                                                </div>

                                            </div>   
                                        </div>
                                    </div>
                                    <div class="modal-footer">

                                        <button title="Confirmar eliminar." id="btnElimUs" onclick="submit()" type="button" class="btn btn-primary" style="margin: 20px;">Confirmar Eliminar</button>

                                        <button title="Regresar al tabulador."  type="button" class="btn btn-secondary" data-dismiss="modal" style="margin: 20px;">Cancelar</button>
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>

                    <!-- AGREGAR USUARIOS -->
                    <div class="modal fade bd-agregaruser-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="background-image:url(&quot;archivos/uploaded_files/fondo_agua_sadm_1_1.jpg&quot;);background-size: cover;">
                        <div class="modal-dialog modal-lg modal-dialog-centered">
                            <form action="agreusuario"  method="post" id="formAgregarUsuario" class="was-validated" >
                                <div class="modal-content">

                                    <table class="table table-striped" border="0" style="text-align: center;alignment-adjust: central;">
                                        <thead >
                                            <tr style="alignment-adjust: central;">
                                        <div style="background-color: white;">
                                            <div class="modal-header">
                                                <h1> <span class="badge badge-secondary">Agregar Usuario</span></h1><br>
                                            </div>
                                        </div>
                                        </tr>
                                        </thead>
                                        <tbody >
                                            <tr>
                                                <td><h2 title="El usuario es un identificador único de identidad confidencial, por este motivo no se permite la duplicidad del registro y es requerido para generar un nuevo registro. Ejemplo: TestUser01" ><strong>Usuario:</strong> <input minlength="2"  placeholder="Teclea un usuario" required id="detalle_Usuario" class="form-control"  name="detalle_Usuario" style="text-align: center;margin: 20px;alignment-adjust: auto;width: 90%" ></h2></td>
                                                <td> <h2 title="El password es la contraseña confidencial para validar su identidad, puedes utilizar un mínimo 4 números ,letras ó símbolos. Se recomienda cambiar su valor periodicamente y utilizar contraseñas seguras." ><strong>Password:</strong> <input minlength="4"  placeholder="Teclea un password"  required  type="password" id="detalle_Password" name="detalle_Password" class="form-control" style="text-align: center;margin: 20px;alignment-adjust: auto;width: 90%" ></h2></td>
                                                <td> 
                                                    <h2 title="El activo es el valor para dar un estatus al registro." ><strong>Activo:</strong><select   id="detalle_Activo" name="detalle_Activo" class="form-control" style="text-align: center;margin: 20px;alignment-adjust: auto;width: 90%" name="detalle_Activo" size="1">

                                                            <option value="t">Activo</option>
                                                            <option value="f">Inactivo</option>
                                                        </select></h2>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><h2 title="Nombre ó nombres del colaborador."><strong>Nombres:</strong> <input placeholder="Teclea el nombre" onblur="validaAgregarUsuario()" required id="detalle_Nombres" name="detalle_Nombres" class="form-control" style="text-align: center;margin: 20px;alignment-adjust: auto;width: 90%" ></h2></td>
                                                <td><h2 title="Apellido paterno del colaborador."><strong>Apellido Paterno:</strong> <input placeholder="Teclea el apellido materno"  required id="detalle_A_Paterno" name="detalle_A_Paterno" class="form-control" style="text-align: center;margin: 20px;alignment-adjust: auto;width: 90%" ></h2></td>
                                                <td><h2 title="Apellido materno del colaborador."><strong>Apellido Materno:</strong><input placeholder="Teclea el apellido paterno" onblur="validaAgregarUsuario()" required  id="detalle_A_Materno" name="detalle_A_Materno" class="form-control" style="text-align: center;margin: 20px;alignment-adjust: auto;width: 90%" ></h2></td>
                                            </tr>
                                            <tr  >
                                                <td  title="Guardar el registro." colspan="2" onclick="validaAgregarUsuario()"><button hidden id="btnAgreU" onclick="submit()" type="button" class="btn btn-primary">Guardar Cambios</button></td>

                                                <td title="Regresar al tabulador." > <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button></td>
                                            </tr>
                                        <script>
                                            function validaAgregarUsuario() {
                                                if (document.getElementById("detalle_Usuario").value === '') {
                                                    alert("Teclea el Usuario para continuar");
                                                    document.getElementById("btnAgreU").hidden = true;
                                                } else if (document.getElementById("detalle_Password").value === '') {
                                                    alert("Teclea el Password para continuar");
                                                    document.getElementById("btnAgreU").hidden = true;
                                                }
                                                else if (document.getElementById("detalle_Nombres").value === '') {
                                                    alert("Teclea el Nombre para continuar");
                                                    document.getElementById("btnAgreU").hidden = true;
                                                } else if (document.getElementById("detalle_A_Paterno").value === '') {
                                                    alert("Teclea el Apellido Paterno para continuar");
                                                    document.getElementById("btnAgreU").hidden = true;
                                                } else if (document.getElementById("detalle_A_Materno").value === '') {
                                                    alert("Teclea el Apellido Materno para continuar");
                                                    document.getElementById("btnAgreU").hidden = true;
                                                } else {
                                                    document.getElementById("btnAgreU").hidden = false;
                                                }
                                            }
                                        </script>

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

        <!-- EDITAR USUARIOS -->
        <div class="modal fade bd-editaruser-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="background-image:url(&quot;archivos/uploaded_files/fondo_agua_sadm_1_1.jpg&quot;);background-size: cover;">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <form action="editarusuario" method="post" id="formEditarUsuario" name="formEditarUsuario" class="was-validated">
                    <div class="modal-content">
                        <input id="txtusredit" name="txtusredit" value="<%=usuario%>" hidden>
                        <table  class="table table-striped" border="0" style="text-align: center;alignment-adjust: central;">
                            <thead style="text-align: center;">
                                <tr style="alignment-adjust: auto;">
                            <div style="text-align: center;">
                                <div class="modal-header">
                                    <h1> <span class="badge badge-secondary">Editar Usuario</span></h1><br>
                                </div>
                            </div>
                            </tr>
                            </thead>
                            <tbody >
                                <tr>
                                    <td colspan="3" hidden><h2><strong>Identificador único del Usuario:</strong> <input id="editar_idUsuario" name="editar_idUsuario" readonly style="text-align: center;margin: 20px;alignment-adjust: auto;width: 90% ;border: 0;background-color: #ffffcc;" ></h2></td>
                                </tr> 
                                <tr>
                                    <td><h2 title="El usuario es un identificador único de identidad confidencial, por este motivo no se permite la duplicidad del registro y es requerido para editar un registro. Ejemplo: TestUser01" ><strong>Usuario:</strong> <input placeholder="Teclea un usuario" onblur="validaEditarUsuario()" id="editar_Usuario" name="editar_Usuario" type="text" required class="form-control" style="text-align: center;margin: 20px;alignment-adjust: auto;width: 90%" ></h2></td>
                                    <td><h2 title="El password es la contraseña confidencial para validar su identidad, puedes utilizar un mínimo 4 números ,letras ó símbolos. Se recomienda cambiar su valor periodicamente y utilizar contraseñas seguras."><strong>Password:</strong> <input minlength="4"  placeholder="Teclea un password" onblur="validaEditarUsuario()" id="editar_Password" name="editar_Password" type="text" required class="form-control"  style="text-align: center;margin: 20px;alignment-adjust: auto;width: 90%" ></h2></td>
                                    <td><h2 title="El activo es el valor para dar un estatus al registro." ><strong>Activo:</strong><select id="editar_Activo" name="editar_Activo" required class="form-control"  style="text-align: center;margin: 20px;alignment-adjust: auto;width: 90%" name="detalle_Activo" size="1">

                                                <option value="t">Activo</option>
                                                <option value="f">Inactivo</option>
                                            </select></h2></td>
                                </tr>
                                <tr>
                                    <td><h2 title="Nombre ó nombres del colaborador." ><strong>Nombres:</strong> <input placeholder="Teclea el nombre" onblur="validaEditarUsuario()" id="editar_Nombres" name="editar_Nombres" type="text" required class="form-control"  style="text-align: center;margin: 20px;alignment-adjust: auto;width: 90%" ></h2></td>
                                    <td><h2 title="Apellido paterno del colaborador." ><strong>Apellido Paterno:</strong> <input placeholder="Teclea el apellido paterno" onblur="validaEditarUsuario()" id="editar_A_Paterno" name="editar_A_Paterno" type="text" required class="form-control"   style="text-align: center;margin: 20px;alignment-adjust: auto;width: 90%" ></h2></td>
                                    <td><h2 title="Apellido materno del colaborador."><strong>Apelido Materno:</strong> <input placeholder="Teclea el apellido materno" onblur="validaEditarUsuario()" id="editar_A_Materno" name="editar_A_Materno" type="text" required class="form-control"  style="text-align: center;margin: 20px;alignment-adjust: auto;width: 90%" ></h2></td>
                                </tr>
                                <tr>
                                    <td colspan="2"  onclick="validaEditarUsuario()"><button hidden id="btnEditU" onclick="submit()" type="button" class="btn btn-primary">Guardar Cambios</button></td>

                                    <td> <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button></td>
                                </tr>
                            <script>
                                function validaEditarUsuario() {
                                    if (document.getElementById("editar_Usuario").value === '') {
                                        alert("Teclea el Usuario para continuar");
                                        document.getElementById("btnEditU").hidden = true;
                                    } else if (document.getElementById("editar_Password").value === '') {
                                        alert("Teclea el Password para continuar");
                                        document.getElementById("btnEditU").hidden = true;
                                    }
                                    else if (document.getElementById("editar_Nombres").value === '') {
                                        alert("Teclea el Nombre para continuar");
                                        document.getElementById("btnEditU").hidden = true;
                                    } else if (document.getElementById("editar_A_Paterno").value === '') {
                                        alert("Teclea el Apellido Paterno para continuar");
                                        document.getElementById("btnEditU").hidden = true;
                                    } else if (document.getElementById("editar_A_Materno").value === '') {
                                        alert("Teclea el Apellido Materno para continuar");
                                        document.getElementById("btnEditU").hidden = true;
                                    } else {
                                        document.getElementById("btnEditU").hidden = false;
                                    }
                                }
                            </script>

                            </tbody>
                        </table>
                    </div> 
                </form>
            </div></div>                



    </body>
</html>
