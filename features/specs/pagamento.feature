#language: pt
@login 
@regressivo  @pagamento
Funcionalidade: Realizar pagamento
    Como um usuário do site Lottocap
    Quero pagar o carrinho
    Para adquirir um título de capitalização

Contexto: 
    Dado tenho um produto no carrinho


    @pagamento_boleto
    Cenário: Fazer pagamento via boleto bancário
        Quando seleciono a opção 'Boleto Bancário' para pagamento
        E click em 'Pagar com boleto'
        Então sou direcionado para tela de recebimento do pedido
        Quando clico em gerar boleto
        Então o boleto deve ser gerado

    @pagamento_cartao_credito
    Esquema do Cenário: Fazer pagamento via Cartão de crédito
        Quando seleciono a opção 'Cartão de crédito' para pagamento
        E preencho os dados do <cartao>
        E click em 'Pagar com cartão de crédito'
        Então sou direcionado para tela de recebimento do pedido

        Exemplos:
            | cartao     | 
            |  "valido"  |

    @pagamento_cartao_invalido
    Esquema do Cenário: Fazer pagamento via Cartão de crédito
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
    Cenário: Fazer pagamento via créditos
        Quando seleciono a opção 'Créditos Lottocap' para pagamento
        E click em 'Pagar com créditos LottoCap'
        Então sou direcionado para tela de recebimento do pedido

    @pagamento_transferencia
    Esquema do Cenário: Fazer pagamento via transferencia bancária
        Quando seleciono a opção 'Transferência bancária' para pagamento
        E seleciono o <banco> preenchendo os dados da <conta> 
        E click em 'Pagar via transferência'
        Então sou direcionado para tela de recebimento do pedido

        Exemplos:
        |   banco                |   conta               |
        |   "Bradesco"           |  "conta_bradesco"     |
        |   "Banco do Brasil"    |  "conta_bbrasil"      |
        |   "Itaú"               |  "conta_itau"         |
        |   "Santander"          |  "conta_santander"    |
