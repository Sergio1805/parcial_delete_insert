<%-- 
    Document   : Datosautor
    Created on : 25/06/2020, 08:48:09 AM
    Author     : tomy_
--%>
<%@page import="java.sql.*" %>
<%@page import="bd.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos Autor</title>
        <link rel="stylesheet" href="CSS/estilo2.css" type="text/css"/>
        <script src="https://kit.fontawesome.com/f04f120a82.js" crossorigin="anonymous"></script>
        <%!
        
            String consulta;
            Connection cn;
            PreparedStatement pst;
            ResultSet rs;
            
            /* NUEVAS VARIABLES */
            
            String s_accion;
            String s_idautor;
            String s_nombre;
            String s_f_nacimiento;
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
            <form name="AgregarAutorForm" action="Datosautor.jsp" method="GET">
                <table border="0" align="center">
                    <thead>
                        <tr>
                            <th colspan="2">Agregar Autor</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Nombre: </td>
                            <td><input type="text" name="f_nombre" value="" maxlength="30" size="20" /></td>
                        </tr>
                        <tr>
                            <td>Nacimiento: </td>
                            <td><input type="text" name="f_nacimiento" value="" maxlength="40" size="20" /></td>
                        </tr>
                        <tr align="center">
                            <td colspan="2">
                                <input type="submit" value="Agregar" name="f_agregar" />
                                <input type="hidden" value="C" name="f_accion" />
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
        <table border="1" cellspacing="1" cellpadding="1" align = "center" >
            <thead>
                <tr>
                    <th>Nro</th>
                    <th>Nombre</th>
                    <th>Nacimiento</th>
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
                        s_idautor= request.getParameter("f_idautor");
                        
                        /* PARA ELIMINAR */
                        
                        if (s_accion!=null) {
                            if (s_accion.equals("E")) {
                                consulta =  "   delete from autor "
                                            + " where "
                                            + " idautor = " + s_idautor + " ";
                                //out.print(consulta);
                                pst = cn.prepareStatement(consulta);
                                pst.executeUpdate();
                                
                        /* PARA INSERTAR */
                        
                            }else if (s_accion.equals("C")) {
                                s_nombre = request.getParameter("f_nombre");
                                s_f_nacimiento = request.getParameter("f_nacimiento");
                                consulta =  "insert into "
                                            + " autor(nombre,f_nacimiento) "
                                            + " values ('"+ s_nombre +"','"+ s_f_nacimiento +"')";
                                //out.print(consulta);
                                pst = cn.prepareStatement(consulta);
                                pst.executeUpdate();
                            }
                        }
                        
                        consulta = "select idautor, nombre, f_nacimiento from autor order by nombre asc";
                        pst = cn.prepareStatement(consulta);
                        rs = pst.executeQuery();
                        
                        
                        int c=0;
                        String ide;
                        while (rs.next()) {
                            ide = rs.getString(1);
                            c++;
                        %>       
                        <tr>

                            <td><%out.println(c);%></td>
                            <td><%out.println(rs.getString(2));%></td>
                            <td><%out.println(rs.getString(3));%></td>
                            <td><a href="Datosautor.jsp?f_accion=E&f_idautor=<%out.print(ide);%>"><font color="white"><i class="fas fa-trash-alt"></i></font></a></td>
                            <td>Editar</td>
                        </tr>


            <%
                
                    }
                    
                    rs.close();
                    pst.close();
                    cn.close();
                } catch (Exception e) {
                    out.println("Error SQL");
                }
            %>
            </tr>
            <tr>

            </tr>
            </tbody>
    </table>
      <!-- BOTÓN AGREGAR 
      <table>
            <tr align = "center">
                <td><font size="80"><a href="agregar.jsp"><font color="white"><i class="fas fa-plus-circle"></i></i></font></a></font></td>
            </tr>
       </table> -->
    </font><body></div>

</html>
