# frozen_string_literal: true

Dado('tenho um produto no carrinho') do
  @home_page.select_primeiro_produto.click
  sleep 2
  @home_page.select_segundo_produto.click
  @home_page.finalizar_carrinho
end

Quando('seleciono a opção {string} para pagamento') do |tipo_pagamento|
  @carrinho_page.load
  @carrinho_page.wait_until_pagamento_visible
  @carrinho_page.selecionar_tipo_pagamento(tipo_pagamento)
end

Quando('click em {string}') do |btn_pagar|
  @carrinho_page.wait_until_pagamento_visible
  @carrinho_page.button_pagar(btn_pagar)
end

Então('sou direcionado para tela de recebimento do pedido') do
  sleep 10
  @url_doacao = @doacao_page.current_url
#   expect(@doacao_page.current_url).to include('/carrinho/doacao')
  @doacao_page.confirmar_pedido
end

Quando('clico em gerar boleto') do
  sleep 3
  @url_pagamento = @pagamento_page.current_url
  @pagamento_page.gerar_boleto
end

Então('o boleto deve ser gerado') do
  within_window -> { page.title == 'Boleto - PagSeguro UOL' } do
    img = find('#boleto-image-wrapper > img')
    expect(img[:src]).to include('/checkout/payment/booklet/print_image.jhtml')
  end
end

# cartão de crédito

Quando('preencho os dados do {string}') do |dados_cartao|
    file = YAML.load_file(File.join(Dir.pwd, "features/support/massa_de_dados/ccredito.yaml"))
    @cartao = file[dados_cartao]
    @carrinho_page.dados_cartao(@cartao)
end

Então('é exibido {string} que os dados são inválidos') do |mensagem|
    expect(page).to have_text(mensagem) # Verificar mensagem na página
end