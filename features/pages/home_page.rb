# frozen_string_literal: true

class CartBox < SitePrism::Section
    element :btn_finalizar_pagamento, 'a[href="/carrinho"]'
end

class HomePage < SitePrism::Page
  set_url '/'

  element :select_primeiro_produto, 'div:nth-child(1) > div > div.card-vitrine__bottom > div.card-vitrine__compra > div > div:nth-child(1)'
  element :select_segundo_produto, 'div:nth-child(2) > div > div.card-vitrine__bottom > div.card-vitrine__compra > div > div:nth-child(1)'
  element :select_terceiro_produto, 'div:nth-child(3) > div > div.card-vitrine__bottom > div.card-vitrine__compra > div > div:nth-child(1)'

  section :cart_box, CartBox, '[class="cartBox"]'

  def finalizar_carrinho
    cart_box.btn_finalizar_pagamento.click
  end
end
