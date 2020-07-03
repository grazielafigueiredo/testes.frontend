# frozen_string_literal: true

Before('@login') do
  include Capybara::DSL
  visit '/'

  find('div[class="Header__login"]').click
  fill_in 'email', with: "user22@gmail.com"
  fill_in 'password', with: "1234"
  find(:css, 'button[type="submit"]').click

end
# Before('@produto') do
#   find('div:nth-child(1) > div > div.card-vitrine__bottom > div.card-vitrine__compra > div > div:nth-child(1)').click
# end
Before do
  @carrinho_page = CarrinhoPage.new
  @doacao_page = DoacaoPage.new
  @home_page = HomePage.new
  @pagamento_page = PagamentoPage.new
end

After do
  include Capybara::DSL
  page.reset!
end


