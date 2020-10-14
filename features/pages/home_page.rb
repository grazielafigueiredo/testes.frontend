# frozen_string_literal: true

class CartBox < SitePrism::Section
  element :btn_finalizar_pagamento, 'a[href="/carrinho"]'
end

class HomePage < SitePrism::Page
  set_url '/'

  section :cart_box, CartBox, 'div[class="cartBox"]'

  def select_produto_ja
    all('li[data-label="LottoCap Já 17"]').sample.select_option
  end

  def select_produto_max
    all('li[data-label="LottoCap Max"]').sample.select_option
  end

  def select_produto_signos
    all('li[data-label="LottoCap Signos"]').sample.select_option
  end

  def click_comprar
    button_comprar = find('div[class="buy-container"]')
    button_comprar.all('div[class="buy-option"] > button').sample.select_option
  end

  def finalizar_carrinho
    cart_box.btn_finalizar_pagamento.click
  end

  def selecionar_produto_max
    drop = find('ul[class="selling-card__cart__list"]')
    drop.all('button[class="btn btn-primary"]').sample.select_option
  end

  def selecionar_produto_ja
    drop = find('div[class="col-lg-4 col-md-12"]')
    drop.all('button[class="btn btn-lcja"]').sample.select_option
  end

  def excluir_item_header
    drop = find('tr[class="false"]')
    drop.all('div[class="cartBox__close"]').sample.select_option
  end

  def excluir_item_pagamento
    drop = find('div[class="carrinho__item"]')
    drop.all('span[class="carrinho__fechar"]').sample.select_option
  end
end
