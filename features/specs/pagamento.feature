#language: pt
@login 
@produto
@regressivo  @pagamento
Funcionalidade: Realizar pagamento
    Como um usuário do site Lottocap
    Quero pagar o carrinho
    Para adquirir um título de capitalização

    @pagamento_boleto
    Cenário: Fazer pagamento via boleto bancário
        Dado tenho um produto no carrinho
        Quando seleciono a opção 'Boleto Bancário' para pagamento
        E click em 'Pagar com boleto'
        Então sou direcionado para tela de recebimento do pedido
        Quando clico em gerar boleto
        Então o boleto deve ser gerado

    @pagamento_cartao_credito
    Esquema do Cenário: Fazer pagamento via Cartão de crédito
        Dado tenho um produto no carrinho
        Quando seleciono a opção 'Cartão de crédito' para pagamento
        E preencho os dados do <cartao>
        E click em 'Pagar com cartão de crédito'
        Então sou direcionado para tela de recebimento do pedido

        Exemplos:
            | cartao     | 
            |  "valido"  |

    @pagamento_cartao_invalido
    Esquema do Cenário: Fazer pagamento via Cartão de crédito
        Dado tenho um produto no carrinho
        Quando seleciono a opção 'Cartão de crédito' para pagamento
        E preencho os dados do <cartao>
        E click em 'Pagar com cartão de crédito'
        Então é exibido <mensagem> que os dados são inválidos

        Exemplos:
            |   cartao           |  mensagem                    | 
            |  "ano_passado"     | "* Data inválida."           |
            |  "validade_vazio"  | "* Data inválida."           |
            |  "mes_inexistente" | "* Data inválida."           |
            |  "mes_com_string"  | "* Data inválida."           |
            |  "ano_vazio"       | "* Data inválida."           |
            |  "cvv_vazio"       | "* CVV inválido."            |
            |  "nome_vazio"      | "* Campo obrigatório."       |
            |  "numero_invalido" | "* Número de cartão inválido"|


@pagamento_credito_lottocap
Cenário: Fazer pagamento via boleto bancário
Dado tenho um produto no carrinho
E desejo pagar
Quando seleciono a opção crédito lottocap
Então a compra deve ser confirmada

@pagamento_transferencia
Cenário: Fazer pagamento via transferencia bancário
Dado tenho um produto no carrinho
E desejo pagar 
Quando seleciono a opção cartão de crédito
Então devo preencher os dados do cartão e confirmar
