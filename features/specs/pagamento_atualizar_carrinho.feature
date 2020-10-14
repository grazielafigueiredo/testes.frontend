#language: pt
@regressivo  @pagamento_atualizar
Funcionalidade: Excluir itens do carrinho
    Como um usuário do site Lottocap
    Quero realizar a exclusão de itens do carrinho que não desejo
    Para prosseguir com o pagamento

    @header_pagamento
    Cenário: Excluir itens do header
        Dado tenho produtos no carrinho selecionados do footer da home page
        Quando excluo itens do /carrinho que está no header
        Então a quantidade de itens é atualizado

    @pagamento_carrinho
    Cenário: Excluir itens do carrinho/pagamento
        Dado tenho produtos no carrinho selecionados do footer da home page
        Quando finalizo o carrinho
        E excluo itens do carrinho na sessão carrinho/pagamento
        Então valido a quantidade de itens constante no carrinho
