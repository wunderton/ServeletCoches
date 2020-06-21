<%-- 
    Document   : home
    Created on : 23-abr-2020, 10:57:05
    Author     : cuvil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Query"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empresa</title>
    </head>
    <body>
        <form name="frm_muestra_coche" method="post" action="controlador">
            <input type="hidden" name="op" value="muestraCoche">
            <input type="hidden" name="idSede">
            <table border="1">
                <tr><td colspan="4" align="center">Sedes [<a href="javascript:void(0)" onclick="javascript:document.frm_muestra_coche.op.value = 'altaSede';document.frm_muestra_coche.submit();">Nuevo coche</a>]</td></tr>
                <%
                    Session s = ORM.NewHibernateUtil.getInstance().getSessionFactory().openSession();
                    try {
                        Query q = s.createQuery("FROM coches ORDER BY nombre,id").setReadOnly(true);
                        List<ORM.Sede> listaSedes = (List<ORM.Sede>) q.list();
                if (listaSedes.isEmpty()) {%>
                <tr><td colspan="2">No existen coches</td></tr>
                <%
        } else {
            for (ORM.Sede unaSede : listaSedes) {%>
                <tr>
                    <td><%=unaSede.getIdSede()%></td>
                    <td><a href="javascript:void(0)" onclick="javascript:document.frm_muestra_sede.idSede.value = '<%=unaSede.getIdSede()%>';
                            document.frm_muestra_sede.submit();"><%=unaSede.getNomSede()%></a></td>
                                <td><a href="javascript:void(0)" onclick="javascript:document.frm_muestra_sede.op.value = 'editarCoche'; document.frm_muestra_sede.idSede.value = '<%=unaSede.getIdSede()%>';
                            document.frm_muestra_sede.submit();" >editar</a></td>
                    <td><a href="javascript:void(0)">eliminar</a></td>
                </tr>
                <%
                            }
                        }
                    } catch (Exception e) {
                        e.printStackTrace(System.err);
                    }
                %>
            </table>
        </form>
    </body>
</html>
