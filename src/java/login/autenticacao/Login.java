/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package login.autenticacao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import mysql_bd.Banco;

/**
 *
 * @author Luan
 */
public class Login {
    private static Statement stmt;
    private static Statement stmt2;
    private ResultSet rs;
    public Connection conn;
    private static final Banco b = new Banco();
    public Login(){
        String url = "jdbc:mysql://localhost:3306/acapord";
        String usr = "root";
        String pas = "adminadmin";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, usr, pas);
            stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, 
                                        ResultSet.CONCUR_READ_ONLY);
            stmt2 = conn.createStatement();
            System.out.println("Tudo ok, conexão feita!");
            
            
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Erro: "+e.getMessage());
        }
        
    }
    public String efetuarLogin(String login2,String senha2) throws SQLException{
        String sql = "select * from administrador  where login = '"+login2+"' and senha = '"+senha2+"'";
        ResultSet log = stmt.executeQuery(sql);
        while(log.next()){
            if (log.getString("login") != null || !"".equals(log.getString("login")) || log.getString("senha") != null) {
                return "1";
            }
        }
        stmt.close();
        return "0";
    }
    public String getSenha(String login) throws SQLException{
        String sql = "select senha from administrador where login = '"+login+"'";
        ResultSet rs = stmt.executeQuery(sql);
        String senha = "";
        while(rs.next()){
            senha = rs.getString("senha");
        }
        return senha;
    }
    public String getNivel(String login) throws SQLException{
        String sql = "select nivel from administrador where login = '"+login+"'";
        ResultSet rs = stmt.executeQuery(sql);
        String nivel = "";
        while(rs.next()){
            nivel = rs.getString("nivel");
        }
        return nivel;
    }
    public boolean existUser(String login) throws SQLException{
        String sql = "select nivel from administrador where login = '"+login+"'";
        ResultSet rs = stmt.executeQuery(sql);
        while(rs.next()){
            return true;
        }
        return false;
    }
}
