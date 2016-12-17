<%-- 
    Document   : consumo_interno
    Created on : 02/11/2016, 23:30:18
    Author     : luan
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="mysql_bd.Banco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    
    <% Banco b = new Banco(); 
       boolean ok = false;
    %>
    
    <link rel="icon" href="imagens/icon_logo_acapord.jpg" type="image/x-icon" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="José Luan Silva do Nascimento">

    <title>ACAPORD</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
    <link href="css/principal.css" rel="stylesheet">

    <style type="text/css">
        input.btn{
            width: 250px;
            height: 100px;
            font-size: 36pt;
        }
    </style>

</head>

<body>
        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul id="menulateral" class="nav navbar-nav side-nav">
                    <li>
                        <a class="navbar-brand" href="index.jsp">ACAPORD - SISTEMA DE CONTROLE DE ESTOQUE</a>
                    </li>
                    <li>
                        <a href="index.jsp">Início</a>
                    </li>
                    <li>
                        <a href="relatorio.jsp">Relatórios</a>
                    </li>
                    <li>
                        <a href="produtos.jsp">Produtos</a>
                    </li>
                                        <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo">Adicionar <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo" class="collapse">
                            <li>
                                <span><a href="adicionar_produto.jsp"><span>Produto</span></a></span>
                            </li>
                            <li>
                                <span><a href="adicionar_p_est.jsp"><span>Produto ao estoque</span></a></span>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="venda.jsp">venda</a>
                    </li>
                    <li>
                        <a href="consumo_interno.jsp">Consumo interno</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>
        
        <div id="conteudo" style="margin-top: 60px;">
            <div class="col-lg-12">
                <h1 class="page-header">Consumir um produto</h1>
                <ol class="breadcrumb">
                    <li>
                        <i class="fa fa-dashboard"></i>  <a href="index.jsp">Início</a>
                    </li>
                    <li class="active">
                        <i class="fa fa-desktop"></i> Consumir um produto
                    </li>
                </ol>
            </div>
            <center>
                <table id="ci" class="table table-hover table-striped">
                    <thead>
                        <tr>
                            <th>Nome</th>
                            <th>Valor (R$)</th>
                            <th>Qtd. no Estoque</th>
                            <th>Consumir</th>
                         </tr>
                    </thead>
                    <tbody>
                        <%
                            ResultSet produtos = b.selectAllProdutoofEstoque();
                            while(produtos.next()){
                        %>
                    <form method="post" action="consumo_interno_confirmar.jsp">
                       
                        <tr>
                            <td><%=produtos.getString("nome")%></td>
                            <td><%=produtos.getString("valor")%></td>
                            <td><%=produtos.getString("quantidade")%></td>
                            <td>
                                <% 
                                    if(produtos.getString("quantidade") == "" || produtos.getString("quantidade") == "0" || produtos.getString("quantidade") == null || Integer.parseInt(produtos.getString("quantidade")) <= 0){
                                %>
                                        
                                    <input type="submit" class="btn btn-lg btn-success" value="Consumir" disabled>
                                                                                
                                <% } else{ %>
                                        
                                    <input type="submit" class="btn btn-lg btn-success" value="Consumir">
                                    <input name="idproduto" type="hidden" value="<%=produtos.getString("id")%>">
                                        
                                <% } %>
                            </td>
                        </tr>
                            
                    </form>
                        <% 
                            }
                        %>
                    </tbody>
                </table>
                </center>
        </div>    

</body>

</html>