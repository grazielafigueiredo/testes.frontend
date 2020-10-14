# frozen_string_literal: true

Dado('que acesso a vitrine') do
  @home_page.load
end

Dado('seleciono um produto') do
  @home_page.select_produto_ja
  @home_page.click_comprar
end

Quando('finalizo o carrinho') do
  @home_page.finalizar_carrinho
end

Então('valido que existe apenas um produto no carrinho') do
  expect(assert_selector('div[class="carrinho__item"]', count: 1))
end

Dado('seleciono dois produto') do
  @home_page.select_produto_ja
  @home_page.click_comprar
  sleep 2
  @home_page.select_produto_max
  @home_page.click_comprar
end

Então('valido que existem dois produtos no carrinho') do
  expect(assert_selector('div[class="carrinho__item"]', count: 2))
end

Dado('seleciono um produto max ou já e um signos') do
  @home_page.select_produto_ja
  @home_page.click_comprar
  sleep 2
  @home_page.select_produto_signos
  @home_page.click_comprar
end

Então('no carrinho deve conter apenas o produto signos') do
  expect(assert_selector('div[class="carrinho__item"]', count: 1))
end
