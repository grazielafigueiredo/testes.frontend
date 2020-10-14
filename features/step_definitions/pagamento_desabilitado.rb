# frozen_string_literal: true

Dado('tenho produto no carrinho') do
  @home_page.select_produto_ja
  @home_page.click_comprar
  sleep 2
  @home_page.finalizar_carrinho
end

Quando('seleciono a opção {string} para mudar a quantidade') do |quantidade_titulos|
  @carrinho_page.quantidades_titulos(quantidade_titulos)
end

Então('deve analisar que as seguintes {string} estão desabilitadas.') do |forma_pagamento_desabilitada|
  pagamentos_bloqueados = all('li[class*="tab-list-item--disabled"]')

  @lista_pagamentos_da_tela = []
  pagamentos_bloqueados.each do |pagamento|
    @lista_pagamentos_da_tela.push(pagamento.text)
  end

  expect(@lista_pagamentos_da_tela).to match_array(forma_pagamento_desabilitada.split(','))
end
