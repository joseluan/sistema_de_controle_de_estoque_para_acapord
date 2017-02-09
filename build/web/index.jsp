<%-- 
    Document   : adicionar_produto
    Created on : 05/10/2016, 20:07:56
    Author     : luan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>  
<%@page import="mysql_bd.Banco"%>
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
    <meta name="description" content="Pagina principal do sistema">
    <meta name="author" content="José Luan Silva do Nascimento">

    <title>ACAPORD</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery/mudarcor.js"></script>
    
    <link href="css/principal.css" rel="stylesheet">
</head>

<body>
    <%
        if (session.getAttribute("login") != null) {
    %>
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
            <div class="collapse navbar-collapse navbar-ex1-collapse" id="barra">
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
            <!-- /.navbar-collapse -->
        </nav>
        
        <div id="conteudo" style="margin-top: 60px;">
            
            <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            <img src="imagens/logo_acapord.jpg" alt="Logo principal da ACAPORD" title="Logo principal da ACAPORD">
                            Sistema de controle de estoque e produção
                        </h1>
                    </div>
                </div>
                
                <!-- /.row -->
                <!-- inicio dos atalhos -->
                <div style="padding: 10px;" id="atalhorow" class="row">
                    <a href="relatorio.jsp">
                        <div class="col-lg-3 col-md-6" id="azul" title="Seu saldo é de <%=b.selectSaldoP()-b.selectSaldoN()%>">
                            <div class="panel">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-comments fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="huge"><h2><%=b.selectSaldoP()-b.selectSaldoN()%></h2></div>
                                            <div><h4>Saldo!</h4></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a href="venda.jsp">
                        <div class="col-lg-3 col-md-6" id="verde" title="Foram feitas <%=b.selectqtdVenda()%> vendas">
                            <div class="panel">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-tasks fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="huge"><h2><%=b.selectqtdVenda()%></h2></div>
                                            <div><h4>vendas Feitas!</h4></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a href="produtos.jsp">
                        <div class="col-lg-3 col-md-6" id="amarelo" title="<%=b.selectqtdProdutosofEstoque()%> produtos no estoque">
                            <div class="panel">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-shopping-cart fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="huge"><h2><%=b.selectqtdProdutosofEstoque()%></h2></div>
                                            <div><h5>Produtos no estoque!</h5></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a href="adicionar_produto.jsp">
                        <div class="col-lg-3 col-md-6" id="vermelho" title="<%=b.selectqtdProdutos()%> produtos registrados">
                            <div class="panel">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-support fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="huge"><h2><%=b.selectqtdProdutos()%></h2></div>
                                            <div><h5>Produtos Cadastrados!</h5></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <!-- fim dos atalhos -->
                <div id="conteudo" >
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3>Sobre</h3>
                            </div>
                            <div id="body" class="panel-body">
                                    <p> 
                                       <h3>
                                           O Sistema de Controle de Estoque e de Produção para a ACAPORD, 
                                           é uma ferramenta para auxiliar o controle de mercadorias que são
                                           produzidas e vendidas na associação, tem como recursos cadastrar um
                                           produto final produzido, adiciona-lo ao estoque, fazer uma venda e um consumo
                                           interno do mesmo, esses dados são registrados em um banco de dados MySQL, 
                                           com o banco de dados são gerados relatórios de venda mensal, semestral e anual.
                                        </h3>
                                    </p>  
                            </div>
                        </div>
                </div>    
                <!-- /.row -->
        </div>  
    <% b.conn.close(); }else{ response.sendRedirect("login.jsp"); } %>
</body>
</html>