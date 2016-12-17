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
        </style>
    </head>
    <%  Login lg = new Login();%>
    <body>
      <form action="index.jsp" method="post">
          <center>
              <img src="imagens/logoP.jpg" title="Logo da ACAPORD">
              <br/>
                <div class="container">
                    <div class="form-group">
                        <label><b>Login</b></label>
                        <input type="text" style="width: 75%" class="form-control" placeholder="Digite o login" name="login" required>
                    </div>
                    <div class="form-group">
                        <label><b>Senha</b></label>
                        <input type="password" style="width: 75%" class="form-control" placeholder="Digite a senha" name="senha">
                    </div>
                </div>
                <input type="submit" class="btn btn-lg btn-primary" value="Entrar" title="Clique aqui para entrar no sistema" /> 
          </center>
      </form>
    </body>
</html>