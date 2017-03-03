<%-- 
    Document   : editar_p
    Created on : 22/10/2016, 21:07:45
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
    <meta name="description" content="Página para excluir um produto">
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
            width: 500px;
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
                    <% if(session.getAttribute("nivel").toString().equals("1")){ %>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo">Adicionar <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo" class="collapse">
                            <li>
                                <span><a href="adicionar_produto.jsp"><span>Produto</span></a></span>
                            </li>
                            <li>
                                <span><a href="adicionar_p_est.jsp"><span>Produto ao estoque</span></a></span>
                            </li>
                            <li>
                                <span><a href="cadastrar_admin.jsp"><span>Administrador</span></a></span>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="venda.jsp">Venda</a>
                    </li>
                    <li>
                        <a href="consumo_interno.jsp">Consumo interno</a>
                    </li>
                    <% } %>
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
            <div class="col-lg-12">
                        <h1 class="page-header">
                            Confirmar a exclusão do produto
                        </h1>
                    </div>
                    <center>
                        <%
                            ResultSet produto = b.selectProdutoofId(request.getParameter("idprodt"));
                            while(produto.next()){
                        %>

                                <h2>Nome do produto: <%=produto.getString("nome")%></h2><br/>
                                <h2>Valor do produto: R$ <%=produto.getString("valor")%></h2><br/>

                        <%  }
                            produto.close();
                        %>
                        <form action="excluir_p.jsp" method="POST">
                            <hr/>
                            <input type="hidden" name="id" value="<%=request.getParameter("idprodt")%>">
                            <input type="submit" value="Excluir produto" class="btn btn-lg btn-danger">
                            <%
                                if (request.getParameter("id") != null) {
                                    b.excluirProduto(request.getParameter("id"));
                                    response.sendRedirect("produtos.jsp");
                                }
                                b.closeAll();
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