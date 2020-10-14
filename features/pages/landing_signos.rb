# frozen_string_literal: true

class SignosPage < SitePrism::Page
  set_url '/signos'

  element :close_modal_ver_sorteio, 'div[class="close"]'
  element :btn_add_titulo, 'button[class="add"]'
  element :btn_mais_add_titulo, 'button[class="signosModal__btn"]'
  element :msg_sem_titulo,'[class="signosModal__sub-title signosModal__sub-title--empty"]'

  def msg_sem_titulo_modal
    msg_sem_titulo.text
  end

  def msg_titulo_repetido
    all('.Toastify')[1].text
  end

  def add_mais_um_titulo
    btn_mais_add_titulo.click
  end

  def fechar_modal_ver_sorteio
    close_modal_ver_sorteio.click
  end

  def add_titulo
    btn_add_titulo.click
  end

  def conjunto_signos_aleatorios
    # 3.times do
    #   sleep 1
    #   drop = find('ul[class="signosModal__dezenas-lista"]')
    #   drop.all('li[class]').sample.select_option
    # end
    find('span[class="name"]', text: 'Touro').click
    find('span[class="name"]', text: 'Gêmeos').click
    find('span[class="name"]', text: 'Câncer').click
  end



  def signos_selecionados_modal
    nome = find('ul[class="signosModal__header__signos-selecionados"]')
    nome.all('span[class="name"]')
    nome.text
  end

  def signos_selecionados_carrinho
    a = find('[class="signosModal__lista-titulos"]')
    a = all('li > span')[0]
    a.text
  end

  def conjunto_definido
    find('span[class="name"]', text: 'Touro').click
    find('span[class="name"]', text: 'Libra').click
    find('span[class="name"]', text: 'Virgem').click
  end

  def edicao_titulo(a)
    find('.signosModal__lista-titulos', text: "#{a}").click
  end

  def apagar_titulo
    3.times do
      find('button > span', text: 'Apagar').click
    end
  end

  def acao_excluir
    find('.signosModal__body.signosModal__body--lista > ul > li > span:nth-child(3)').click
  end
end
