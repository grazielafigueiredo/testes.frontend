#language: pt

@regressivo @cadastrar
Funcionalidade: Criar conta
Como um usuário do site Lottocap
Quero criar conta 
Para comprar um titulo de capitalização

Contexto: Acesso ao site
    Dado que acesso o cadastro do usuário

# Esquema do Cenário:
#     Dado que acesso o cadastro do usuário
#     E preencho os campos do formulário com <email>, <nome>, <cpf>, <senha>, <confirmarSenha>
#     Quando confirmo o cadastro
#     Então o sistema deve exibir a mensagem de boas vindas
# Exemplos:
#     |email|nome|cpf|senha|confirmarSenha|
#     | 'Faker::Internet.email' |'Maria Silva'|'CpfUtils.cpf'|'1234'|'1234'|

@cadastro_valido_faker
Cenário: Cadastrar usuário com dados válidos
    E preencho os campos do formulário com dados válidos
    Quando confirmo o cadastro
    Então o sistema deve exibir a mensagem de boas vindas

@cadastro_menor_de_dezesseis_anos
Cenário: Cadastrar usuário com dezesseis anos de idade
    E preencho os campos do formulário com dados inválidos
    Quando confirmo o cadastro
    Então o sistema deve exibir a mensagem de alerta

@cadastro_com_senhas_diferentes
Cenário: Cadastrar usuário com senhas diferentes
    E preencho os campos do formulário com senhas diferentes
    Quando confirmo o cadastro
    Então o sistema deve exibir a mensagem que as senhas não conferem

@cadastro_sem_aceitar_termo
Cenário: Cadastrar usuário e não aceitar o termo
    E preencho os campos do formulário e não aceito o termo
    Quando confirmo o cadastro
    Então o sistema deve exibir a mensagem de alerta do termo

@cadastro_email_invalido
Cenário: Cadastrar usuário com email inválido
    E preencho os campos do formulário com email inválido
    Então o sistema deve exibir a mensagem de email inválido

@cadastro_email_duplicado
Cenário: Cadastrar usuário com email inválido
    E preencho os campos do formulário com email duplicado
    Então o sistema deve exibir a mensagem de email duplicado

@cadastro_cpf_invalido
Cenário: Cadastrar usuário com cpf aleatório e com caracters
    E preencho os campos do formulário com cpf inválido, é exibito mensagem de erro
        | cpf         |
        | gh34567hji8 |
        | 09876789453 |

@cadastro_cpf_duplicado
Cenário: Cadastrar usuário com cpf aleatório e com caracters
    E preencho os campos do formulário com cpf duplicado
    Então o sistema deve exibir a mensagem de cpf duplicado

@cadastro_nome_invalido
Cenário: Cadastrar usuário apenas com o primeiro nome
    E preencho os campos do formulário com nome inválido
    Então o sistema deve exibir a mensagem de nome inválido
