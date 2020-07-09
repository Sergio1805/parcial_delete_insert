<%-- 
    Document   : Datoslibro
    Created on : 09/07/2020, 11:40:39 AM
    Author     : Computer
--%>

<%@page import="java.sql.*"%>
<%@page import="bd.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos Libro</title>
        <link rel="stylesheet" href="CSS/estilo2.css" type="text/css"/>
        <script src="https://kit.fontawesome.com/f04f120a82.js" crossorigin="anonymous"></script>
        <%!
            
            String consulta5;
            Connection cn;
            PreparedStatement pst5;
            ResultSet rs5;
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
    <div id="cuadro2" align = "center">
    <body align = "center"><font face="calibri"> 
        <table border="1" cellspacing="1" cellpadding="1" align = "center">
            <thead>
                <tr>
                    <th>Nro</th>
                    <th>Autor</th>
                    <th>Título</th>
                    <th>Cantidad</th>
                    <th>Año</th>
                    <th>Editorial</th>
                    <th>País</th>
                    <th>Precio</th>
                    <th>Estado</th>
                    <th>Acción</th>
                </tr>
            </thead>
            <tbody align = "center">
                <%
                    try {
                        ConectaBd bd = new ConectaBd();
                        cn = bd.getConnection();
                        
                        consulta5 ="select autor.nombre, libro.titulo, libro.cantidad, libro.anio, editorial.nombre,"+
                                " pais.nombre, libro.precio, libro.estado from libro inner join pais,editorial,autor where"+
                                " libro.idautor=autor.idautor and libro.idpais=pais.idpais and libro.ideditorial=editorial.ideditorial"+
                                " order by libro.titulo asc, pais.nombre asc, editorial.nombre  asc";
                        pst5 = cn.prepareStatement(consulta5);
                        rs5= pst5.executeQuery();
                        int c=1;
                        while (rs5.next()) {
                            %>  
                            <tr>
                                <td><%out.println(""+c);%></td>    
                                <td><%out.println(rs5.getString(1));%></td>    
                                <td><%out.println(rs5.getString(2));%></td>    
                                <td><%out.println(rs5.getString(3));%></td>    
                                <td><%out.println(rs5.getString(4));%></td>    
                                <td><%out.println(rs5.getString(5));%></td>    
                                <td><%out.println(rs5.getString(6));%></td>    
                                <td><%out.println(rs5.getString(7));%></td>    
                                <td><%out.println(rs5.getString(8));%></td>    
                                <td><a href="eliminarlibro.jsp?id=<%out.println(""+c);%>"><font color="white"><i class="fas fa-trash-alt"></i></font></a></td>
                            </tr>
                             <%
                            c++;    
                        }
                } catch (Exception e) {
                    out.println("Error sql");
                }
            %>
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
