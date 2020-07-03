# frozen_string_literal: true

class DoacaoPage < SitePrism::Page
  set_url @url_doacao.to_s
  #   set_url '/carrinho/doacao/'

  element :btn_confirmar_pedido, '[class="btn btn-secondary"]'

  def confirmar_pedido
    btn_confirmar_pedido.click
  end
end
