
<%@page import="com.sadm.dao.Config"%>
<%@page import="com.sadm.dao.Menu"%>
<%@page import="java.util.List"%>
<%@page import="com.sadm.controlador.Consultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html><!-- Last Published: Mon Oct 07 2019 16:26:56 GMT+0000 (UTC) -->

<html lang="es">
    <head>
        <meta charset="utf-8"/>
        <title id="log_tit_meta" >Login</title>
        <meta content="Servicios de agua y drenaje, agua, drenaje, saneamiento, calidad del agua, cuidado del agua, contratos, clic en línea, nuevo leon, transparencia" name="description" />
    <meta content="Servicios de Agua y Drenaje de Monterrey I.P.D." property="og:title" />
    <meta content="Servicios de agua y drenaje, agua, drenaje, saneamiento, calidad del agua, cuidado del agua, contratos, clic en línea, nuevo leon, transparencia" property="og:description" />
       <meta content="summary" name="twitter:card" />
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <link href="archivos/css/sadm2021.a2257165c.min.css" rel="stylesheet" type="text/css" />
        <script src="js/webfont.js" type="text/javascript"></script>
        <script type="text/javascript">
                    WebFont.load({
                    google: {
                    families: ["Montserrat:100,100italic,200,200italic,300,300italic,400,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic", "Roboto:100,100italic,300,300italic,regular,500italic,700,700italic,900,900italic"]
                    }
                    });</script>
        <!--[if lt IE 9]><script src="archivos/js/html5shiv.min.js" type="text/javascript"></script><![endif]-->
        <script type="text/javascript">
                    !function (o, c) {
                    var n = c.documentElement,
                            t = " w-mod-";
                            n.className += t + "js", ("ontouchstart" in o || o.DocumentTouch && c instanceof DocumentTouch) && (n.className += t + "touch")
                    }(window, document);</script>
        <link href="archivos/uploaded_files/5b1ddbe400c01d95eb9dd383_IconoSADM.png" rel="shortcut icon" type="image/x-icon" />
        <link href="archivos/uploaded_files/5b6afb8e41c61684eb69bcee_logo_sadm_color.png" rel="apple-touch-icon" />
        <link rel="stylesheet" href="archivos/css/jquery-ui.css">

        <script>
                    UPLOADCARE_LOCALE = "es";
                    UPLOADCARE_TABS = "file url facebook gdrive dropbox instagram flickr skydrive";
                    UPLOADCARE_PUBLIC_KEY = "25c8982f9a85d38dd413";</script>
        <script charset="utf-8" src="//ucarecdn.com/libs/widget/3.3.0/uploadcare.full.min.js"></script>
        <script type="text/javascript">
                    var ubicacionPrincipal = window.pageYOffset;
                    window.onscroll = function (){
                    var Desplazamiento = window.pageYOffset;
                            if (ubicacionPrincipal >= Desplazamiento){
                    document.getElementById('nbar').style.top = '0';
                            document.getElementById('nbar').hidden = false;
                    } else{
                    document.getElementById('nbar').style.top = '-100px';
                            document.getElementById('nbar').hidden = true;
                    }
                    ubicacionPrincipal = Desplazamiento;
                    }
        </script>
        <style>
            body{
                margin: 0;display: flex;
            }
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
</head>
   <body data-ix="show-up-on-load" class="body" >
       <video muted autoplay loop style="background-image:url(/SADM/archivos/uploaded_files/5c50c06a6968a9a3a5d1ba0c_presa_la_boca.jpeg)" >
              <source src="archivos/uploaded_files/video_base.mp4" > 
          
        </video>
      
        <div style="width: 15%;display:flex;min-height:100px;padding-top:80px;background-image:url(/SADM/archivos/uploaded_files/5c50c06a6968a9a3a5d1ba0c_presa_la_boca.jpeg);background-position:50% 50%;background-size:cover;text-align: center;" >
            <div class="content-wrapper flex-center w-container">
                <div class="header-box">
                    <h1 id="log_heading_h1" data-ix="hero-move-up-on-load" class="heading-1 hero">Portal SADM.</h1>
                </div>
            </div>
        </div>
        <div class="content-section bottom-padding" >
            <div class="content-wrapper w-container">
                <div data-ix="move-up-on-load" class="bottom-separation half-padding">
                   
                
                
                    <form action="login"   method="post" id="formlogin" >
                      
                        <table class="table" style="alignment-adjust: central;">
                            <thead>
                                <tr >
                            <div style="margin-left:80px;margin-top: 50px;">
                                <div data-ix="move-up-on-load" class="header-box center-no-border">
                                    <h1 id="log_h_box_h2" style="color: black;FONT-SIZE: 25pt;" ><strong>Login del Portal SADM</strong></h1> <br>
                    </div>
                            </div>
                            </tr>
                            </thead>
                            <tbody >
                                <tr>
                                    <td style="width: 50px" >
                                        
                                    </td>
                                    <td style="margin: 30px;alignment-adjust: auto;width: 40%;text-align: center;">
                                        <img src="archivos/uploaded_files/log_sadm.png"  width='100%' height='100%' style="display: block;margin: 0 auto;max-width: 100%;"  >
                                    </td>
                                    <td style="width: 100px" >
                                        
                                    </td>
                                    <td style="margin: 10px;alignment-adjust: auto;width: 400px;text-align: left;">
                                        <label id="log_lbl_usu" for="Usuario" style="color: black;">Usuario: 
                                            <input style="width: 300px;" required="required" type="text" class="w-input" autofocus="true" maxlength="256" name="Usuario" data-name="Usuario" placeholder="Ingrese usuario registrado" id="txtUsuario"/></label>
                                        <label id="log_lbl_pss" for="password" style="color: black;" >Password: 
                                            <input type="password" required="required" style="width: 300px;alignment-adjust: central;"  class="w-input" maxlength="256" name="password" data-name="Password" placeholder="Ingrese su password" id="txtPassword"/></label>
                         
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100px" >
                                    <td colspan="5" style="text-align: center;">
                                        <br>
                                        <input id="btniniciar" style="margin: 20px;border-radius: 15px;width: 50%;height: 100px;FONT-SIZE: 30pt;"   type="submit" value="Iniciar Sesión" placeholder="Acciona el botón de Inicio de Sesión para contuinar" data-wait="Espere ..." class="w-button" />
                                        <br>
                                    </td>
                                    
                                </tr>

                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
           
        </div>
         <%
        Consultas conconf = new Consultas();
        Config confObj = conconf.obtenerConfig();
        conconf.getConexion().close();
    %>
       <div style="text-align: center;position: fixed;bottom: 0;float: left;width: 100%;margin-bottom: 10px;"  ><label style="color: black;" ><%=confObj.getCopyRigth()%></label></div>

        <!-- -->                        
                
        <!-- -->
       
    <!-- -->            
    <script src="archivos/js/jquery-3.4.1.min.220afd743d.js" type="text/javascript"></script>
    <script src="archivos/js/sadm2021.51f485010.js" type="text/javascript"></script>
    <!--[if lte IE 9]><script src="//cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif]-->
    

    <script src="https://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
    
    
</body>
</html>
