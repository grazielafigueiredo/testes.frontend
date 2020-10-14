# frozen_string_literal: true

Dado('tenho produtos no carrinho selecionados do footer da home page') do
  @home_page.load
  @home_page.selecionar_produto_max
  @home_page.selecionar_produto_ja
end

Quando('excluo itens do \/carrinho que está no header') do
  @home_page.excluir_item_header
end

Então('a quantidade de itens é atualizado') do
  expect(assert_selector('tr[class="false"]', count: 1))
end

Quando('excluo itens do carrinho na sessão carrinho\/pagamento') do
  @home_page.excluir_item_pagamento
end

Então('valido a quantidade de itens constante no carrinho') do
  expect(assert_selector('div[class="carrinho__info"]', count: 1))
end
