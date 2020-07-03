# frozen_string_literal: true

class Pagamento < SitePrism::Section
  element :cmp_nome_cartao, 'input[name="ccTitular"]'
  element :cmp_numero_cartao, 'input[name="ccNumero"]'
  element :cmp_validade_cartao, 'input[name="ccValidade"]'
  element :cmp_cvv_cartao, 'input[name="ccCodigo"]'
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
    pagamento.cmp_nome_cartao.set cartao["cc_titular"]
    pagamento.cmp_numero_cartao.set cartao["cc_numero"]
    pagamento.cmp_validade_cartao.set cartao["cc_validade"]
    pagamento.cmp_cvv_cartao.set cartao["cc_codigo"]
  end
end
