#language: pt

@regressivo @carrinho
Funcionalidade: Adicionar produto ao carrinho
Como um usuário do site Lottocap
Quero adicionar produto no carrinho
Para comprar um titulo de capitalização

Contexto: 
    Dado que acesso a vitrine

@add_um_produto_carrinho
Cenário: Adicionar apenas um produto ao carrinho
    E seleciono um produto
    Quando finalizo o carrinho
    Então valido que existe apenas um produto no carrinho

@add_dois_produtos_carrinho
Cenário: Adicionar dois produtos ao carrinho
    E seleciono dois produto
    Quando finalizo o carrinho
    Então valido que existem dois produtos no carrinho

@add
Cenário: Adicionar produto signos no carrinho
    E seleciono um produto max ou já e um signos
    Quando finalizo o carrinho
    Então no carrinho deve conter apenas o produto signos
