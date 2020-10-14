#language: pt
@login 
@regressivo  @pagamento_desabilitado
Funcionalidade: Pagamento desabilitado para valores inferiores ou sem créditos
    Como um usuário do site Lottocap
    Quero que os pagamentos sejam bloqueados dados os valores mínimos para pagamento

    # No carrinho deve ter um valor mínimo para liberar as modalidades de pagamento
    # cartao de credito e transferencia dever ter o valor de R$ 5 para ser liberado;
    # para boleto o valor  mínimo é de R$ 20,00 reais; e 
    # créditos não tem valor mínimo, basta que o usuário tenha créditos em conta

    @desabilitado_boleto
    Esquema do Cenário: Fazer pagamento via Cartão de crédito
        Dado tenho produto no carrinho
        Quando seleciono a opção <quantidade_titulos> para mudar a quantidade
        Então deve analisar que as seguintes <forma_pagamento_desabilitada> estão desabilitadas.

        Exemplos:
            | quantidade_titulos | forma_pagamento_desabilitada                                 |
            |         "1"        | "Cartão de crédito,Boleto Bancário,Transferência bancária"   |
            |         "5"        | "Boleto Bancário"                                            |
            |         "19"       | "Boleto Bancário"                                            |
