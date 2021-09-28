package com.sadm.controlador;

import com.sadm.dao.Busqueda;
import com.sadm.dao.Config;
import com.sadm.dao.Menu;
import com.sadm.dao.Noticia;
import com.sadm.dao.Pagina;
import com.sadm.dao.Usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 *
 * @author marco garulo
 */
public class Consultas extends ConexionDB {

    public static String uidPagi = "consulta";

    public String getUidPagi() {
        return uidPagi;
    }

    public void setUidPagi(String uidPagi) {
        this.uidPagi = uidPagi;
    }

    /*
     *
     *Usuarios
     *
     */
    private static String CONSULTA_EDITAR_USUARIO = "UPDATE `sadm_web`.`usuarios` SET  `Usuario`=?, `Password`=?, `Nombres`=?, `Apellido_Paterno`=?, `Apellido_Materno`=?,  `activo`=?, `desc_modif`=?, `user_modif`=?, `f_modif`=? WHERE (`idUsuarios`=?);";

    public boolean editarUsuario(String txtusredit, String editar_idUsuario, String editar_Usuario, String editar_Password, String editar_Activo, String editar_Nombres, String editar_A_Paterno, String editar_A_Materno) {
        PreparedStatement pst = null;

        try {

            Date fecha = new Date();
            pst = getConexion().prepareStatement(CONSULTA_EDITAR_USUARIO);

            pst.setString(10, editar_idUsuario);
            pst.setString(1, editar_Usuario);
            pst.setString(2, editar_Password);
            pst.setString(3, editar_Nombres);
            pst.setString(4, editar_A_Paterno);
            pst.setString(5, editar_A_Materno);
            pst.setString(6, editar_Activo);
            pst.setString(7, "EDITAR USUARIO");
            pst.setString(8, txtusredit);
            pst.setString(9, fecha.toString());

            if (pst.executeUpdate() == 1) {
                System.out.println("Usuario editado");
                return true;
            }

        } catch (Exception ex) {
            System.err.println("catch Error: " + ex);
        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception e) {

                System.err.println("finally Error: " + e);
            }

        }
        //System.out.println("ERROR Menu no insertado");
        return false;
    }

    //TEST de actualizarUsuario
 /*
     public static void main(String[] args) {
     Consultas co = new Consultas();
     co.editarUsuario("a_prueba","Prueba","Prueba","P","P","P","P","P","P","P","P","6aae37da-aed3-4575-a665-a8b9c468aa71");
     System.out.println(":::: edit test user::::");

     }
     */
    private static String CONSULTA_INSERTAR_USUARIO = "INSERT INTO `sadm_web`.`usuarios` (`idUsuarios`, `Usuario`, `Password`, `Nombres`, `Apellido_Paterno`, `Apellido_Materno`, `activo`, `desc_modif`, `user_modif`, `f_modif`,`idRol`) VALUES (?,?, ?, ?, ?, ?, ?, ?, ?, ?,'1');";

    public boolean insertarUsuario(String detalle_Usuario, String detalle_Password, String detalle_Activo, String detalle_Nombres, String detalle_A_Paterno, String detalle_A_Materno, String detalle_User_Modif) {
        PreparedStatement pst = null;

        try {
            UUID uid = UUID.randomUUID();
            Date fecha = new Date();
            pst = getConexion().prepareStatement(CONSULTA_INSERTAR_USUARIO);

            pst.setString(1, uid.toString());
            pst.setString(2, detalle_Usuario);
            pst.setString(3, detalle_Password);
            pst.setString(4, detalle_Nombres);
            pst.setString(5, detalle_A_Paterno);
            pst.setString(6, detalle_A_Materno);
            pst.setString(7, detalle_Activo);
            pst.setString(8, "Creación de Nuevo Usuario");
            pst.setString(9, detalle_User_Modif);
            pst.setString(10, fecha.toString());
            //System.out.println("PST ::: " + pst);
            if (pst.executeUpdate() == 1) {
                System.out.println("Usuario insertado");
                return true;
            }

        } catch (Exception ex) {
            System.err.println("catch Error: " + ex);
        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception e) {

                System.err.println("finally Error: " + e);
            }

        }
        //System.out.println("ERROR Menu no insertado");
        return false;
    }

    //TEST de actualizarUsuarios
  /*
     public static void main(String[] args) {
     Consultas co = new Consultas();
     co.insertarUsuario("prueba","Prueba","Prueba","P","P","P","P","1","P","P");
     System.out.println(":::: insert test user ::::");

     }
     */
    private static String CONSULTA_ELIMINAR_USUARIO = " delete from usuarios where idUsuarios = ? ; ";

    public boolean eliminarUsuario(String user) {
        PreparedStatement pst = null;

        try {
            pst = getConexion().prepareStatement(CONSULTA_ELIMINAR_USUARIO);

            pst.setString(1, user);
            //System.out.println("PST ::: " + pst);
            if (pst.executeUpdate() == 1) {
                System.out.println("Usuario eliminado");
                return true;
            }

        } catch (Exception ex) {
            System.err.println("catch Error: " + ex);
        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception e) {

                System.err.println("finally Error: " + e);
            }

        }
        return false;
        //System.out.println("ERROR Menu no insertado");

    }

    //TEST de actualizarUsuarios
  /*
     public static void main(String[] args) {
     Consultas co = new Consultas();
     co.eliminarUsuario("Test");
     System.out.println(":::: delete test menu::::");

     }*/
    private static String CONSULTA_OBTENER_USUARIOS_ACTIVOS = "select * from usuarios where activo ='t';";

    public List<Usuario> obtAllUsuariosActivos() {
        List<Usuario> lstUsu = new ArrayList<Usuario>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {

            pst = getConexion().prepareStatement(CONSULTA_OBTENER_USUARIOS_ACTIVOS);

            rs = pst.executeQuery();

            while (rs.next()) {
                Usuario m = new Usuario();

                m.setIdusuario(rs.getNString("idUsuarios"));
                m.setUsuario(rs.getNString("Usuario"));
                m.setPassword(rs.getNString("Password"));
                m.setNombres(rs.getNString("Nombres"));
                m.setApellido_p(rs.getNString("Apellido_Paterno"));
                m.setApellido_m(rs.getNString("Apellido_Materno"));
                m.setRfc(rs.getNString("RFC"));
                m.setCurp(rs.getNString("CURP"));
                m.setIdrol(rs.getNString("idRol"));
                m.setActivo(rs.getNString("activo"));
                m.setDesc_modif(rs.getNString("desc_modif"));
                m.setUser_modif(rs.getNString("user_modif"));
                m.setF_modif(rs.getNString("f_modif"));

                lstUsu.add(m);
            }
        } catch (Exception e) {
            System.err.println("catch Error: " + e);
        }
        //System.out.println("lstMenu.size :: " + lstUsu.size());
        return lstUsu;
    }
    //TEST de obtAllUsuariosActivos
    /*
     public static void main(String[] args) {
     Consultas co = new Consultas();
     System.out.println(co.obtAllUsuariosActivos());
     }
     */

    private static String CONSULTA_OBTENER_USUARIOS = "select * from usuarios ;";

    public List<Usuario> obtAllUsuarios() {
        List<Usuario> lstUsu = new ArrayList<Usuario>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {

            pst = getConexion().prepareStatement(CONSULTA_OBTENER_USUARIOS);

            rs = pst.executeQuery();

            while (rs.next()) {
                Usuario m = new Usuario();

                m.setIdusuario(rs.getNString("idUsuarios"));
                m.setUsuario(rs.getNString("Usuario"));
                m.setPassword(rs.getNString("Password"));
                m.setNombres(rs.getNString("Nombres"));
                m.setApellido_p(rs.getNString("Apellido_Paterno"));
                m.setApellido_m(rs.getNString("Apellido_Materno"));
                m.setRfc(rs.getNString("RFC"));
                m.setCurp(rs.getNString("CURP"));
                m.setIdrol(rs.getNString("idRol"));
                m.setActivo(rs.getNString("activo"));
                m.setDesc_modif(rs.getNString("desc_modif"));
                m.setUser_modif(rs.getNString("user_modif"));
                m.setF_modif(rs.getNString("f_modif"));

                lstUsu.add(m);
            }
        } catch (Exception e) {
            System.err.println("catch Error: " + e);
        }
        //System.out.println("lstMenu.size :: " + lstUsu.size());
        return lstUsu;
    }
    //TEST de obtAllUsuarios
    /*
     public static void main(String[] args) {
     Consultas co = new Consultas();
     System.out.println(co.obtAllUsuarios());
     }
     */
    private static String CONSULTA_OBTENER_IDUSUARIO = "select uidUsuario from usuarios where Usuario = ? ;";

    public String obtenerIdUsuario(String usuario) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        String idUsuarios = null;
        try {
            pst = getConexion().prepareStatement(CONSULTA_OBTENER_IDUSUARIO);
            pst.setString(1, usuario);

            rs = pst.executeQuery();

            while (rs.next()) {
                idUsuarios = rs.getNString("uidUsuario");

            }
        } catch (Exception e) {
            System.err.println("catch Error: " + e);
        }
        //System.out.println("idUsuario:: " + idUsuarios);
        return idUsuarios;
    }
    //TEST de obtenerIdUsuario
    /*
     public static void main(String[] args) {
     Consultas co = new Consultas();
     System.out.println(co.obtenerIdUsuario("userTest"));
     }
     */

    private static String CONSULTA_AUTENTICACION = "select * from usuarios where Usuario = ? and Password= ? and activo ='t';";

    public boolean autenticacion(String usuario, String password) {

        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            pst = getConexion().prepareStatement(CONSULTA_AUTENTICACION);
            pst.setString(1, usuario);
            pst.setString(2, password);

            rs = pst.executeQuery();

            if (rs.absolute(1)) {
                return true;
            }
        } catch (Exception e) {
            System.err.println("catch Error: " + e);
        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception e) {

                System.err.println("finally Error: " + e);
            }

        }

        return false;
    }
    //TEST de autenticacion
    /*
     public static void main(String[] args) {
     Consultas co = new Consultas();
     System.out.println(co.autenticacion("InsertTestU", "ITestP"));
     }
     */

    /*
     *
     *Menús
     *
     */
    private static String CONSULTA_OBTENER_TODOS_MENUS = "select * from menus_d order by id;";

    public List<Menu> obtAllMenu() {
        List<Menu> lstMen = new ArrayList<Menu>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {

            pst = getConexion().prepareStatement(CONSULTA_OBTENER_TODOS_MENUS);

            rs = pst.executeQuery();

            while (rs.next()) {
                Menu m = new Menu();

                m.setId(rs.getNString("id"));
                m.setNombre(rs.getNString("nombre"));
                m.setValor(rs.getNString("valor"));
                m.setTipo(rs.getNString("tipo"));
                m.setMenu_padre(rs.getNString("menu_padre"));
                m.setHref(rs.getNString("href"));
                m.setTarget(rs.getNString("target"));
                m.setActivo(rs.getNString("activo"));
                m.setVal1(rs.getNString("val1"));
                m.setVal2(rs.getNString("val2"));
                m.setVal3(rs.getNString("val3"));
                m.setDesc_modif(rs.getNString("desc_modif"));
                m.setUser_modif(rs.getNString("user_modif"));
                m.setF_modif(rs.getNString("f_modif"));

                lstMen.add(m);
            }
        } catch (Exception e) {
            System.err.println("catch Error: " + e);
        }
        //System.out.println("lstMenu.size :: " + lstMen.size());
        return lstMen;
    }
    //TEST de obtenerIdUsuario
    /*
     public static void main(String[] args) {
     Consultas co = new Consultas();
     System.out.println(co.obtAllMenu());
     }
     */
    private static String CONSULTA_OBTENER_MENU_PRINCIPAL = "select * from menus_d where tipo ='menu' and activo ='t' ORDER BY val1;";

    public List<Menu> obtMenuPrinc() {
        List<Menu> lstMen = new ArrayList<Menu>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {

            pst = getConexion().prepareStatement(CONSULTA_OBTENER_MENU_PRINCIPAL);

            rs = pst.executeQuery();

            while (rs.next()) {
                Menu m = new Menu();

                m.setId(rs.getNString("id"));
                m.setNombre(rs.getNString("nombre"));
                m.setValor(rs.getNString("valor"));
                m.setTipo(rs.getNString("tipo"));
                m.setMenu_padre(rs.getNString("menu_padre"));
                m.setHref(rs.getNString("href"));
                m.setTarget(rs.getNString("target"));
                m.setActivo(rs.getNString("activo"));
                m.setVal1(rs.getNString("val1"));
                m.setVal2(rs.getNString("val2"));
                m.setVal3(rs.getNString("val3"));
                m.setDesc_modif(rs.getNString("desc_modif"));
                m.setUser_modif(rs.getNString("user_modif"));
                m.setF_modif(rs.getNString("f_modif"));

                lstMen.add(m);
            }
        } catch (Exception e) {
            System.err.println("catch Error: " + e);
        }
        //System.out.println("lstMenu.size :: " + lstMen.size());
        return lstMen;
    }
    //TEST de obtenerIdUsuario
    /*
     public static void main(String[] args) {
     Consultas co = new Consultas();
     System.out.println(co.obtMenuPrinc());
     }
     */

    private static String CONSULTA_OBTENER_SUBMENU_PRINCIPAL = "select * from menus_d where menu_padre = ? and activo='t' ORDER BY val1 ;";

    public List<Menu> obtSubMenuPrinc(String idMenuPadre) {
        List<Menu> lstMen = new ArrayList<Menu>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {

            pst = getConexion().prepareStatement(CONSULTA_OBTENER_SUBMENU_PRINCIPAL);
            pst.setString(1, idMenuPadre);
            rs = pst.executeQuery();

            while (rs.next()) {
                Menu m = new Menu();

                m.setId(rs.getNString("id"));
                m.setNombre(rs.getNString("nombre"));
                m.setValor(rs.getNString("valor"));
                m.setTipo(rs.getNString("tipo"));
                m.setMenu_padre(rs.getNString("menu_padre"));
                m.setHref(rs.getNString("href"));
                m.setTarget(rs.getNString("target"));
                m.setActivo(rs.getNString("activo"));
                m.setVal1(rs.getNString("val1"));
                m.setVal2(rs.getNString("val2"));
                m.setVal3(rs.getNString("val3"));
                m.setDesc_modif(rs.getNString("desc_modif"));
                m.setUser_modif(rs.getNString("user_modif"));
                m.setF_modif(rs.getNString("f_modif"));

                lstMen.add(m);
            }
        } catch (Exception e) {
            System.err.println("catch Error: " + e);
        }
        //System.out.println("lstMenu.size :: " + lstMen.size());
        return lstMen;
    }
    //TEST de obtenerIdUsuario
    /*
     public static void main(String[] args) {
     Consultas co = new Consultas();
     System.out.println(co.obtSubMenuPrinc());
     }
     */

    private static String CONSULTA_OBTENER_MENU_PRINCIPAL_FOOTER = "select * from menus_d where tipo ='menu_f' and activo ='t' ORDER BY val1;";

    public List<Menu> obtMenuPrinc_f() {
        List<Menu> lstMen = new ArrayList<Menu>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {

            pst = getConexion().prepareStatement(CONSULTA_OBTENER_MENU_PRINCIPAL_FOOTER);

            rs = pst.executeQuery();

            while (rs.next()) {
                Menu m = new Menu();

                m.setId(rs.getNString("id"));
                m.setNombre(rs.getNString("nombre"));
                m.setValor(rs.getNString("valor"));
                m.setTipo(rs.getNString("tipo"));
                m.setMenu_padre(rs.getNString("menu_padre"));
                m.setHref(rs.getNString("href"));
                m.setTarget(rs.getNString("target"));
                m.setActivo(rs.getNString("activo"));
                m.setVal1(rs.getNString("val1"));
                m.setVal2(rs.getNString("val2"));
                m.setVal3(rs.getNString("val3"));
                m.setDesc_modif(rs.getNString("desc_modif"));
                m.setUser_modif(rs.getNString("user_modif"));
                m.setF_modif(rs.getNString("f_modif"));

                lstMen.add(m);
            }
        } catch (Exception e) {
            System.err.println("catch Error: " + e);
        }
        //System.out.println("lstMenu.size :: " + lstMen.size());
        return lstMen;
    }

    //TEST de obtenerIdUsuario
    /*
     public static void main(String[] args) {
     Consultas co = new Consultas();
     System.out.println(co.obtMenuPrinc_f());
     }
     */
    private static String CONSULTA_OBTENER_MENU_PRINCIPAL_FOOTER_SOCIAL = "select * from menus_d where tipo ='menu_fs' ORDER BY val1;";

    public List<Menu> obtMenuPrinc_fs() {
        List<Menu> lstMen = new ArrayList<Menu>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            pst = getConexion().prepareStatement(CONSULTA_OBTENER_MENU_PRINCIPAL_FOOTER_SOCIAL);

            rs = pst.executeQuery();

            while (rs.next()) {
                Menu m = new Menu();

                m.setId(rs.getNString("id"));
                m.setNombre(rs.getNString("nombre"));
                m.setValor(rs.getNString("valor"));
                m.setTipo(rs.getNString("tipo"));
                m.setMenu_padre(rs.getNString("menu_padre"));
                m.setHref(rs.getNString("href"));
                m.setTarget(rs.getNString("target"));
                m.setActivo(rs.getNString("activo"));
                m.setVal1(rs.getNString("val1"));
                m.setVal2(rs.getNString("val2"));
                m.setVal3(rs.getNString("val3"));
                m.setDesc_modif(rs.getNString("desc_modif"));
                m.setUser_modif(rs.getNString("user_modif"));
                m.setF_modif(rs.getNString("f_modif"));

                lstMen.add(m);
            }
        } catch (Exception e) {
            System.err.println("catch Error: " + e);
        }
        //System.out.println("lstMenu.size :: " + lstMen.size());
        return lstMen;
    }
    //TEST de obtenerIdUsuario
    /*
     public static void main(String[] args) {
     Consultas co = new Consultas();
     System.out.println(co.obtMenuPrinc_f());
     }
     */

    private static String CONSULTA_INSERTAR_MENU = "INSERT INTO `sadm_web`.`menus_d` (`id`, `nombre`, `valor`, `tipo`, `menu_padre`, `href`, `target`, `activo`, `val1`, `desc_modif`, `user_modif`, `f_modif`, val2, val3) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,'val2','val3');";

    public boolean insertarMenu(String agregar_uid_Menu, String agregar_menu_nombre, String agregar_menu_tipo, String agregar_menu_padre, String agregar_menu_href, String agregar_menu_target, String agregar_menu_activo, String agregar_menu_val1, String detalle_idRol, String detalle_User_Modif, String agregar_menu_valor) {
        PreparedStatement pst = null;

        try {
            Date fecha = new Date();
            pst = getConexion().prepareStatement(CONSULTA_INSERTAR_MENU);

            pst.setString(1, agregar_uid_Menu);
            pst.setString(2, agregar_menu_nombre);
            pst.setString(3, agregar_menu_valor);
            pst.setString(4, agregar_menu_tipo);
            pst.setString(5, agregar_menu_padre);
            pst.setString(6, agregar_menu_href);
            pst.setString(7, agregar_menu_target);
            pst.setString(8, agregar_menu_activo);
            pst.setString(9, agregar_menu_val1);
            pst.setString(10, "NUEVO MENÚ");
            pst.setString(11, detalle_User_Modif);
            pst.setString(12, fecha.toString());

            if (pst.executeUpdate() == 1) {
                //System.out.println("Menu insertado");
                return true;
            }

        } catch (Exception ex) {
            System.err.println("catch Error: " + ex);
        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception e) {

                System.err.println("finally Error: " + e);
            }

        }
        //System.out.println("ERROR Menu no insertado");
        return false;
    }

    //TEST de actualizarUsuarios
  /*
     public static void main(String[] args) {
     Consultas co = new Consultas();
     co.insertarMenu("prueba","Prueba","Prueba","P","P","P","P","P","P","P","P","P","P");
     System.out.println(":::: insert test menu::::");

     }
     */
    private static String CONSULTA_EDITAR_MENU = "UPDATE `sadm_web`.`menus_d` SET  `nombre`= ? , `valor`= ? , `tipo`= ? , `menu_padre`= ? , `href`= ? , `target`= ? , `activo`= ? , `val1`= ? , `desc_modif`= ? , `user_modif`= ?, `f_modif`= ? WHERE (`id`= ? );";

    public boolean editarMenu(String txtusredit, String detalle_uid_Menu, String detalle_menu_nombre, String detalle_menu_valor, String detalle_menu_padre, String detalle_menu_tipo, String detalle_menu_href, String detalle_menu_target, String detalle_menu_activo, String detalle_menu_val1, String usuario) {
        PreparedStatement pst = null;

        try {
            Date fecha = new Date();
            pst = getConexion().prepareStatement(CONSULTA_EDITAR_MENU);

            pst.setString(12, detalle_uid_Menu);
            pst.setString(1, detalle_menu_nombre);
            pst.setString(2, detalle_menu_valor);
            pst.setString(3, detalle_menu_tipo);
            pst.setString(4, detalle_menu_padre);
            pst.setString(5, detalle_menu_href);
            pst.setString(6, detalle_menu_target);
            pst.setString(7, detalle_menu_activo);
            pst.setString(8, detalle_menu_val1);
            pst.setString(9, "Edición de Menú");
            pst.setString(10, usuario);
            pst.setString(11, fecha.toString());

            if (pst.executeUpdate() == 1) {
                System.out.println("Menu editado");
                return true;
            }

        } catch (Exception ex) {
            System.err.println("catch Error: " + ex);
        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception e) {

                System.err.println("finally Error: " + e);
            }

        }
        //System.out.println("ERROR Menu no insertado");
        return false;
    }

    //TEST de actualizarNoticias
  /*
     public static void main(String[] args) {
     Consultas co = new Consultas();
     co.editarMenu("a_prueba","Prueba","Prueba","P","P","P","P","P","P","P","P","P","P");
     System.out.println(":::: edit test menu::::");

     }
     */
    private static String CONSULTA_ELIMINAR_MENU = " delete from menus_d where id = ? ; ";

    public boolean eliminarMenu(String id) {
        PreparedStatement pst = null;

        try {
            pst = getConexion().prepareStatement(CONSULTA_ELIMINAR_MENU);

            pst.setString(1, id);

            if (pst.executeUpdate() == 1) {
                System.out.println("Menu eliminado");
                return true;
            }

        } catch (Exception ex) {
            System.err.println("catch Error: " + ex);
        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception e) {

                System.err.println("finally Error: " + e);
            }

        }
        //System.out.println("ERROR Menu no insertado");
        return false;
    }

    //TEST de actualizarNoticias
  /*
     public static void main(String[] args) {
     Consultas co = new Consultas();
     co.eliminarMenu("a_prueba");
     System.out.println(":::: delete test menu::::");

     }
     */
    /*
     *
     *Paginas
     *
     */
    private static String CONSULTA_ELIMINAR_PAGINA = " delete from paginas_d where id_Pagina = ? ; ";

    public boolean eliminarPagina(String id) {
        PreparedStatement pst = null;

        try {
            pst = getConexion().prepareStatement(CONSULTA_ELIMINAR_PAGINA);

            pst.setString(1, id);
            //System.out.println("pst :::" + pst);
            if (pst.executeUpdate() == 1) {
                System.out.println("Pagina eliminada");
                return true;
            }

        } catch (Exception ex) {
            System.err.println("catch Error: " + ex);
        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception e) {

                System.err.println("finally Error: " + e);
            }

        }
        //System.out.println("ERROR Menu no insertado");
        return false;
    }

    //TEST de actualizarNoticias
  /*
     public static void main(String[] args) {
     Consultas co = new Consultas();
     co.eliminarMenu("pagina_prueba");
     System.out.println(":::: delete test menu::::");

     }
     */
    private static String CONSULTA_PAGINAS_ID = "select * from paginas_d where paginas_d.id_pag_html = ?  and paginas_d.activo='t'; ";

    public Pagina obtPaginasbyIdHtml(String id) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        Pagina m = new Pagina();

        try {
            pst = getConexion().prepareStatement(CONSULTA_PAGINAS_ID);
            pst.setString(1, id);
            rs = pst.executeQuery();

            while (rs.next()) {

                m.setUid_Pagina(rs.getNString("uid_Pagina"));
                m.setId_Pagina(rs.getNString("id_Pagina"));
                m.setNom_pag(rs.getNString("nom_pag"));
                m.setRef_pag(rs.getNString("ref_pag"));
                m.setVal_pag(rs.getNString("val_pag"));
                m.setCont_pag(rs.getNString("cont_pag"));
                m.setTarget(rs.getNString("target"));
                m.setActivo(rs.getNString("activo"));
                m.setPath_pag(rs.getNString("path_pag"));
                m.setUrl_pag(rs.getNString("url_pag"));
                m.setId_pag_html(rs.getNString("id_pag_html"));
                m.setPagina_desc(rs.getNString("pagina_desc"));
                m.setVal1_pag(rs.getNString("val1_pag"));
                m.setVal2_pag(rs.getNString("val2_pag"));
                m.setVal3_pag(rs.getNString("val3_pag"));
                m.setVal4_pag(rs.getNString("val4_pag"));
                m.setVal5_pag(rs.getNString("val5_pag"));

            }
        } catch (Exception e) {
            System.err.println("catch Error: " + e);
        }

        return m;
    }

    //TEST de pagina_menu
    /*
     public static void main(String[] args) {
     Consultas co = new Consultas();
     System.out.println(co.obtPaginas_Menu("antecedentes"));
     }
     */
    private static String CONSULTA_OBTENER_TODAS_PAGINAS = "SELECT * from paginas_d; ";

    public List<Pagina> obtAllPaginas() {
        List<Pagina> lstPag = new ArrayList<Pagina>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            pst = getConexion().prepareStatement(CONSULTA_OBTENER_TODAS_PAGINAS);

            rs = pst.executeQuery();

            while (rs.next()) {
                Pagina m = new Pagina();

                m.setUid_Pagina(rs.getNString("uid_Pagina"));
                m.setId_Pagina(rs.getNString("id_Pagina"));
                m.setNom_pag(rs.getNString("nom_pag"));
                m.setRef_pag(rs.getNString("ref_pag"));
                m.setVal_pag(rs.getNString("val_pag"));
                m.setCont_pag(rs.getNString("cont_pag"));
                m.setTarget(rs.getNString("target"));
                m.setActivo(rs.getNString("activo"));
                m.setPath_pag(rs.getNString("path_pag"));
                m.setUrl_pag(rs.getNString("url_pag"));
                m.setId_pag_html(rs.getNString("id_pag_html"));
                m.setPagina_desc(rs.getNString("pagina_desc"));
                m.setVal1_pag(rs.getNString("val1_pag"));
                m.setVal2_pag(rs.getNString("val2_pag"));
                m.setVal3_pag(rs.getNString("val3_pag"));
                m.setVal4_pag(rs.getNString("val4_pag"));
                m.setVal5_pag(rs.getNString("val5_pag"));

                lstPag.add(m);
            }
        } catch (Exception e) {
            System.err.println("catch Error: " + e);
        }
        //System.out.println("lstPag.size :: " + lstPag.size());
        return lstPag;
    }
    //TEST de obtenerIdUsuario
    /*
     public static void main(String[] args) {
     Consultas co = new Consultas();
     System.out.println(co.obtAllPáginas());
     }
     */
    private static String CONSULTA_EDITAR_PAGINA = "UPDATE `sadm_web`.`paginas_d` SET  `nom_pag`=?, `ref_pag`=?, `val_pag`=?, `cont_pag`=?, `target`=?, `activo`=?, `path_pag`=?, `url_pag`=?, `id_pag_html`=?, `pagina_desc`=?, `val1_pag`=?, `val2_pag`=?, `val3_pag`=?, `val4_pag`=?, `val5_pag`=? WHERE (`id_Pagina`=?);";

    public boolean editarPagina(String id_Pagina, String nom_pag, String ref_pag, String val_pag, String cont_pag, String target, String activo, String path_pag, String url_pag, String id_pag_html, String pagina_desc, String val1_pag, String user_modif) {
        PreparedStatement pst = null;

        try {
            UUID uid = UUID.randomUUID();
            Date fecha = new Date();
            pst = getConexion().prepareStatement(CONSULTA_EDITAR_PAGINA);

            pst.setString(1, nom_pag);
            pst.setString(2, ref_pag);
            pst.setString(3, val_pag);
            pst.setString(4, cont_pag);
            pst.setString(5, target);
            pst.setString(6, activo);
            pst.setString(7, path_pag);
            pst.setString(8, url_pag);
            pst.setString(9, id_pag_html);
            pst.setString(10, pagina_desc);
            pst.setString(11, val1_pag);
            pst.setString(12, "val2");
            pst.setString(13, "val3");
            pst.setString(14, user_modif);
            pst.setString(15, fecha.toString());
            pst.setString(16, id_Pagina);

            if (pst.executeUpdate() == 1) {
                System.out.println("Pagina Actualizada");
                return true;
            }

        } catch (Exception ex) {
            System.err.println("catch Error: " + ex);
        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception e) {

                System.err.println("finally Error: " + e);
            }

        }
        //System.out.println("ERROR Menu no insertado");
        return false;
    }

    //TEST de actualizarNoticias
  /*
     public static void main(String[] args) {
     Consultas co = new Consultas();
     co.editarPagina("pagina_prueba","Pruebassssssssssssss","href","valor","cont","target","t","99","url","menu_prueba","descr","val1","userTest");
     System.out.println(":::: update test pagina::::");

     }
     */
    /*INSERTAR PAGINA*/
    private static String CONSULTA_INSERTAR_PAGINA = "INSERT INTO `sadm_web`.`paginas_d` (`uid_Pagina`, `id_Pagina`, `nom_pag`, `ref_pag`, `val_pag`, `cont_pag`, `target`, `activo`, `path_pag`, `url_pag`, `id_pag_html`, `pagina_desc`, `val1_pag`, `val2_pag`, `val3_pag`, `val4_pag`, `val5_pag`) \n"
            + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?,?, ? ,?, ?,?, ?, ?,?);";

    public boolean insertarPagina(String id_Pagina, String nom_pag, String ref_pag, String val_pag, String cont_pag, String target, String activo, String path_pag, String url_pag, String id_pag_html, String pagina_desc, String val1_pag, String val2_pag, String val3_pag, String user_modif) {
        PreparedStatement pst = null;

        try {
            UUID uid = UUID.randomUUID();
            Date fecha = new Date();
            pst = getConexion().prepareStatement(CONSULTA_INSERTAR_PAGINA);

            pst.setString(1, uid.toString());
            pst.setString(2, id_Pagina);
            pst.setString(3, nom_pag);
            pst.setString(4, ref_pag);
            pst.setString(5, val_pag);
            pst.setString(6, cont_pag);
            pst.setString(7, target);
            pst.setString(8, activo);
            pst.setString(9, path_pag);
            pst.setString(10, url_pag);
            pst.setString(11, id_pag_html);
            pst.setString(12, pagina_desc);
            pst.setString(13, val1_pag);
            pst.setString(14, val2_pag);
            pst.setString(15, val3_pag);
            pst.setString(16, user_modif);
            pst.setString(17, fecha.toString());
            System.out.println("pst :::" + pst);
            if (pst.executeUpdate() == 1) {
                System.out.println("Pagina insertada");
                return true;
            }

        } catch (Exception ex) {
            System.err.println("catch Error: " + ex);
        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception e) {

                System.err.println("finally Error: " + e);
            }

        }
        //System.out.println("ERROR Menu no insertado");
        return false;
    }

    //TEST de actualizarNoticias
  /*
     public static void main(String[] args) {
     Consultas co = new Consultas();
     co.insertarPagina("prueba","Prueba","Prueba","P","P","P","P","P","P","P","P","P","P");
     System.out.println(":::: insert test pagina::::");

     }
     */
    private static String CONSULTA_OBTENER_PAGINA = "SELECT * from paginas_d where id_pag_html = ? ; ";

    public Pagina obtPagina(String id_pag_html) {
        Pagina m = new Pagina();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            pst = getConexion().prepareStatement(CONSULTA_OBTENER_PAGINA);
            pst.setString(1, id_pag_html);
            rs = pst.executeQuery();

            while (rs.next()) {

                m.setUid_Pagina(rs.getNString("uid_Pagina"));
                m.setId_Pagina(rs.getNString("id_Pagina"));
                m.setNom_pag(rs.getNString("nom_pag"));
                m.setRef_pag(rs.getNString("ref_pag"));
                m.setVal_pag(rs.getNString("val_pag"));
                m.setCont_pag(rs.getNString("cont_pag"));
                m.setPath_pag(rs.getNString("path_pag"));
                m.setUrl_pag(rs.getNString("url_pag"));
                m.setId_pag_html(rs.getNString("id_pag_html"));
                m.setPagina_desc(rs.getNString("pagina_desc"));
                m.setVal1_pag(rs.getNString("val1_pag"));
                m.setVal2_pag(rs.getNString("val2_pag"));
                m.setVal3_pag(rs.getNString("val3_pag"));
                m.setVal4_pag(rs.getNString("val4_pag"));
                m.setVal5_pag(rs.getNString("val5_pag"));

            }
        } catch (Exception e) {
            System.err.println("catch Error: " + e);
        }
        //System.out.println("lstPag.size :: " + m.getNom_pag());
        return m;
    }
    //TEST de obtenerIdUsuario
    /*
     public static void main(String[] args) {
     Consultas co = new Consultas();
     Pagina p = co.obtPagina("prueba");
     System.out.println("nombre :: "+p.getNom_pag());
     }
     */

    /*
     *
     *Noticias
     *
     */
    private static String CONSULTA_OBTENER_TODAS_NOTICIAS = "SELECT * from noticias_d order  by noticia_fecha desc; ";

    public List<Noticia> obtAllNoticias() {
        List<Noticia> lstNot = new ArrayList<Noticia>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            pst = getConexion().prepareStatement(CONSULTA_OBTENER_TODAS_NOTICIAS);

            rs = pst.executeQuery();

            while (rs.next()) {
                Noticia n = new Noticia();

                n.setUid_Noticia(rs.getNString("uid_Noticia"));
                n.setId_Noticia(rs.getNString("id_Noticia"));
                n.setH3_img_noticia(rs.getNString("h3_img_noticia"));
                n.setTitle_notice_noticia(rs.getNString("title_notice_noticia"));
                n.setEncab_notice(rs.getNString("encab_notice"));
                n.setCont_notice(rs.getNString("cont_notice"));
                n.setNoticia_fecha(rs.getNString("noticia_fecha"));
                n.setFechamodif(rs.getNString("fechamodif"));
                n.setUsuariomodif(rs.getNString("usuariomodif"));
                n.setComents(rs.getNString("coments"));
                n.setVal1(rs.getNString("val1"));
                n.setVal2(rs.getNString("val2"));
                n.setVal3(rs.getNString("val3"));
                n.setActivo(rs.getNString("activo"));

                lstNot.add(n);
            }
        } catch (Exception e) {
            System.err.println("catch Error: " + e);
        }
        //System.out.println("lstNot.size :: " + lstNot.size());
        return lstNot;
    }
    //TEST de obtAllNoticias
   /*
     public static void main(String[] args) {
     Consultas co = new Consultas();
     System.out.println(co.obtAllNoticias());
     }
     */
    private static String CONSULTA_INSERTAR_NOTICIA = "INSERT INTO `sadm_web`.`noticias_d` (`uid_Noticia`, `id_Noticia`, `h3_img_noticia`, `title_notice_noticia`, `encab_notice`, `cont_notice`, `noticia_fecha`, `fechamodif`, `usuariomodif`, `coments`, `val1`, `val2`, `val3`, `activo`) \n"
            + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?);";

    public boolean insertarNoticia(String agregar_id_not, String in_urlimagenmini, String agregar_tit_not, String agregar_encab_not, String ag_con_pag, String agregar_fech_not, String agregar_activo_not, String user_modif) {
        PreparedStatement pst = null;

        try {

            UUID uid = UUID.randomUUID();
            Date fecha = new Date();
            pst = getConexion().prepareStatement(CONSULTA_INSERTAR_NOTICIA);

            pst.setString(1, uid.toString());
            pst.setString(2, agregar_id_not);
            pst.setString(3, in_urlimagenmini);
            pst.setString(4, agregar_tit_not);
            pst.setString(5, agregar_encab_not);
            pst.setString(6, ag_con_pag);
            pst.setString(7, agregar_fech_not);
            pst.setString(8, fecha.toString());
            pst.setString(9, user_modif);
            pst.setString(10, "");
            pst.setString(11, "/SADM/Noticia.jsp?id_html=" + agregar_id_not);
            pst.setString(12, "");
            pst.setString(13, "");
            pst.setString(14, agregar_activo_not);

            if (pst.executeUpdate() == 1) {
                System.out.println("Noticia insertada");
                return true;
            }

        } catch (Exception ex) {
            System.err.println("catch Error: " + ex);
        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception e) {

                System.err.println("finally Error: " + e);
            }

        }
        //System.out.println("ERROR Menu no insertado");
        return false;
    }
    /*
     //TEST de insertarNoticia
  
     public static void main(String[] args) {
     Consultas co = new Consultas();
     co.insertarNoticia("ID", "IMG", "TIT", "ENC", "CONT", "FECHA", "T", "GARULO");
     System.out.println(":::: insert test noticia::::");

     }
     */
    private static String CONSULTA_ELIMINAR_NOTICIA = " delete from noticias_d where uid_Noticia = ? ; ";

    public boolean eliminarNoticia(String uid) {
        PreparedStatement pst = null;

        try {

            pst = getConexion().prepareStatement(CONSULTA_ELIMINAR_NOTICIA);

            pst.setString(1, uid);

            if (pst.executeUpdate() == 1) {
                System.out.println("Noticia eliminada");
                return true;
            }

        } catch (Exception ex) {
            System.err.println("catch Error: " + ex);
        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception e) {

                System.err.println("finally Error: " + e);
            }

        }
        //System.out.println("ERROR Menu no insertado");
        return false;
    }

    //TEST de eliminarNoticia
  /*
     public static void main(String[] args) {
     Consultas co = new Consultas();
     co.eliminarNoticia("b31d3d27-5f52-4925-bfd6-218e4ff53460");
     System.out.println(":::: delete test Noticia::::");

     }  
     */
    private static String CONSULTA_EDITAR_NOTICIA = "UPDATE `sadm_web`.`noticias_d` SET  `id_Noticia`=?, `h3_img_noticia`=?, `title_notice_noticia`=?, `encab_notice`=?, `cont_notice`=?, `noticia_fecha`=?, `fechamodif`=?, `usuariomodif`=?, `coments`=?, `val1`=?, `val2`=?, `val3`=?, `activo`=? WHERE (`uid_Noticia`=?);";

    public boolean editarNoticia(String uid, String id_not, String urlimagen, String tit_not, String encab_not, String con_pag, String fech_not, String activo_not, String user_modif) {
        PreparedStatement pst = null;

        try {
            Date fecha = new Date();
            pst = getConexion().prepareStatement(CONSULTA_EDITAR_NOTICIA);

            pst.setString(14, uid);
            pst.setString(1, id_not);
            pst.setString(2, urlimagen);
            pst.setString(3, tit_not);
            pst.setString(4, encab_not);
            pst.setString(5, con_pag);
            pst.setString(6, fech_not);
            pst.setString(7, fecha.toString());
            pst.setString(8, user_modif);
            pst.setString(9, "");
            pst.setString(10, "/SADM/Noticia.jsp?id_html=" + id_not);
            pst.setString(11, "");
            pst.setString(12, "");
            pst.setString(13, activo_not);

            if (pst.executeUpdate() == 1) {
                System.out.println("Noticia actualizada");
                return true;
            }

        } catch (Exception ex) {
            System.err.println("catch Error: " + ex);
        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception e) {

                System.err.println("finally Error: " + e);
            }

        }
        //System.out.println("ERROR Menu no insertado");
        return false;
    }

    //TEST de editarNoticia
  /*
     public static void main(String[] args) {
     Consultas co = new Consultas();
     co.editarNoticia("Prueba4","ID", "IMG", "TIT", "ENC", "CONT", "FECHA", "T", "GARULO");
     System.out.println(":::: edit test editarNoticia::::");

     }
     */
    private static String CONSULTA_OBTENER_NOTICIAS_ACTIVAS = "SELECT * from noticias_d where activo ='t' order by noticia_fecha desc; ";

    public List<Noticia> obtenerNoticiasActivas() {
        List<Noticia> lstNot = new ArrayList<Noticia>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            pst = getConexion().prepareStatement(CONSULTA_OBTENER_NOTICIAS_ACTIVAS);

            rs = pst.executeQuery();

            while (rs.next()) {
                Noticia n = new Noticia();

                n.setUid_Noticia(rs.getNString("uid_Noticia"));
                n.setId_Noticia(rs.getNString("id_Noticia"));
                n.setH3_img_noticia(rs.getNString("h3_img_noticia"));
                n.setTitle_notice_noticia(rs.getNString("title_notice_noticia"));
                n.setEncab_notice(rs.getNString("encab_notice"));
                n.setCont_notice(rs.getNString("cont_notice"));
                n.setNoticia_fecha(rs.getNString("noticia_fecha"));
                n.setFechamodif(rs.getNString("fechamodif"));
                n.setUsuariomodif(rs.getNString("usuariomodif"));
                n.setComents(rs.getNString("coments"));
                n.setVal1(rs.getNString("val1"));
                n.setVal2(rs.getNString("val2"));
                n.setVal3(rs.getNString("val3"));
                n.setActivo(rs.getNString("activo"));

                lstNot.add(n);
            }
        } catch (Exception e) {
            System.err.println("catch Error: " + e);
        }
        //System.out.println("lstNot.size :: " + lstNot.size());
        return lstNot;
    }
    //TEST de obtenerNoticiasActivas
   /*
     public static void main(String[] args) {
     Consultas co = new Consultas();
     System.out.println(co.obtenerNoticiasActivas());
     }
     */
    private static String CONSULTA_OBTENER_NOTICIAS_ID = "SELECT * from noticias_d where activo ='t' and id_Noticia=?;";

    public Noticia obtNoticiabyId(String id) {
        Noticia not = new Noticia();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            pst = getConexion().prepareStatement(CONSULTA_OBTENER_NOTICIAS_ID);

            pst.setString(1, id);

            rs = pst.executeQuery();

            while (rs.next()) {

                not.setUid_Noticia(rs.getNString("uid_Noticia"));
                not.setId_Noticia(rs.getNString("id_Noticia"));
                not.setH3_img_noticia(rs.getNString("h3_img_noticia"));
                not.setTitle_notice_noticia(rs.getNString("title_notice_noticia"));
                not.setEncab_notice(rs.getNString("encab_notice"));
                not.setCont_notice(rs.getNString("cont_notice"));
                not.setNoticia_fecha(rs.getNString("noticia_fecha"));
                not.setFechamodif(rs.getNString("fechamodif"));
                not.setUsuariomodif(rs.getNString("usuariomodif"));
                not.setComents(rs.getNString("coments"));
                not.setVal1(rs.getNString("val1"));
                not.setVal2(rs.getNString("val2"));
                not.setVal3(rs.getNString("val3"));
                not.setActivo(rs.getNString("activo"));

            }
        } catch (Exception e) {
            System.err.println("catch Error: " + e);
        }
        // System.out.println("lstNot.size :: " + not.getId_Noticia());
        return not;
    }
    //TEST de obtenerNoticiasActivas
   /*
     public static void main(String[] args) {
     Consultas co = new Consultas();
     System.out.println(co.obtNoticiabyId("megaproyecto"));
     }
     */

