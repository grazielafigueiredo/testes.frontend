#language: pt

@regressivo @login
Funcionalidade: Fazer login
Como um usuário do site Lottocap
Quero fazer login
Para comprar um titulo de capitalização

Contexto:     
    Dado que acesso o login do usuário

@login_valido
Cenário: Fazer login com dados válidos
    E preencho os campos do formulário de login
    Quando confirmo
    Então o sistema deve exibir a mensagem de bem-vindo

@login_senha_incorreta
Cenário: Fazer login com senha incorreta
    E preencho os campos do formulário de login com a senha incorreta
    Então o sistema deve exibir a mensagem de senha incorreta

@login_senha_vazia
Cenário: Fazer login com senha vazia
    E preencho os campos do formulário de login com a senha vazia
    Então o sistema deve exibir a mensagem de senha vazia

@login_email_vazio
Cenário: Fazer login com senha vazia
    E preencho os campos do formulário de login com a email vazio
    Então o sistema deve exibir a mensagem de email vazio

@login_email_invalido
Cenário: Fazer login com email inválido
    E preencho os campos do formulário de login com a email inválido
    Então o sistema deve exibir a mensagem de email inválido
