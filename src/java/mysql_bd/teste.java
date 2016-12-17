/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mysql_bd;
import java.sql.SQLException;
import java.util.ArrayList;
import login.autenticacao.Login;

/**
 *
 * @author luan
 */
public class teste {
    public static void main(String[] args) throws SQLException {
       Login lg = new Login();
        System.out.println("teste "+lg.efetuarLogin("ert", "admin"));
        
    }
}