//    public List<Busqueda> BusquedaGeneral(String search) {
//        List<Busqueda> lstBus = new ArrayList<Busqueda>();
//        PreparedStatement pst = null;
//        ResultSet rs = null;
//        try {
//            String consulta = "select nom_pag as nombre, id_pag_html as url, cont_pag as cont from paginas_d where cont_pag LIKE('%" + search + "%');";
//
//            pst = getConexion().prepareStatement(consulta);
//
//            rs = pst.executeQuery();
//
//            while (rs.next()) {
//                Busqueda bus = new Busqueda();
//                bus.setNombrePag(rs.getNString("nombre"));
//                bus.setUrlPag(rs.getNString("url"));
//                bus.setContPag(rs.getNString("cont"));
//                String contFilter = new String();
//                // TODO code application logic here
//
//                contFilter = bus.getContPag();
//                // Texto que vamos a buscar
//                String sTextoBuscado = search;
//                // Contador de ocurrencias 
//                int contador = 0;
//
//                while (contFilter.indexOf(sTextoBuscado) > -1) {
//                    contFilter = contFilter.substring(contFilter.indexOf(
//                            sTextoBuscado) + sTextoBuscado.length(), contFilter.indexOf(
//                                    sTextoBuscado) - sTextoBuscado.length() + 200);
//                    contador++;
//                }
//
//                contFilter = contFilter.replace("=", " ");
//                contFilter = contFilter.replace("<", " ");
//                contFilter = contFilter.replace(">", " ");
//                contFilter = contFilter.replace("/", " ");
//                bus.setContPag(" " + contFilter.replace("\"", " ") + "...");
//
//                lstBus.add(bus);
//            }
//        } catch (Exception e) {
//            System.err.println("catch Error: " + e);
//        }
//        System.out.println("lstBusc.size :: " + lstBus.size());
//
//        return lstBus;
//    }
    //TEST de BusquedaGeneral
