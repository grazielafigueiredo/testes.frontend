# frozen_string_literal: true

class Pagamento < SitePrism::Section
  element :cmp_nome_cartao, 'input[name="ccTitular"]'
  element :cmp_numero_cartao, 'input[name="ccNumero"]'
  element :cmp_validade_cartao, 'input[name="ccValidade"]'
  element :cmp_cvv_cartao, 'input[name="ccCodigo"]'

  element :cmp_titular_transferencia, 'input[name="titular"]'
  element :cmp_agencia_transferencia, 'input[name="agencia"]'
  element :cmp_digito_agencia_transferencia, 'input[name="digitoAgencia"]'
  element :cmp_conta_transferencia, 'input[name="conta"]'
  element :cmp_digito_conta_transferencia, 'input[name="digitoConta"]'
  element :cmp_cpf_transferencia, 'input[name="cpf"]'

  element :btn_pagar, 'button[class="btn btn-secondary"]'
end

class CarrinhoPage < SitePrism::Page
  set_url '/carrinho'

  section :pagamento, Pagamento, 'div[class="col-xl-6 pagamento"]'
  element :title_boleto, '[class="cardSucess__header__title"]'
  element :btn_gerar_boleto, '[class="btn btn-alert"]'
  element :btn_confirmar_pedido, '[class="btn btn-secondary"]'
  element :tipo_pagamento, '[class*="tab-list-item"]'

  def confirmar_pedido
    btn_confirmar_pedido.click
  end

  def selecionar_tipo_pagamento(tipo_pagamento)
    a = find("[class*='tab-list-item']", text: tipo_pagamento.to_s)
    a.click
  end

  def button_pagar(btn_pagar)
    a = find('button[class="btn btn-secondary"]', text: btn_pagar.to_s)
    a.click
  end

  def title_boleto
    title_boleto.text
  end

  def gerar_boleto
    btn_gerar_boleto.click
  end

  def dados_cartao(cartao)
    pagamento.cmp_nome_cartao.set cartao['cc_titular']
    pagamento.cmp_numero_cartao.set cartao['cc_numero']
    pagamento.cmp_validade_cartao.set cartao['cc_validade']
    pagamento.cmp_cvv_cartao.set cartao['cc_codigo']
  end

  def conta_transferencia(tipo_banco, conta)
    a = find("[class='pick-banco__banco '] > [alt='#{tipo_banco}']")
    a.click

    if tipo_banco == 'Bradesco'
      pagamento.cmp_titular_transferencia.set conta['titular']
      pagamento.cmp_agencia_transferencia.set conta['agencia']
      pagamento.cmp_conta_transferencia.set conta['conta']
      pagamento.cmp_digito_conta_transferencia.set conta['digito_conta']

    elsif tipo_banco == 'Banco do Brasil'
      pagamento.cmp_titular_transferencia.set conta['titular']
      pagamento.cmp_agencia_transferencia.set conta['agencia']
      pagamento.cmp_digito_agencia_transferencia.set conta['digito_agencia']
      pagamento.cmp_conta_transferencia.set conta['conta']
      pagamento.cmp_digito_conta_transferencia.set conta['digito_conta']

    elsif tipo_banco == 'Santander'
      pagamento.cmp_cpf_transferencia.set conta['cpf']

    elsif tipo_banco == 'Itaú'
      pagamento.cmp_titular_transferencia.set conta['titular']
      pagamento.cmp_agencia_transferencia.set conta['agencia']
      pagamento.cmp_digito_agencia_transferencia.set conta['digito_agencia']
      pagamento.cmp_conta_transferencia.set conta['conta']
      pagamento.cmp_digito_conta_transferencia.set conta['digito_conta']
    end
  end

  def quantidades_titulos(quantidade_titulos)
    find('#qtdSelect > option:nth-child(' + quantidade_titulos + ')').click # Escolher quantidade de títulos
  end
end
