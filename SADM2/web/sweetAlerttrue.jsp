
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="tipo_contenido"  content="text/html;" http-equiv="content-type" charset="utf-8">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
     <%
     String nir = request.getParameter("nir");
     String email = request.getParameter("email");
    %>
<script>
swal("<%=nir%> Servicio agregado!", "Alta exitosa: <%=email%>", "success").then((value) => {window.parent.location.href='mC_S4dm.html'});

</script>
</body>
</html>
