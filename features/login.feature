#language:pt

Funcionalidade: Login
    Para que eu possa gerenciar os jogos do meu catálogo NinjaPixel
    Sendo um Administrador de catálogo
    Posso acessar o sistema com meu e-mail e senha

    Contexto:
    Dado que acesso à página principal

    Cenario: Acessar o portal

        Dado que acesso à página principal
        Quando eu submeto minhas credenciais "uesley_rsantos2@hotmail.com" e "pwd123"
        Então devo ser autenticado

    Esquema do Cenario: Tentar logar

        Dado que acesso à página principal
        Quando eu submeto minhas credenciais "<email>" e "<senha>"
        Então devo ver uma mensagem de alerta "<texto>"

        Exemplos:
        | email                       | senha  | texto                        |
        | uesley_rsantos2@hotmail.com | abc123 | Usuário e/ou senha inválidos |
        | 404@gmail.com               | abc123 | Usuário e/ou senha inválidos |
        |                             | abc123 | Opps. Informe o seu email!   |
        | uesley_rsantos2@hotmail.com |        | Opps. Informe a sua senha!   |
