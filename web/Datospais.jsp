
<%@page import="java.sql.*" %>
<%@page import="bd.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos País</title>
        <link rel="stylesheet" href="CSS/estilo2.css" type="text/css"/>
        <script src="https://kit.fontawesome.com/f04f120a82.js" crossorigin="anonymous"></script>
        <%!
        
            String consulta;
            Connection cn;
            PreparedStatement pst;
            ResultSet rs;
        %>
    </head>
      <!-- TABLA DEL MENÚ SUPERIOR -->
      <div id="cuadro2" align="center">
        <table width="500" border="3" align="center" cellspacing="0" bgcolor="#D0D0D0">
            <thead>
                <tr>
                    <th colspan="4"><font face ="fantasy" size="4" color="black">MENÚ PRINCIPAL</font></th>
                </tr>
            </thead>
            <tbody id="subtitulo1" align="center" >
                <tr>
                    <td><font size="3"><a href="Datosautor.jsp">Datos Autor</a></font></td>
                    <td><font size="3"><a href="Datoseditorial.jsp">Datos Editorial</a></font></td>
                    <td><font size="3"><a href="Datoslibro.jsp">Datos Libro</a></font></td>
                    <td><font size="3"><a href="Datospais.jsp">Datos País</a></font></td>
                </tr>
                </tbody>
        </table>
    </div>
      
    <div align = "center" id="cuadro2">
    <body align = "center"><font face="calibri"> 
        <table border="1" cellspacing="1" cellpadding="1" align = "center">
            <thead>
                <tr>
                    <th>Nro</th>
                    <th>Nombre</th>
                    <th>Estado</th>
                    <th>Acción</th>
                </tr>
            </thead>
            <tbody align = "center">

                <%
                    try {
                        ConectaBd bd = new ConectaBd();
                        cn = bd.getConnection();
                        consulta = "select idpais, nombre, estado from pais order by nombre asc";
                        pst = cn.prepareStatement(consulta);
                        rs = pst.executeQuery();
                        int c=1;
                        while (rs.next()) {
                %>       
            <tr>
            
                <td><%out.println(c);%></td>
                <td><%out.println(rs.getString(2));%></td>
                <td><%out.println(rs.getString(3));%></td>
                <td><a href="eliminarpais.jsp?id=<%out.println(c);%>"><font color="white"><i class="fas fa-trash-alt"></i></font></a></td>
           
            </tr>

            <%
                c++;
                    }
                    
                    rs.close();
                    pst.close();
                    cn.close();
                } catch (Exception e) {
                    out.println("Error sql");
                }

            %>
            </tr>
            <tr>

            </tr>
        </tbody>
    </table>
      <!-- BOTÓN AGREGAR -->
      <table>
            <tr align = "center">
                <td><font size="80"><a href="agregar.jsp"><font color="white"><i class="fas fa-plus-circle"></i></i></font></a></font></td>
            </tr>
            <tr>
                <td>AGREGAR</td> 
            </tr>
            </table>
      </font></body></div>
</html>

