<%-- 
    Document   : consumo_i_confirmar
    Created on : 02/11/2016, 23:43:58
    Author     : luan
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="mysql_bd.Banco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    
    <% Banco b = new Banco(); 
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

    <script type="text/javascript">
        function myFunction() {
            document.getElementById("totalc").value = document.getElementById("quantidade").value*document.getElementById("valor").value;
        }
    </script>
    
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
    </style>
</head>

<body onload="myFunction();">
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
                        <a href="javascript:;" data-toggle="collapse" data-target="#relatorio">Relatórios <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="relatorio" class="collapse">
                            <li>
                                <a href="adicionar_produto.jsp"><span>Mensal</span></a>
                            </li>
                            <li>
                                <a href="adicionar_p_est.jsp"><span>Bimestral</span></a>
                            </li>
                            <li>
                                <a href="adicionar_p_est.jsp"><span>Semestral</span></a>
                            </li>
                            <li>
                                <a href="adicionar_p_est.jsp"><span>Anual</span></a>
                            </li>
                        </ul>
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
                        <a href="venda.jsp">Consumo interno</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>
        
        <div id="conteudo" style="margin-top: 60px;">
            <%
                        if (request.getParameter("quantidade") != null) {
                            b.addVenda(request.getParameter("id"), request.getParameter("quantidade"), request.getParameter("quantidadeest"), request.getParameter("valorP"), request.getParameter("doacao"),"0");
                            response.sendRedirect("consumo_interno.jsp");
                        }
            %>
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Confirmar o consumo interno
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="index.jsp">Início</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-desktop"></i> <a href="consumo_interno.jsp">consumo interno</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-desktop"></i>Confirmar o consumo interno
                            </li>
                        </ol>
                    </div>
                    <%
                        ResultSet produto = b.selectProdutoofId(request.getParameter("idproduto"));
                        while(produto.next()){
                    %>
                    
                    <center>
                        <form action="consumo_interno_confirmar.jsp" method="post" oninput="valor();">
                            <input type="hidden" name="id" value="<%=request.getParameter("idproduto")%>">
                            <input type="hidden" name="idproduto" value="<%=request.getParameter("idproduto")%>">
                            
                            <ul class="infor">
                                <li>
                                    <h2>Nome: </h2>
                                    <h2 class="verde"> <%=produto.getString("nome")%></h2>
                                </li>
                                <li>
                                    <h2>Valor: </h2>
                                    <h2 class="verde">R$ <%=produto.getString("valor")%><input type="hidden" name="valorP" id="valor" value="<%=produto.getString("valor")%>"></h2>
                                </li>
                                <li>
                                    <h2>Quantidade no estoque: </h2>
                                    <h2 class="verde"><%=produto.getString("quantidade")%></h2>
                                    <input type="hidden" value="<%=produto.getString("quantidade")%>" name="quantidadeest">
                                </li>
                            </ul>
                            <ul class="infor">
                                <li>
                                    <div class="radio">
                                        <h2>É doação? </h2>
                                        <label class="verde"><input value="1"type="radio" name="doacao">Sim | </label>
                                        <label class="verde"><input value="0" type="radio" name="doacao" checked>Não</label>
                                    </div>
                                </li>
                                <li>
                                    <h2>Quantidade da venda </h2>
                                    <div class="form-group">
                                        <input oninput="myFunction();" style="width: 30%"  name="quantidade" id="quantidade" class="form-control" type="number" size="10" max="<%=produto.getString("quantidade")%>" min="1" value="1">
                                    </div>
                                </li>
                                <li>
                                    <h2>Total da venda </h2>
                                    <div class="form-group">
                                        <input style="width: 30%"id="totalc" type="number" class="form-control" max="<%=produto.getString("quantidade")%>" readonly>
                                    </div>
                                </li>
                            </ul>
                                    <input class="btn btn-primary" type="submit" style="width: 350px;" value="Consumir">
                            <% } %>
                        </form>
                    </center>
        </div>    

</body>

</html>