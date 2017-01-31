f<%-- 
    Document   : editar_p
    Created on : 25/10/2016, 21:13:29
    Author     : luan
--%>

<%@page import="java.sql.ResultSet"%>
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
    <meta name="description" content="Página para editar um produto">
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
    <% if(session.getAttribute("nivel").equals("1")){ %>
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
                        <a href="venda.jsp">venda</a>
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
            <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Alterar Produto
                        </h1>
                    </div>
                    <center>
                        <form action="editar_p.jsp" method="POST">
                            
                            <%
                                ResultSet produto = b.selectAllProdutoofId(request.getParameter("idprodt"));
                                while(produto.next()){
                            %>
                                <div class="form-group">
                                    <label>Nome</label>
                                    <input name="nome" type="text" class="form-control editarP" placeholder="Digite o nome do seu produto aqui" value="<%=produto.getString("nome")%>">
                                </div>
                                <hr/>
                                <div class="form-group">
                                    <label>valor</label>
                                    <input name="valor" type="number" class="form-control editarP" placeholder="Insira o valor do seu produto" value="<%=produto.getString("valor")%>">
                                </div>
                                <br/>
                            <%  } %>
                        
                            <hr/>
                            <input type="hidden" name="id" value="<%=request.getParameter("idprodt")%>">
                            <input type="submit" value="Editar" class="btn btn-lg btn-warning">
                            <%
                                if (request.getParameter("id") != null) {
                                    b.alterarProduto(request.getParameter("id"), request.getParameter("nome"), request.getParameter("valor"));
                                    response.sendRedirect("produtos.jsp");
                                }
                            %>
                        </form>
                    
                     </center>
        </div>    
    <%
    }else{
        response.sendRedirect("produtos.jsp");
    }
    %>
    
    <% }else{ response.sendRedirect("login.jsp"); } %>
</body>
</html>