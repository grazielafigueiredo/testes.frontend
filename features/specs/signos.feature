#language: pt

@regressivo @signos
Funcionalidade: Comprar um produto signos
    Como um usuário do site Lottocap
    Quero adquirir um signos 
    Para concorrer um titulo de capitalização

    Contexto:     
        Dado que acesso a landing page dos signos
        Quando eu adiciono um signos no carrinho
        E escolho o conjunto de signos que desejo
        E confirmo o título

        @modal_titulo
        Cenário: Escolher conjunto de título do signos
            Então no carrinho deve apresentar a ordem correta que adicinei 

        @modal_titulo_repetido
        Cenário: Escolher conjunto de título do signos repetidos
            E desejo adicionar mais títulos ao carrinho 
            Então é adicionada o mesmo conjuntos de signos que foi adicionada anteriormente
            Então no carrinho deve apresentar mensagem informando que o titulos já foi adicionado

        @modal_titulo_editar
        Cenário: Adicionar ao carrinho um título do signos
            E clico em 'editar' título
            Então sou direcionado a apagar os titulos antigos 
            E selecionar novos títulos
            E confirmo o título
            Então deve apresentar novo conjunto de signos

        @modal_titulo_excluir
        Cenário: Excluir título no modal
            E clico em excluir título
            E confirmo 'Excluir'
            Então o título deixa de ser apresentado no modal

        @modal_titulo_cancelar
        Cenário: Excluir título no modal
            E clico em excluir título
            E confirmo 'Cancelar'
            Então o título permanece no modal

        @modal_titulo_add_2_titulos
        Cenário: Adicionar ao carrinho um título do signos
            E clico em editar título
            Então sou direcionado a apagar os titulos antigos 
            E selecionar novos títulos
            E confirmo o título
            Então deve apresentar novo conjunto de signos


        @header_pagamento
        Cenário: Excluir itens do header
            Dado tenho produtos signos no carrinho
            Quando excluo itens do /carrinho que está no header
            Então a quantidade de itens deve ser atualizado

        @pagamento_carrinho
        Cenário: Excluir itens do carrinho/pagamento
            Dado tenho produtos signos no carrinho
            Quando finalizo o carrinho
            E excluo itens do carrinho na sessão carrinho/pagamento
            Então valido a quantidade de itens constante no carrinho
            

