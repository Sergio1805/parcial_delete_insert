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
            String consulta6;
            
            Connection cn;
            PreparedStatement pst5;
            PreparedStatement pst3;
            PreparedStatement pst2;
            PreparedStatement pst1;
            ResultSet rs5;
            ResultSet rs3;
            ResultSet rs2;
            ResultSet rs1;
            
            String s_accion;
            int s_idlibro;
            String s_titulo;
            int s_cantidad;
            int s_anio;
            int s_precio;
            String s_estado;
            int s_idautor;
            int s_ideditorial;
            int s_idpais;
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
      
    <!---------------------------- AGREGAR ---------------------------->
      <div id="cuadro2" align="center">
        <table width="500" align="center" cellspacing="0" bgcolor="#D0D0D0">
            <tbody id="subtitulo1" align="center" ><font face="calibri"> 
            <form name="AgregarLibroForm" action="Datoslibro.jsp" method="GET">
                <table border="0" align="center">
                    <thead>
                        <tr>
                            <th colspan="2">Agregar Libro</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Titulo: </td>
                            <td><input type="text" name="f_titulo" value="" maxlength="40" size="20" /></td>
                        </tr>
                        <tr>
                            <td>Cantidad: </td>
                            <td><input type="text" name="f_cantidad" value="" maxlength="40" size="20"/></td>
                        </tr>
                        <tr>
                            <td>Año: </td>
                            <td><input type="text" name="f_anio" value="" maxlength="40" size="20" /></td>
                        </tr>
                        <tr>
                            <td>Precio: </td>
                            <td><input type="text" name="f_precio" value="" maxlength="40" size="20"/></td>
                        </tr>
                        <tr>
                            <td>Estado: </td>
                            <td><input type="text" name="f_estado" value="" maxlength="1" size="2"/></td>
                        </tr>
                        <tr>
                            <td>Autor: </td>
                            <td>
                        <select name="f_autor" >
                            <%
                                try {
                                    ConectaBd bd = new ConectaBd();
                                    cn = bd.getConnection();
                                    consulta5 = "select nombre from autor";
                                    pst5 = cn.prepareStatement(consulta5);
                                    rs5 =pst5.executeQuery();
                                    
                                        while (rs5.next()) {   

                                        %>     
                                        <option><%out.println(rs5.getString(1));%></option>
                                        <%
                                        }
                              
                                    } catch (Exception e) {
                                    out.println("Error sql...");
                                    }
                            %>    
                        
                        </select>
                        </td>   
                        </tr>
                        <tr>
                            <td>Editorial: </td>
                            <td>
                        <select name="f_editorial" >
                            <%
                                try {
                                    ConectaBd bd = new ConectaBd();
                                    cn = bd.getConnection();
                                    consulta5 = "select nombre from editorial";
                                    pst5 = cn.prepareStatement(consulta5);
                                    rs5 =pst5.executeQuery();
                                    
                                        while (rs5.next()) {   

                                        %>     
                                        <option><%out.println(rs5.getString(1));%></option>
                                        <%
                                        }
                              
                                    } catch (Exception e) {
                                    out.println("Error sql...");
                                    }
                            %>    
                        
                        </select>
                        </td>
                        </tr>
                        <tr>
                            <td>País: </td>
                           <td>
                        <select name="f_pais" >
                            <%
                                try {
                                    ConectaBd bd = new ConectaBd();
                                    cn = bd.getConnection();
                                    consulta5 = "select nombre from pais";
                                    pst5 = cn.prepareStatement(consulta5);
                                    rs5 =pst5.executeQuery();
                                    
                                        while (rs5.next()) {   

                                        %>     
                                        <option><%out.println(rs5.getString(1));%></option>
                                        <%
                                        }
                              
                                    } catch (Exception e) {
                                    out.println("Error sql...");
                                    }
                            %>    
                        
                        </select>
                        </td>
                        </tr>
                        <tr align="center">
                            <td colspan="2">
                                <input type="submit" value="Agregar" name="f_agregar" />
                                <input type="hidden" name="f_accion" value="C" />
                            </td>
                        </tr>
                    </tbody>
                </table>

            </form>  
            </font></tbody>
        </table>
    </div>
    <!-------------------------------------------------------------------------------->
      
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
                    <th>Eliminar</th>
                    <th>Editar</th>
                </tr>
            </thead>
            <tbody align = "center">
                <%
                    try {
                        ConectaBd bd = new ConectaBd();
                        cn = bd.getConnection();
                        
                        s_accion = request.getParameter("f_accion");
                        s_idlibro = Integer.valueOf(request.getParameter("f_idlibro"));
                          
                        if (s_accion!=null) {
                            if (s_accion.equals("E")) {
                                consulta5 =  "   delete from libro "
                                            + " where "
                                            + " idlibro = " + s_idlibro + "; ";
                                
                                pst5 = cn.prepareStatement(consulta5);
                                pst5.executeUpdate();

                            }else if (s_accion.equals("C")) {
                                s_titulo = request.getParameter("f_titulo");
                                s_cantidad = Integer.valueOf(request.getParameter("f_cantidad")) ;
                                s_anio = Integer.valueOf(request.getParameter("f_anio")) ;
                                s_precio = Integer.valueOf(request.getParameter("f_precio"));
                                s_estado = request.getParameter("f_estado");
                                
                                pst1=cn.prepareStatement("select idautor, nombre from autor");
                                rs1=pst1.executeQuery();
                                while (rs1.next()) {                                        
                                        if (rs1.getString(2).equals(request.getParameter("f_autor"))) {
                                             s_idautor =Integer.valueOf(rs1.getString(1)) ;    
                                            }
                                    }
                                pst2=cn.prepareStatement("select ideditorial, nombre from editorial");
                                rs2=pst2.executeQuery();
                                while (rs2.next()) {                                        
                                        if (rs2.getString(2).equals(request.getParameter("f_editorial"))) {
                                              s_ideditorial=Integer.valueOf(rs2.getString(1)) ;    
                                            }
                                    }
                                pst3=cn.prepareStatement("select idpais, nombre from pais");
                                rs3=pst3.executeQuery();
                                while (rs3.next()) {                                        
                                        if (rs3.getString(2).equals(request.getParameter("f_pais"))) {
                                              s_idpais=Integer.valueOf(rs3.getString(1)) ;    
                                            }
                                    }
                                
                                consulta5 =  "   insert into "
                                            + " libro (titulo, cantidad, anio, precio, estado, idautor, ideditorial, idpais) "
                                            + " values ('"+ s_titulo +"',"+ s_cantidad+","+ s_anio +","+s_precio+",'"+s_estado+"',"+ s_idautor +","+s_ideditorial+","+s_idpais +");";
                             
                                pst5 = cn.prepareStatement(consulta5);
                                pst5.executeUpdate();
                                
                            }
                        }
                        
                        consulta6 ="select autor.nombre, libro.titulo, libro.cantidad, libro.anio, editorial.nombre,"+
                                " pais.nombre, libro.precio, libro.estado from libro inner join pais,editorial,autor where"+
                                " libro.idautor=autor.idautor and libro.idpais=pais.idpais and libro.ideditorial=editorial.ideditorial"+
                                " order by libro.titulo asc, pais.nombre asc, editorial.nombre  asc";
                        pst5 = cn.prepareStatement(consulta6);
                        rs5= pst5.executeQuery();
                       
                        int c=0;
                        String ide;
                        while (rs5.next()) {
                            ide = rs5.getString(1);
                            c++;
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
                                <td><a href="Datoslibro.jsp?f_accion=E&f_idlibro=<%out.print(ide);%>"><font color="white"><i class="fas fa-trash-alt"></i></font></a></td>
                                <td>Editar</td>
                            </tr>
                             <%
                          
                        }
                } catch (Exception e) {
                    
                    out.println("Error sql");
                    
                } 
            %>
        </tbody>
    </table>
      </font></body></div>
</html>
