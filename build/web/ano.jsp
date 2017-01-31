<%-- 
    Document   : adicionar_produto
    Created on : 05/10/2016, 20:07:56
    Author     : luan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    
    <% 
        String reqano = request.getParameter("ano");
    %>
    
    <link rel="icon" href="imagens/icon_logo_acapord.jpg" type="image/x-icon" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Selecionando um periodo para gerar um relatório referente ao periodo escolhido">
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
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">
                        Escolha o tipo de relatório para o ano de <%=reqano%>
                    </h1>
                </div>
            </div>
                
                <center>
                    <ul>
                        <li>
                            <h3>Relatório Anual</h3>
                            <form method="POST" action="relatorio_anual.jsp" >
                                <input type="submit" class="btn btn-lg btn-primary" value="Gerar"> 
                                <input type="hidden" value="<%=reqano%>" name="ano">
                            </form>
                        </li>
                        <li>
                            <h3>Relatório Semestral</h3>
                            <ul>
                                <li>
                                    <form method="post" action="relatorio_semestral.jsp">
                                        <input type="hidden" value="<%=reqano%>" name="ano">
                                        <input type="hidden" value="1" name="sem">
                                        <input id="semestre" type="submit" class="btn btn-lg btn-warning" value="1° Semestre"> 
                                    </form>
                                </li>
                                <li>
                                    <form method="post" action="relatorio_semestral.jsp">
                                        <input type="hidden" value="<%=reqano%>" name="ano">
                                        <input type="hidden" value="2" name="sem">
                                        <input id="semestre" type="submit" class="btn btn-lg btn-warning" value="2° Semestre"> 
                                    </form>
                                </li>
                            </ul>
                        </li>  
                    </ul>
                    <ul id="mes">
                        <h3>Relatório Mensal</h3>
                        <li>
                            <form method="POST" action="relatorio_mensal.jsp">
                                <input type="hidden" value="<%=reqano%>" name="ano">
                                <input type="hidden" value="01" name="mes">
                                <input type="submit" class="btn btn-danger semestre" value="Janeiro"> 
                            </form>
                        </li>
                        <li>
                            <form method="POST" action="relatorio_mensal.jsp">
                                <input type="hidden" value="<%=reqano%>" name="ano">
                                <input type="hidden" value="02" name="mes">
                                <input type="submit" class="btn btn-danger semestre" value="Fevereiro"> 
                            </form>
                        </li>
                        <li>
                            <form method="POST" action="relatorio_mensal.jsp">
                                <input type="hidden" value="<%=reqano%>" name="ano">
                                <input type="hidden" value="03" name="mes">
                                <input type="submit" class="btn btn-danger semestre" value="Março"> 
                            </form>
                        </li>
                        <li>
                            <form method="POST" action="relatorio_mensal.jsp">
                                <input type="hidden" value="<%=reqano%>" name="ano">
                                <input type="hidden" value="04" name="mes">
                                <input type="submit" class="btn btn-danger semestre" value="Abril"> 
                            </form>
                        </li>
                        <li>
                            <form method="POST" action="relatorio_mensal.jsp">
                                <input type="hidden" value="<%=reqano%>" name="ano">
                                <input type="hidden" value="05" name="mes">
                                <input type="submit" class="btn btn-danger semestre" value="Maio"> 
                            </form>
                        </li>
                        <li>
                            <form method="POST" action="relatorio_mensal.jsp">
                                <input type="hidden" value="<%=reqano%>" name="ano">
                                <input type="hidden" value="06" name="mes">
                                <input type="submit" class="btn btn-danger semestre" value="Junho"> 
                            </form>
                        </li>
                        <li>
                            <form method="POST" action="relatorio_mensal.jsp">
                                <input type="hidden" value="<%=reqano%>" name="ano">
                                <input type="hidden" value="07" name="mes">
                                <input type="submit" class="btn btn-danger semestre" value="Julho"> 
                            </form>
                        </li>
                        <li>
                            <form method="POST" action="relatorio_mensal.jsp">
                                <input type="hidden" value="<%=reqano%>" name="ano">
                                <input type="hidden" value="08" name="mes">
                                <input type="submit" class="btn btn-danger semestre" value="Agosto"> 
                            </form>
                        </li>
                        <li>
                            <form method="POST" action="relatorio_mensal.jsp">
                                <input type="hidden" value="<%=reqano%>" name="ano">
                                <input type="hidden" value="09" name="mes">
                                <input type="submit" class="btn btn-danger semestre" value="Setembro"> 
                            </form>
                        </li>
                        <li>
                            <form method="POST" action="relatorio_mensal.jsp">
                                <input type="hidden" value="<%=reqano%>" name="ano">
                                <input type="hidden" value="10" name="mes">
                                <input type="submit" class="btn btn-danger semestre" value="Outubro"> 
                            </form>
                        </li>
                        <li>
                            <form method="post" action="relatorio_mensal.jsp">
                                <input type="hidden" value="<%=reqano%>" name="ano">
                                <input type="hidden" value="11" name="mes">
                                <input type="submit" class="btn btn-danger semestre" value="Novembro"> 
                            </form>
                        </li>
                        <li>
                            <form method="POST" action="relatorio_mensal.jsp">
                                <input type="hidden" value="<%=reqano%>" name="ano">
                                <input type="hidden" value="12" name="mes">
                                <input type="submit" class="btn btn-danger semestre" value="Dezembro"> 
                            </form>
                        </li>
                    </ul>
                </center>
        </div>    
    <% }else{ response.sendRedirect("login.jsp"); } %>
</body>
</html>