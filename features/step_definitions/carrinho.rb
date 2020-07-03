# frozen_string_literal: true

Dado('que acesso a vitrine') do
  @home_page.load
end

Dado('seleciono um produto') do
  @home_page.select_primeiro_produto.click
end

Quando('finalizo o carrinho') do
  @home_page.finalizar_carrinho
end

Então('valido que existe apenas um produto no carrinho') do
  expect(assert_selector('div[class="carrinho__item"]', count: 1))
end

Dado('seleciono dois produto') do
  @home_page.select_primeiro_produto.click
  @home_page.select_segundo_produto.click
end

Então('valido que existem dois produtos no carrinho') do
  expect(assert_selector('div[class="carrinho__item"]', count: 2))
end

Dado('seleciono vários produto') do
  @home_page.select_primeiro_produto.click
  @home_page.select_segundo_produto.click
  @home_page.select_terceiro_produto.click
end

Então('valido que existem vários produtos no carrinho') do
  expect(assert_selector('div[class="carrinho__item"]', count: 3))
end
