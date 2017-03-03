<%-- 
    Document   : relatorio_anual_final
    Created on : 30/10/2016, 21:58:57
    Author     : luan
--%>

<%@page import="mysql_bd.Banco"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <% Banco b = new Banco(); %>
        
        <link rel="icon" href="imagens/icon_logo_acapord.jpg" type="image/x-icon" />
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Relatório de vendas e compras anual da ACAPORD">
        <meta name="author" content="José Luan Silva do Nascimento">

        <title>ACAPORD</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">    

</head>
<body>
    <%
        if (session.getAttribute("login") != null) {
    %>
    <center>
        <div id="page-wrapper">
            <div class="container-fluid">
                
                <div class="row">
                    <img style="margin-top: 25px;" src="imagens/logo_acapord.jpg"/>
                    <h1> Associação Camarense de apoio aos portadores de deficiência</h1>
                    <b><h2>Relatório de venda do ano de <%=request.getParameter("ano")%></h2></b>
                    <table class="table" style="width: 90%;">
                        <thead>
                            <tr>
                                <th><h3>Nome</h3></th>
                                <th><h3>Valor</h3></th>
                                <th><h3>Quantidade</h3></th>
                                <th><h3>Total</h3></th>
                                <th><h3>Entrada/Saída</h3></th>
                                <th><h3>Data</h3></th>
                            </tr>
                        </thead>
                        <tbody>
                       
                            <%
                                double saldo = 0;
                                double venda = 0;
                                double despesa = 0;
                                ResultSet vendaano = b.selectVendaAno(request.getParameter("ano"));
                                while(vendaano.next()){
                            %>
                                    <tr>
                                        <td><h3><%=vendaano.getString("nome")%></h3></td>
                                        <td><h3>R$<%=vendaano.getString("valorP")%></h3></td>
                                        <td><h3><%=vendaano.getString("quantidade")%></h3></td>
                                        <td><h3><%=vendaano.getString("total")%></h3></td>
                                        <td>
                                            <% if (vendaano.getString("doacao").contains("1") || vendaano.getString("isvenda").contains("0")) { 
                                                    despesa += Double.parseDouble(vendaano.getString("total"));
                                            %>
                                                <img src="imagens/saida.png">
                                            <% }else{
                                                    venda += Double.parseDouble(vendaano.getString("total"));
                                            %>
                                                <img src="imagens/entrada.png">
                                            <% } %>
                                        </td>
                                        <td><h3><%=vendaano.getString("data")%></h3></td>
                                    </tr>   
                            <% 
                                }
                                saldo = venda-despesa;
                                vendaano.close();
                            %>
                        </tbody>
                    </table>
                    <br/>
                    <div style="float: left;text-align: justify; margin: 15px;font-size: 20pt;margin-left: 5%;">
                        <p> 
                            Valor das vendas: R$ <%=venda%><br/>  
                            Valor das despesas: R$ <%=despesa%><br/>  
                            Saldo total: R$ <%=saldo%>
                        </p>
                    </div>
                </div>
            </div> 
        </div>
    </center>
    <% b.closeAll(); }else{ response.sendRedirect("login.jsp"); } %>
</body>
</html>