/*
     public static void main(String[] args) {
     Consultas co = new Consultas();
     List<Busqueda> lstBus = co.BusquedaGeneral("agua");
        
     for (Busqueda b : lstBus) {
     System.out.println("PagNombre :: " + b.getNombrePag());
     System.out.println("PagURL :: " + b.getUrlPag());
     System.out.println("PagCont :: " + b.getContPag());
     }
     }
     */

    /*
     *
     *Configuraciones.
     *
     */
    /**/
    private static String CONSULTA_SELECT_URL_FILES_CONFIG = "select urlfiles from configuraciones;";

    public String slctUrlFilesConfig() {

        PreparedStatement pst = null;
        ResultSet rs = null;
        String url = new String();
        try {

            pst = getConexion().prepareStatement(CONSULTA_SELECT_URL_FILES_CONFIG);

            rs = pst.executeQuery();

            while (rs.next()) {
                url = new String();
                url = rs.getNString("urlfiles");

            }
        } catch (Exception e) {
            System.err.println("catch Error: " + e);
        }
        // System.out.println("lstNot.size :: " + not.getId_Noticia());
        return url;
    }
    //TEST de obtenerNoticiasActivas
   /*
     public static void main(String[] args) {
     Consultas co = new Consultas();
     System.out.println(co.obtNoticiabyId("megaproyecto"));
     }
     */

    /*
     *
     *CONFIGURACION
     *
     */
    /* OBTENER CONFIG*/
    private static String CONSULTA_OBTENER_CONFIG = "select * from configuraciones;";

    public Config obtenerConfig() {

        PreparedStatement pst = null;
        ResultSet rs = null;
        Config config = new Config();
        try {
            pst = getConexion().prepareStatement(CONSULTA_OBTENER_CONFIG);

            rs = pst.executeQuery();
            //System.out.println("pst ::: " + pst);
            while (rs.next()) {
                config = new Config();
                config.setId(rs.getNString("idPortal"));
                config.setUrlUploaded_Files(rs.getNString("urlfiles"));
                config.setCopyRigth(rs.getNString("copyright"));

            }
        } catch (Exception e) {
            System.err.println("catch Error: " + e);
        }
        // System.out.println("lstNot.size :: " + not.getId_Noticia());
        return config;
    }
    //TEST de obtenerConfig
   /*
     public static void main(String[] args) {
     Consultas co = new Consultas();
     System.out.println(co.obtenerConfig());
     }
     */

    /*EDITAR CONFIG*/
    private static String CONSULTA_EDITAR_CONFIG = "UPDATE `sadm_web`.`configuraciones` SET `urlfiles`=?, `copyright`=? WHERE (`idPortal`=?);";

    public boolean editarConfig(String id, String copyrigth, String urlUploaded_Files) {
        PreparedStatement pst = null;

        try {
            Date fecha = new Date();
            pst = getConexion().prepareStatement(CONSULTA_EDITAR_CONFIG);

            pst.setString(1, urlUploaded_Files);
            pst.setString(2, copyrigth);
            pst.setString(3, id);
            //System.out.println("pst ::: " + pst);

            if (pst.executeUpdate() == 1) {
                System.out.println("Noticia actualizada");
                return true;
            }

        } catch (Exception ex) {
            System.err.println("catch Error: " + ex);
        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception e) {

                System.err.println("finally Error: " + e);
            }

        }
        //System.out.println("ERROR Menu no insertado");
        return false;
    }

    //TEST de editarConfig
  /*
     public static void main(String[] args) {
     Consultas co = new Consultas();
     co.editarConfig("Prueba4","ID", "IMG");
     System.out.println(":::: edit test editarConfig::::");

     }
     */
}
