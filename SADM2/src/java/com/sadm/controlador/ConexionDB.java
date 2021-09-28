package com.sadm.controlador;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionDB {
    
private static String USERNAME ="root";
private static String PASSWORD = "admin";
private static String HOST = "localhost";
private static String PORT = "3306";
private static String DATABASE = "sadm_web";
private static String CLASSNAMEDRIVER = "com.mysql.jdbc.Driver";
private static String URL="jdbc:mysql://"+HOST+":"+PORT+"/"+DATABASE;
private Connection con;

public ConexionDB(){

    try{
    Class.forName(CLASSNAMEDRIVER);
    con = (Connection) DriverManager.getConnection(URL,USERNAME,PASSWORD);
    
    }catch (ClassNotFoundException e ){
        System.err.println("ERROR: "+e);
          System.out.println("**** Conexión a DB No Exitosa *****");
    }catch (SQLException e ){
        System.out.println("ERROR: "+e);
          System.out.println("**** Conexión a DB No Exitosa *****");
    }

}

public Connection getConexion(){
return con;
}

    public static void main(String[] args) {
        ConexionDB conn = new ConexionDB();
      
    }
}
