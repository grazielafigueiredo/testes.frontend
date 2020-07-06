#language: pt
@login 
@regressivo  @pagamento_desabilitado
Funcionalidade: Pagamento desabilitado para valores inferiores ou sem créditos
    Como um usuário do site Lottocap
    Quero que os pagamentos sejam bloqueados dados os valores mínimos para pagamento

    # cartao de credito =  4 reais a menos, deve bloquear pagamento
    # transferencia =  4 reais a menos, deve bloquear pagamento
    # boleto  =  19 reais a menos, deve bloquear pagamento
    # crédito  =  se nao tiver créditos, deve bloquear pagamento

    @desabilitado_boleto
    Esquema do Cenário: Fazer pagamento via Cartão de crédito
        Dado tenho produto no carrinho
        Quando seleciono a opção <quantidade_titulos> para mudar a quantidade
        Então deve analisar que as seguintes <forma_pagamento_desabilitada> estão desabilitadas.

        Exemplos:
            | quantidade_titulos | forma_pagamento_desabilitada                                 |
            |         "4"        | "Cartão de crédito,Boleto Bancário,Transferência bancária"   |
            |         "5"        | "Boleto Bancário"                                            |
            |         "19"       | "Boleto Bancário"                                            |
