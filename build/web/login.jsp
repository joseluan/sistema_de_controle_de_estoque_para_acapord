<%-- 
    Document   : formulario-login
    Created on : 27/11/2016, 14:41:02
    Author     : Luan
--%>
<%@page import="login.autenticacao.Login"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="imagens/icon_logo_acapord.jpg" type="image/x-icon" />
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Página inicial do sistema, tela de login">
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
            img{
                margin: 25px;
                margin-top: 50px;
            }
            div.container{
                border: 3px solid #527af2;
                border-radius: 10px;
                width: 50%;
                padding: 10px 0px 10px 0px;
                margin-bottom: 15px;
                -webkit-box-shadow: 8px 9px 5px -3px rgba(18,38,97,0.38);
                -moz-box-shadow: 8px 9px 5px -3px rgba(18,38,97,0.38);
                box-shadow: 8px 9px 5px -3px rgba(18,38,97,0.38);
            }
            label{
                color: #527af2;
            }
            h3{
                float: left;
                margin-left: 50px; 
            }
            h4{
                color: #d9534f;
            }
            input#botao{
                margin-bottom: 7%;
            }
        </style>
    </head>
    <body>
    <% 
        if (request.getParameter("sair") != null) {
            session.setAttribute("login", null);
            session.setAttribute("nivel", null);
        }
        if(session.getAttribute("login") == null){
    %>
    <form action="login.jsp" method="post" class="login">
          <center>
              <img src="imagens/LogoP.png" title="Logo da ACAPORD">
              <br/>
              <%
                String login = request.getParameter("login");
                String senha = request.getParameter("senha");
                if (login != null && senha != null) {
                    Login lg = new Login();
                    String vfsenha = lg.getSenha(login);
                    if (senha.equals(vfsenha)) {
                        String nivel = lg.getNivel(login);
                        session.setAttribute("login",login);
                        session.setAttribute("nivel",nivel);
                        session.setMaxInactiveInterval(600);
                        response.sendRedirect("index.jsp");
                    }else{
                        out.println("<h4>Senha ou Login incorretos !</h4>");
                    }
                }
              %>
                <div class="container">
                    <div class="form-group">
                        <label><b>Login</b></label>
                        <input type="text" style="width: 75%" class="form-control" placeholder="Digite o login" name="login" required>
                    </div>
                    <div class="form-group">
                        <label><b>Senha</b></label>
                        <input type="password" style="width: 75%" class="form-control" placeholder="Digite a senha" name="senha" required>
                    </div>
                    <h3><b><a href="cadastrar_usuario.jsp" target="_blank">Cadastrar um usuário</a></b></h3>
                </div>
                <input type="submit" id="botao" class="btn btn-lg btn-primary" value="Entrar" title="Clique aqui para entrar no sistema" /> 
          </center>
      </form>
    <%
    }else{
        response.sendRedirect("index.jsp");
    }
    %>
    </body>   
</html>