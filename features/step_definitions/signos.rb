# frozen_string_literal: true

Dado('que acesso a landing page dos signos') do
  @signos_page.load
  @signos_page.fechar_modal_ver_sorteio
end

Quando('eu adiciono um signos no carrinho') do
  @signos_page.add_titulo
end

Quando('escolho o conjunto de signos que desejo') do
  sleep 2
  @signos_page.conjunto_definido
  @signos_selecionados_modal = @signos_page.signos_selecionados_modal
  print @signos_selecionados_modal
end

Quando('confirmo o título') do
  click_button 'Confirmar escolha'
end

Então('no carrinho deve apresentar a ordem correta que adicinei') do
  signos_confirmados_no_carrinho = @signos_page.signos_selecionados_carrinho
  expect(signos_confirmados_no_carrinho).to eql @signos_selecionados_modal
end

Quando('desejo adicionar mais títulos ao carrinho') do
  @signos_page.add_mais_um_titulo
end

Então('é adicionada o mesmo conjuntos de signos que foi adicionada anteriormente') do
  @signos_page.conjunto_definido
  click_button 'Confirmar escolha'
end

Então('no carrinho deve apresentar mensagem informando que o titulos já foi adicionado') do
  sleep 1
  msg = @signos_page.msg_titulo_repetido
  expect(msg).to include 'Você já adicionou um título com esses signos.'
end

Quando('clico em {string} título') do |edicao|
  @signos_page.edicao_titulo(edicao)
end

Então('sou direcionado a apagar os titulos antigos') do
  @signos_page.apagar_titulo
end

Então('selecionar novos títulos') do
  # @signos_page.conjunto_signos_aleatorios
  mensagem_esperada_sucesso = ''
  mensage = 'a'
  # while mensagem_esperada_sucesso != mensage
  while true
    @signos_page.apagar_titulo
    @signos_page.conjunto_signos_aleatorios
    click_button 'Confirmar escolha'
    sleep 3
    if find('div[role="alert"]', text: 'Esta sequência não está mais disponível') == false
      break
    end
    # mensage = (page).should have_content 'Esta sequência não está mais disponível. Por favor escolha outra.'
    
  end
end

Então('deve apresentar novo conjunto de signos') do
  signos_confirmados_no_carrinho = @signos_page.signos_selecionados_carrinho
  print signos_confirmados_no_carrinho
  expect(signos_confirmados_no_carrinho).to have_no_content @signos_selecionados_modal
end

Quando('confirmo {string}') do |confirmar|
  click_button confirmar.to_s
end

Quando('clico em excluir título') do
  @signos_page.acao_excluir
end

Então('o título deixa de ser apresentado no modal') do
  msg = @signos_page.msg_sem_titulo_modal
  expect(msg).to have_content 'Hey, adicione um título no carrinho para continuar.'
end

Então('o título permanece no modal') do
  expect(page).to have_selector('ul[class="signosModal__lista-titulos"] > li', count: 1)
end
