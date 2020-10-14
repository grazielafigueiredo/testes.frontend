# frozen_string_literal: true

class PagamentoPage < SitePrism::Page
#   set_url '/carrinho/pagamento'
  set_url "#{@url_pagamento}"

  element :btn_gerar_boleto, '[class="btn btn-alert"]'

  def gerar_boleto
    btn_gerar_boleto.click
  end
end
