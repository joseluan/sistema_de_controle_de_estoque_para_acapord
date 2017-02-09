<%-- 
    Document   : adicionar_produto
    Created on : 05/10/2016, 20:07:56
    Author     : luan
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="mysql_bd.Banco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    
    <% 
        String reqano = request.getParameter("ano");
        Banco b = new Banco(); 
        boolean ok = false;
    %>
    
    <link rel="icon" href="imagens/icon_logo_acapord.jpg" type="image/x-icon" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Adicionando um produto ao sistema">
    <meta name="author" content="José Luan Silva do Nascimento">
    
    <title>ACAPORD</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
    <link href="css/principal.css" rel="stylesheet">
    <style type="text/css">
        p{
            text-indent: 40px;
            font-size: 14pt;
            text-align: justify;
        }
        ul{
            list-style:none;
        }
        ul li{
            display: inline-block;
        }
        ul#mes li input.btn{
            width: 175px;
            height: 70px;
            font-size: 25pt;
        }
        input.btn{
            width: 220px;
            height: 100px;
            font-size: 36pt;
        }
        input#semestre{
            width: 320px;
        }
    </style>
</head>
<body>
    <%
        if (session.getAttribute("login") != null) {
    %>
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
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
                            <% if(session.getAttribute("nivel").toString().equals("1")){ %>
                                <li>
                                    <span><a href="cadastrar_admin.jsp"><span>Administrador</span></a></span>
                                </li>
                            <% } %>
                        </ul>
                    </li>
                    <li>
                        <a href="venda.jsp">Venda</a>
                    </li>
                    <li>
                        <a href="consumo_interno.jsp">Consumo interno</a>
                    </li>
                    <li>
                        <form action="login.jsp" method="post">
                            <input style="width: 80px;height: 50px; font-size: 16pt;" type="submit" class="btn btn-xs btn-danger" value="sair">
                            <input type="hidden" value="sair" name="sair">
                        </form>
                    </li>
                </ul>
            </div>

        </nav>
        
        <div id="conteudo" style="margin-top: 60px;">
            <% 
                        if (request.getParameter("valor") != null) {
                                String nome = request.getParameter("nome");
                                String valor = request.getParameter("valor");
                                String venda = request.getParameter("isvenda");
                                try{
                                    b.addProduto(nome, valor, venda);
                                    ok = true;
                                }catch(Exception qsle){
                                    ok = false;
                                }
                                
                        }
                        
                        if (ok == true) {
                    %>
                        <div class="alert alert-success">
                            <h2>
                                <h3>Sucesso!</h3> Produto salvo com sucesso.
                            </h2>
                        </div>
                    <%  }  %>
                    
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Adicionar produto
                            <small>ao sistema</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="index.jsp">Início</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-desktop"></i> Adicionar um produto
                            </li>
                        </ol>
                    </div>
                         <center>
                        <form action="adicionar_produto.jsp" method="POST">
                            
                            <div class="form-group">
                                <label>Nome</label>
                                <input style="width: 45%;" type="text" name="nome" class="form-control" placeholder="Digite o nome do seu produto aqui">
                            </div>
                            <div class="form-group">
                                <label>valor</label>
                                <input style="width: 45%;" min="0" name="valor" class="form-control" placeholder="Insira o valor do seu produto">
                            </div>
                            <br/>
                            <div class="form-group">
                                <label>É para a venda?</label>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="isvenda" id="options1" value="0" checked>Sim
                                    </label>
                                    <label>
                                        <input type="radio" name="isvenda" id="options2" value="1">Não
                                    </label>
                                </div>
                            </div>
                            <input id="semestre" type="submit" class="btn btn-lg btn-success" value="Salvar"> 
                            <br/>
                        </form>
                    </center>
        </div>    
    <% b.conn.close(); }else{ response.sendRedirect("login.jsp"); } %>
</body>
</html>