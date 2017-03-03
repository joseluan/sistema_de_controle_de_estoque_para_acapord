/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mysql_bd;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;

/**
 *
 * @author luan
 */
public class Banco {
    private static Statement stmt;
    private static Statement stmt2;
    private ResultSet rs;
    public Connection conn;
    private static final Banco b = new Banco();
    public Banco(){
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
    public void closeAll() throws SQLException{
        stmt.close();
        stmt2.close();
        conn.close();
    }
    
    /*adicionando registro*/
    public void addProduto(String nome, String valor, String venda) throws SQLException{
        String sql = "insert into produto " +
                " (nome,valor,venda) " +
                " values (?,?,?)";
        try (PreparedStatement stmtlocal = conn.prepareStatement(sql)) {
            stmtlocal.setString(1, nome);
            stmtlocal.setString(2, valor);
            stmtlocal.setString(3, venda);
            
            stmtlocal.execute();
            stmtlocal.close();
        }
    }
    public void addVenda(String id, String quantidade, String quantidadeest,String valorP, String doacao,String isvenda) throws SQLException{
        if(Integer.parseInt(quantidade) <= Integer.parseInt(quantidadeest)){
            Calendar c = Calendar.getInstance();
            if (produtoExisteVenda(id)) {
                //venda
                String sql = "insert into venda (id_p_cp,quantidade,valorP,data,doacao,isvenda) "
                           + " values (?,?,?,?,?,?)";
                
                String data = c.get(Calendar.YEAR)+"-"+(c.get(Calendar.MONTH)+1)+"-"+c.get(Calendar.DAY_OF_MONTH);
                
                PreparedStatement stmtlocal = conn.prepareStatement(sql);

                stmtlocal.setString(1, id);
                stmtlocal.setString(2, quantidade);
                stmtlocal.setString(3, valorP);
                stmtlocal.setString(4, data);
                stmtlocal.setString(5, doacao);
                stmtlocal.setString(6, isvenda);

                stmtlocal.execute();
                stmtlocal.close();

                // estoque
                sql = "update estoque "
                    + " set quantidade = quantidade - ?"
                    + " where id_p_est = ?";
                stmtlocal = conn.prepareStatement(sql);
                stmtlocal.setString(1, quantidade);
                stmtlocal.setString(2, id);
                
                stmtlocal.execute();
                stmtlocal.close();
            }else{
                //venda
                String sql = "insert into venda (id_p_cp,quantidade,valorP,data,doacao,isvenda) "
                           + " values (?,?,?,?,?,?)";
                
                String data = c.get(Calendar.YEAR)+"-"+(c.get(Calendar.MONTH)+1)+"-"+c.get(Calendar.DAY_OF_MONTH);
                
                PreparedStatement stmtlocal = conn.prepareStatement(sql);

                stmtlocal.setString(1, id);
                stmtlocal.setString(2, quantidade);
                stmtlocal.setString(3, valorP);
                stmtlocal.setString(4, data);
                stmtlocal.setString(5, doacao);
                stmtlocal.setString(6, isvenda);

                stmtlocal.execute();
                stmtlocal.close();

                // estoque
                sql = "update estoque "
                    + " set quantidade = quantidade - ?"
                    + " where id_p_est = ?";
                stmtlocal = conn.prepareStatement(sql);

                stmtlocal.setString(1, quantidade);
                stmtlocal.setString(2, id);

                stmtlocal.execute();
                stmtlocal.close();
            }
        }
    }
    public void addPEstoque(String id,String quantidade) throws SQLException{
            if (produtoExisteEstoque(id)) {
                ResultSet prodvenda = selectAllProdutoofId(id);
                while(prodvenda.next()){
                    if (prodvenda.getString("venda").equals("1")) {
                        String sql = "update estoque "
                                   + " set quantidade = quantidade + ?"
                                   + " where id_p_est = ?";
                        PreparedStatement stmtlocal = conn.prepareStatement(sql);

                        stmtlocal.setString(1, quantidade);
                        stmtlocal.setString(2, id);

                        stmtlocal.execute();
                        stmtlocal.close();

                        sql = "update entrada "
                            + " set quantidade = quantidade + ?"
                            + " where id_p_ent = ?";
                        stmtlocal = conn.prepareStatement(sql);

                        stmtlocal.setString(1, quantidade);
                        stmtlocal.setString(2, id);

                        stmtlocal.execute();
                        stmtlocal.close();
                    }else if(!prodvenda.getString("venda").equals("1")){
                        String sql = "update estoque "
                                   + " set quantidade = quantidade + ?"
                                   + " where id_p_est = ?";
                        try (PreparedStatement stmtlocal = conn.prepareStatement(sql)) {
                            stmtlocal.setString(1, quantidade);
                            stmtlocal.setString(2, id);
                            
                            stmtlocal.execute();
                            stmtlocal.close();
                        }
                    }
                }
                
            }else{
                ResultSet prodvenda = selectAllProdutoofId(id);
                while(prodvenda.next()){
                    if (prodvenda.getString("venda").equals("1")) {
                        String sql = "insert into estoque (id_p_est,quantidade) values " +
                                       " (?,?)";
                        PreparedStatement stmtlocal = conn.prepareStatement(sql);

                        stmtlocal.setString(1, id);
                        stmtlocal.setString(2, quantidade);

                        stmtlocal.execute();
                        stmtlocal.close();

                        sql = "insert into entrada (id_p_ent,quantidade) values" +
                        "(?,?)";
                        stmtlocal = conn.prepareStatement(sql);

                        stmtlocal.setString(1, id);
                        stmtlocal.setString(2, quantidade);

                        stmtlocal.execute();
                        stmtlocal.close();
                    }else if(!prodvenda.getString("venda").equals("1")){
                        String sql = "insert into estoque (id_p_est,quantidade) values " +
                                       " (?,?)";
                        try (PreparedStatement stmtlocal = conn.prepareStatement(sql)) {
                            stmtlocal.setString(1, id);
                            stmtlocal.setString(2, quantidade);
                            
                            stmtlocal.execute();
                            stmtlocal.close();
                        }
                    }
                }
                
            }
    }
    
    /*Todos os selects*/
    public ResultSet selectAllProduto() throws SQLException{
        String sql = "select * from produto";
        return stmt.executeQuery(sql);
    }
    public ResultSet selectAllProdutoofEstoque() throws SQLException{
        String sql = "select p.id, p.nome, p.valor , est.quantidade from produto p inner join estoque est " +
                     "on (p.id = est.id_p_est)";
        return stmt.executeQuery(sql);
    }
    public ResultSet selectAllProdutoofEstoqueofVenda() throws SQLException{
        String sql = "select p.id, p.nome, p.valor , est.quantidade from produto p inner join estoque est " +
                     "on (p.id = est.id_p_est) "
                   + " where p.venda = 0";
        return stmt.executeQuery(sql);
    }
    public ResultSet selectAllProdutoofEstoqueAll() throws SQLException{
        String sql = "select p.id, p.nome, p.valor , est.quantidade from produto p left outer join estoque est " +
                     "on (p.id = est.id_p_est)";
        return stmt.executeQuery(sql);
    }
    public ResultSet selectProdutoofId(String id) throws SQLException{
        String sql = "select p.id, p.nome, p.valor , est.quantidade from produto p inner join estoque est " +
                     "on (p.id = est.id_p_est)"
                    +"where p.id = "+id;
        return stmt.executeQuery(sql);
    }
    public ResultSet selectAllProdutoofId(String id) throws SQLException{
        String sql = "select * from produto p"
                    +" where p.id = "+id;
        return stmt.executeQuery(sql);
    }
    public int selectqtdProdutos() throws SQLException{
        String sql = "select count(id) qtd from produto";
        try (ResultSet rs2 = stmt.executeQuery(sql)) {
            while(rs2.next()){
                return rs2.getInt("qtd");
            }
            rs2.close();
        }
        return 0;
    }
    public int selectqtdProdutosofEstoque() throws SQLException{
        String sql = "select sum(est.quantidade) soma from produto p inner join estoque est on (p.id = est.id_p_est)";
        try (ResultSet rs2 = stmt.executeQuery(sql)) {
            while(rs2.next()){
                return rs2.getInt("soma");
            }
            rs2.close();
        }
        return 0;
    }
    public float selectSaldoP() throws SQLException{
        float positivo = 0;
        String sql = "select (v.valorP*v.quantidade) saldo, v.doacao, v.isvenda  "
                    + " from produto p inner join venda v on (p.id = v.id_p_cp)";
        try (ResultSet rs2 = stmt.executeQuery(sql)) {
            while(rs2.next()){
                if (rs2.getString("doacao").contains("0") && rs2.getString("isvenda").contains("1")) {
                    positivo += rs2.getFloat("saldo");
                }
            }
            rs2.close();
        }
        return positivo;
    }
    public float selectSaldoN() throws SQLException{
        float negativo = 0;
        String sql = "select (v.valorP*v.quantidade) saldo, v.doacao, v.isvenda  "
                    + " from produto p inner join venda v on (p.id = v.id_p_cp)";
        try (ResultSet rs2 = stmt.executeQuery(sql)) {
            while(rs2.next()){
                if(rs2.getString("doacao").contains("1") || rs2.getString("isvenda").contains("0")){
                    negativo += rs2.getFloat("saldo");
                }
            }
            rs2.close();
        }
        return negativo;
    }
    public int selectqtdVenda() throws SQLException{
        String sql = "select count(id) qtd from venda";
        try (ResultSet rs2 = stmt2.executeQuery(sql)) {
            while(rs2.next()){
                return rs2.getInt("qtd");
            }
            rs2.close();
        }
        return 0;
    }
    public ResultSet selectVendaAno(String ano) throws SQLException{
        String sql = "select p.nome, v.valorP, p.venda, v.quantidade, (v.quantidade*v.valorP) total, v.doacao, DATE_FORMAT(v.data, '%d/%m/%Y') as data, v.isvenda" +
                     " from produto p right outer join venda v on (p.id = v.id_p_cp) "
                   + " where data BETWEEN date('"+ano+"-01-01') and date('"+ano+"-12-31') "
                   + " order by v.data";
        return stmt.executeQuery(sql);
    }
    public ResultSet selectVendadoMes(String ano,String mes) throws SQLException{
        if (mes.contains("12")) {
            String sql = "select p.nome, v.valorP, p.venda, v.quantidade, (v.quantidade*v.valorP) total, v.doacao, DATE_FORMAT(v.data, '%d/%m/%Y') as data, v.isvenda" +
                     " from produto p right outer join venda v on (p.id = v.id_p_cp) "
                   + " where data BETWEEN date('"+ano+"-12-00') and date('"+ano+"-12-31') "
                   + " order by v.data";
            return stmt.executeQuery(sql);
        }else{
            String sql = "select p.nome, v.valorP, p.venda, v.quantidade, (v.quantidade*v.valorP) total, v.doacao, DATE_FORMAT(v.data, '%d/%m/%Y') as data, v.isvenda" +
                     " from produto p right outer join venda v on (p.id = v.id_p_cp) "
                   + " where data BETWEEN date('"+ano+"-"+mes+"-00') and date('"+ano+"-"+(Integer.parseInt(mes)+1)+"-00') "
                   + " order by v.data";
            return stmt.executeQuery(sql);
        }
    }
    public ResultSet selectVendadoSemestre(String ano, String semestre) throws SQLException{
        if (semestre.equals("1")) {
            String sql = "select p.nome, v.valorP, p.venda, v.quantidade, (v.quantidade*v.valorP) total, v.doacao, DATE_FORMAT(v.data, '%d/%m/%Y') as data, v.isvenda" +
                     " from produto p right outer join venda v on (p.id = v.id_p_cp) "
                   + " where data BETWEEN date('"+ano+"-01-01') and date('"+ano+"-06-31') "
                   + " order by v.data";
            return stmt.executeQuery(sql);
        }else if(semestre.equals("2")){
            String sql = "select p.nome, v.valorP, p.venda, v.quantidade, (v.quantidade*v.valorP) total, v.doacao, DATE_FORMAT(v.data, '%d/%m/%Y') as data, v.isvenda" +
                     " from produto p right outer join venda v on (p.id = v.id_p_cp) "
                   + " where data BETWEEN date('"+ano+"-06-01') and date('"+ano+"-12-31') "
                   + " order by v.data";
            return stmt.executeQuery(sql);
        }
        return null;
    }    
    /*Verificadores de registro*/
    public static boolean produtoExisteEstoque(String id) throws SQLException{
        String sql2 = "select * from estoque "
                    + " where id_p_est = "+id;
        try (ResultSet estp = stmt.executeQuery(sql2)) {
            while (estp.next()) {
                if (!"".equals(estp.getString("id_p_est")) || estp.getString("id_p_est") != null) {
                    return true;
                } 
            }
            estp.close();
        }
        return false;
    }
    public static boolean produtoExisteVenda(String id) throws SQLException{
        String sql2 = "select * from venda "
                    + " where id_p_cp = "+id;
        try (ResultSet estp = stmt.executeQuery(sql2)) {
            while (estp.next()) {
                if (!"".equals(estp.getString("id_p_cp")) || estp.getString("id_p_cp") != null) {
                    return true;
                } 
            }
            estp.close();
        }
        return false;
    }
    /*Excluindo Registros*/ 
    public void excluirProduto(String id) throws SQLException{
        //excluir venda
        String sql = "DELETE FROM venda WHERE id_p_cp = ?";
        PreparedStatement stmtlocal = conn.prepareStatement(sql);

        stmtlocal.setString(1, id);
        stmtlocal.execute();
        stmtlocal.close();
        //excluir estoque
        sql = "DELETE FROM estoque WHERE id_p_est = ?";
        stmtlocal = conn.prepareStatement(sql);

        stmtlocal.setString(1, id);
        stmtlocal.execute();
        stmtlocal.close();
        
        //excluir entrada
        sql = "DELETE FROM entrada WHERE id_p_ent = ?";
        stmtlocal = conn.prepareStatement(sql);

        stmtlocal.setString(1, id);
        stmtlocal.execute();
        stmtlocal.close();
        
        //excluir produto
        sql = "DELETE FROM produto WHERE id = ?";
        stmtlocal = conn.prepareStatement(sql);

        stmtlocal.setString(1, id);
        stmtlocal.execute();
        stmtlocal.close();
    }
    /*Todos os Alteradores*/
    public void alterarProduto(String id, String nome, String valor) throws SQLException{
        String sql = "update produto "
                   + " set nome = ?, valor = ? "
                   + " where id = ?";
        try (PreparedStatement stmtlocal = conn.prepareStatement(sql)) {
            stmtlocal.setString(1, nome);
            stmtlocal.setString(2, valor);
            stmtlocal.setString(3, id);
            stmtlocal.execute();
            stmtlocal.close();
        }
    }
    /* Cadastros de usuarios e administradores*/
    public void cadastrarUserAdmin(String login,String senha, String nivel) throws SQLException{
        String sql = "insert into administrador (login,senha,nivel) values " +
                     "(?,?,?);";
        try (PreparedStatement stmtlocal = conn.prepareStatement(sql)) {
            stmtlocal.setString(1, login);
            stmtlocal.setString(2, senha);
            stmtlocal.setString(3, nivel);
            stmtlocal.execute();
            stmtlocal.close();
        }
    }
}