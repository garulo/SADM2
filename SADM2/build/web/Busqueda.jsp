<%@page import="com.sadm.dao.Config"%>
<%@page import="com.sadm.dao.Busqueda"%>
<%@page import="com.sadm.dao.Pagina"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.sadm.controlador.Consultas"%>
<%@page import="java.util.LinkedList"%>
<%@page import="com.sadm.dao.Menu"%>
<%@page import="com.sadm.dao.Index"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%

        //System.out.println("search INICIO:..::: " + request.getParameter("search"));
        Consultas consultas = new Consultas();
        List<Busqueda> lstBus = new ArrayList<Busqueda>();
        //lstBus = consultas.BusquedaGeneral(request.getParameter("search"));

        

    %>
    <head>
        <meta charset="utf-8"/>
        <title>Resultados</title>
        <meta content="Servicios de agua y drenaje, agua, drenaje, saneamiento, calidad del agua, cuidado del agua, contratos, clic en línea, nuevo leon, transparencia" name="description" />
        <meta content="Servicios de Agua y Drenaje de Monterrey I.P.D." property="og:title" />
        <meta content="Servicios de agua y drenaje, agua, drenaje, saneamiento, calidad del agua, cuidado del agua, contratos, clic en línea, nuevo leon, transparencia" property="og:description" />
        <meta content="summary" name="twitter:card" />
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <link href="archivos/css/sadm2021.a2257165c.min.css" rel="stylesheet" type="text/css" />
        <script src="archivos/js/webfont.js" type="text/javascript"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js" type="text/javascript"></script>
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
        <!--<script type="text/javascript">
                    let ubicacionPrincipal = window.pageYOffset;
                    window.onscroll = function (){
                    let Desplazamiento = window.pageYOffset;
                            if (ubicacionPrincipal >= Desplazamiento){
                    document.getElementById('nbar').style.top = '0';
                            document.getElementById('nbar').hidden = false;
                    } else{
                    document.getElementById('nbar').style.top = '-100px';
                            document.getElementById('nbar').hidden = true;
                    }
                    ubicacionPrincipal = Desplazamiento;
                    }
        </script>-->
    </head>
    <body data-ix="show-up-on-load" class="body">
        <header> <div data-ix="move-down-on-load" class="top-bar" >
                <nav id="nbar" >
                    <div data-collapse="medium" data-animation="default" data-duration="400" id="Top" class="navbar-1-into w-nav">
                        <!--<div class="div-block-8">
                            <div>Para un mejor funcionamiento del Portal se recomienda Utilizar <a href="https://www.mozilla.org/es-MX/firefox/new/" target="_blank" class="link-6">Navegador Firefox</a></div>
                        </div>-->

                        <div >

                            <a href="index.jsp" data-ix="fade-out-on-click" class="brand w-nav-brand w--current" style="margin-left: 90px;">
                                <img src="archivos/uploaded_files/5b6b5f504c3819038b156e33_logo_sadm.png" srcset="archivos/uploaded_files/5b6b5f504c3819038b156e33_logo_sadm-p-500.png 500w, archivos/uploaded_files/5b6b5f504c3819038b156e33_logo_sadm-p-800.png 800w, archivos/uploaded_files/5b6b5f504c3819038b156e33_logo_sadm-p-1080.png 1080w, archivos/uploaded_files/5b6b5f504c3819038b156e33_logo_sadm.png 1217w" sizes="220px" alt="" class="image-11"></a>
                            <nav role="navigation" class="w-nav-menu" style="margin-right:  90px;">
                                <%                                  
                                    List<Menu> lstaMenu = consultas.obtMenuPrinc();
                                    String id = new String();
                                    String nombre = new String();
                                    String tipo = new String();
                                    String paternMenu = new String();

                                    String href = new String();
                                    String target = new String();
                                    String valor = new String();
                                    String s1 = new String();
                                    String s2 = new String();
                                    String s3 = new String();
                                    String s4 = new String();
                                    String s5 = new String();
                                    String s6 = new String();

                                    for (Menu men : lstaMenu) {
                                        id = men.getId();
                                        nombre = men.getNombre();
                                        tipo = men.getTipo();
                                        href = men.getHref();
                                        valor = men.getValor();
                                        target = men.getTarget();
                                        String quote = "\"";
                                        String blank = "_blank";
                                        String va = "lst";
                                        if (target.equals(blank)) {
                                            s1 = "target=" + quote + target + quote;
                                        } else {
                                            s1 = "";
                                        }
                                        if (valor.equals(va)) {
                                            s3 = "";
                                            s2 = "<div class=\"dropdown-icon w-icon-dropdown-toggle\" style=\"transform-style: preserve-3d; transition: transform 200ms ease 0s; transform: rotateX(0deg) rotateY(0deg) rotateZ(-90deg);\"></div>";
                                            s4 = "<nav class=\"w-dropdown-list\" id=\"w-dropdown-list-0\">";
                                            s5 = "</nav>";
                                            s6 = "";
                                            
                                            List<Menu> lstaSubMenu = consultas.obtSubMenuPrinc(id);
                                            String bl = "";
                                            for (Menu m : lstaSubMenu) {

                                                if (m.getTarget().equals("_blank")) {
                                                    bl = "target =\"_blank\" onblur=\"location.reload()\"";
                                                } else {
                                                    bl = "";
                                                }
                                                s6 = s6 + "<a href=\"" + m.getHref() + "\"  data-ix=\"fade-out-on-click\"  class=\"dropdown-link w-dropdown-link\" style=\"transition: background-color 0.2s ease 0s; outline: none;\" tabindex=\"-1\" " + bl + " role=\"menuitem\">" + m.getNombre() + " </a>";

                                            }
                                           
                                        } else {
                                            s3 = "<a href=\" " + href + " \">";
                                            s2 = "</a>";
                                            s4 = "";
                                            s5 = "";
                                            s6 = "";

                                        }

                                %>

                                <div data-delay="0" data-hover="1" class="w-dropdown" role="menu" aria-labelledby="w-dropdown-toggle-0" style="max-width: 1170px;">
                                    <div class="dropdown-toggle w-dropdown-toggle"  aria-controls="w-dropdown-list-0" aria-haspopup="menu" style="outline: none;">

                                        <%=s3%> <div class="inline-block"><%=nombre%></div> <%=s2%>


                                    </div>
                                    <%=s4%> <%=s6%> <%=s5%> 
                                </div> 
                                <%

                                        id = "";
                                        nombre = "";
                                        tipo = "";
                                        href = "";
                                        target = "";
                                        valor = "";
                                        s1 = "";
                                        s2 = "";
                                        s3 = "";
                                        s4 = "";
                                        s5 = "";

                                    }
                                  
                                %>               

                            </nav>
                            <div class="menu-button w-nav-button">
                                <div>
                                    <div class="line-1"></div>
                                    <div class="line-2"></div>
                                    <div class="line-3"></div>
                                </div>
                            </div>
                            <form style="margin-right:  110px;" class="search w-hidden-tiny w-form"><input type="search" id="search" name="search" placeholder="Información sobre…" maxlength="256" required="" class="search-input w-input"><input type="button" onclick="buscar()" value="Buscar" class="search-button w-button"></form>
                            <script>
                                        function buscar(){

                                        var query = document.getElementById("search").value;
                                                //location.href = "/SADM/Busqueda.jsp?search=" + query;
                                        }
                            </script>
                        </div>
                    </div>
                </nav>
            </div>
        </header>
        <!-- -->                             
        <br><br>
        <div style="display:flex;min-height:300px;padding-top:80px;background-image:url(/SADM/archivos/uploaded_files/5ba8fa0b018d59a4f1d2242a_subasta_inversa_full.png);background-position:60% 60%;background-size:cover">
            <div class="content-wrapper flex-center w-container">
                <div class="header-box">
                    <h1 data-ix="hero-move-up-on-load" class="heading-1 large">Resultados de la Búsqueda</h1>
                </div>
            </div>
        </div>
        <div class="w-container"><div class="section"></div>

            <div>
                <div class="search-result-items">

                    <%
                        if (lstBus.size() > 0) {
                            for (Busqueda b : lstBus) {

                    %>

                    <div>
                        <a style="color:blue" href="/SADM/index.jsp?id_html=<%=b.getUrlPag()%>"><%=b.getNombrePag()%></a>
                        <div class="text-block-5">/SADM/Busqueda.jsp?id_html=<%=b.getUrlPag()%></div>
                        <p><span>...<strong><%=request.getParameter("search")%></strong> <%=b.getContPag()%></span></p><hr /> </div>

                    <%    }
                    } else {%>
                    <div>
                        <hr /> 
                        <p><span>No se encontraron Resultados</span></p>
                        <hr /> </div> 
                        <% }

                        %>
                </div>
            </div>
        </div>

        <!-- -->
        <div class="footer-section">
            <div class="content-wrapper w-container">
                <div class="flex-wrapper footer-vertical">
                    <a href="index.jsp" data-ix="fade-out-on-click" class="logo-footer bottom-border w-inline-block">
                        <img id="log_f_sect_img" src="archivos\uploaded_files\5afaf23c5d83d94eb98cd446_AYD_Logo_Blanco-p-500.png" width="188" srcset="archivos\uploaded_files\5afaf23c5d83d94eb98cd446_AYD_Logo_Blanco-p-500.png 500w, archivos\uploaded_files\5afaf23c5d83d94eb98cd446_AYD_Logo_Blanco-p-800.png 800w, archivos\uploaded_files\5afaf23c5d83d94eb98cd446_AYD_Logo_Blanco.png 805w" sizes="188px" alt=""/>
                    </a>
                    <div class="menu-horizontal bottom-border">
                        <%   
                            List<Menu> lstaMenu_f = consultas.obtMenuPrinc_f();
                            String id_f = new String();
                            String nombre_f = new String();
                            String tipo_f = new String();
                            String paternMenu_f = new String();
                            String href_f = new String();
                            String target_f = new String();
                            String valor_f = new String();
                            String s1_f = new String();
                            String s2_f = new String();
                            String s3_f = new String();
                            String s4_f = new String();
                            String s5_f = new String();
                            String s6_f = new String();
                            for (Menu men : lstaMenu_f) {
                                //System.out.println("menu_f::" + men.getNombre() + " :: " + men.getTarget());
                                nombre_f = men.getNombre();
                                href_f = men.getHref();
                                //System.out.println("target1 :: " + men.getTarget());
                                target_f = men.getTarget();
                                String blank_f = "_blank";
                                if (target_f.equals(blank_f)) {
                                    s1_f = "target =\"_blank\" onblur=\"location.reload()\"";
                                } else {
                                    s1_f = "";
                                }
                        %>
                        <a href="<%=href_f%>" data-ix="fade-out-on-click" <%=s1_f%> class="footer-link horizontal"><%=nombre_f%></a>
                        <%

                                id_f = "";
                                nombre_f = "";
                                tipo_f = "";
                                href_f = "";
                                target_f = "";
                                valor_f = "";
                                s1_f = "";
                            }
                        %> 
                    </div>


                    <div class="footer-social-links">
                        <%   
                            List<Menu> lstaMenu_fs = consultas.obtMenuPrinc_fs();

                            String href_fs = new String();
                            String target_fs = new String();
                            String val2_fs = new String();
                            String s1_fs = new String();
                            String s2_fs = new String();
                            String valor_fs = new String();

                            for (Menu men : lstaMenu_fs) {
                                //System.out.println("menu_fs::"+ men.getNombre()+" :: " + men.getTarget() );
                                href_fs = men.getHref();
                                //System.out.println("target1 :: " + men.getTarget() );
                                target_fs = men.getTarget();
                                val2_fs = men.getVal2();
                                valor_fs = men.getVal3();
                                String quote_fs = "\"";
                                String blank_fs = "_blank";
                                s2_fs = "class=\"" + valor_fs + "\" ";

                                //System.out.println("s2_fs :: " + s2_fs);
                                //System.out.println("target2 :: " + target_fs );
                                if (target_fs.equals(blank_fs)) {
                                    s1_fs = "target =\"_blank\" onblur=\"location.reload()\"";
                                } else {
                                    s1_fs = "";
                                }
                        %>
                        <a id="log_f_soc_fb_url"  href="<%=href_fs%>" data-ix="show-on-hover" <%=s1_fs%> <%=s2_fs%>>
                            <img id="log_f_soc_fb_img" src="<%=val2_fs%>" height="13" data-ix="display-none" alt="" class="display-none"/></a>
                            <%

                                    href_fs = "";
                                    target_fs = "";
                                    val2_fs = "";
                                    valor_fs = "";
                                    s2_fs = "";
                                    quote_fs = "";
                                }
                               
                            %>       
                    </div>
                </div>
                <div class="w-embed w-script">
                    <!--Start of Tawk.to Script-->
                    <script type="text/javascript">
                        var Tawk_API = Tawk_API || {},
                                Tawk_LoadStart = new Date();
                                (function () {
                                var s1 = document.createElement("script"),
                                        s0 = document.getElementsByTagName("script")[0];
                                        s1.async = true;
                                        s1.src = 'archivos/js/default.js';
                                        s1.charset = 'UTF-8';
                                        s1.setAttribute('crossorigin', '*');
                                        s0.parentNode.insertBefore(s1, s0);
                                })();</script>
                    <!--End of Tawk.to Script-->
                </div>
                    <%
        
        Config confObj = consultas.obtenerConfig();
        consultas.getConexion().close();
    %>
                <div class="footer-notice">
                    <div class="footer-notice-text">
                        <span id="log_f_not_span"  class="text-span"><%=confObj.getCopyRigth()%></span> |  
                        <a id="log_f_not_a_term" href="" class="footer-notice-link">Términos y Condiciones</a>  |  
                        <a id="log_f_not_a_priv" href="" target="_blank" class="footer-notice-link">Avisos de Privacidad</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- -->            
        <script src="archivos/js/jquery-3.4.1.min.220afd743d.js" type="text/javascript"></script>
        <script src="archivos/js/sadm2021.51f485010.js" type="text/javascript"></script>
        <!--[if lte IE 9]><script src="//cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif]-->
        <script>
                                function getCookie(name) {
                                var dc = document.cookie;
                                        var prefix = name + "=";
                                        var begin = dc.indexOf("; " + prefix);
                                        if (begin == - 1) {
                                begin = dc.indexOf(prefix);
                                        if (begin != 0)
                                        return null;
                                } else {
                                begin += 2;
                                        var end = document.cookie.indexOf(";", begin);
                                        if (end == - 1) {
                                end = dc.length;
                                }
                                }
                                // because unescape has been deprecated, replaced with decodeURI
                                //return unescape(dc.substring(begin + prefix.length, end));
                                return decodeURI(dc.substring(begin + prefix.length, end));
                                }

                        function spu_createCookie(name, value, hours) {

                        var check = getCookie(name);
                                if (check != null) {
                        var d = document.getElementById(value);
                                d.style.display = "none";
                                //alert(document.cookie);
                        } else {

                        if (hours) {
                        //alert("Cookie created");
                        var date = new Date();
                                date.setTime(date.getTime() + (hours * 60 * 60 * 1000)); // 24 hours
                                var expires = "; expires=" + date.toGMTString();
                        } else {
                        var expires = "";
                        }
                        document.cookie = name + "=" + value + expires + "; path=/";
                        }
                        }

                        window.onload = function () {

                        var checkNoticebarid = document.getElementById('noticebarid');
                                if (checkNoticebarid == null) {
                        //alert ('noticebarid does not exist');
                        } else {
                        document.getElementById("noticebarid").onclick = function () {
                        spu_createCookie("elename1", "noticebarid", 24)
                        };
                        }

                        var checkNewsletterboxid = document.getElementById('newsletterboxid');
                                if (checkNewsletterboxid == null) {
                        //alert ('newsletterboxid does not exist');
                        } else {
                        document.getElementById("newsletterboxid").onclick = function () {
                        spu_createCookie("elename2", "newsletterboxid", 24)
                        };
                        }

                        var check1 = getCookie("elename1");
                                if (check1 == null && checkNoticebarid != null) {
                        //if cookie not exist set element visibility to display: block
                        //for better visibility element is hidden by default
                        var d = document.getElementById("noticebarid");
                                d.style.display = "block";
                        } else if (check1 != null && checkNoticebarid != null) {
                        //if cookie exist set element visibility to none aka hidden
                        var d = document.getElementById("noticebarid");
                                d.style.display = "none";
                        }

                        var check2 = getCookie("elename2");
                                if (check2 == null && checkNewsletterboxid != null) {
                        //if cookie not exist set element visibility to display: block
                        //for better visibility element is hidden by default
                        var e = document.getElementById("newsletterboxid");
                                e.style.display = "block";
                        } else if (check2 != null && checkNewsletterboxid != null) {
                        //if cookie exist set element visibility to none aka hidden
                        var e = document.getElementById("newsletterboxid");
                                e.style.display = "none";
                        }
                        }
        </script>

        <script src="https://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
        <script>
                                $(document).ready(function () {
                        $("#DatePickerVencimiento").datepicker();
                        });
        </script>
        <style>
            .w-slider-dot {
                font-size: 10px;
                background: #dfdfdf;
            }

            .w-slider-dot.w-active {
                background: #c7c7c7;
            }
        </style>
    </body>
</html>
