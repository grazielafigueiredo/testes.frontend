#language: pt

@regressivo @carrinho
Funcionalidade: Adicionar produto ao carrinho
Como um usuário do site Lottocap
Quero adicionar produto no carrinho
Para comprar um titulo de capitalização

Contexto: 
    Dado que acesso a vitrine

@add_produto_carrinho
Cenário: Adicionar apenas um produto ao carrinho
    E seleciono um produto
    Quando finalizo o carrinho
    Então valido que existe apenas um produto no carrinho

@add_dois_produtos_carrinho
Cenário: Adicionar dois produtos ao carrinho
    E seleciono dois produto
    Quando finalizo o carrinho
    Então valido que existem dois produtos no carrinho

@add_varios_produtos_carrinho
Cenário: Adicionar vários produtos ao carrinho
    E seleciono vários produto
    Quando finalizo o carrinho
    Então valido que existem vários produtos no carrinho
