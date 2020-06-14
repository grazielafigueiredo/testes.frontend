# frozen_string_literal: true

Before('@login') do
  @login_page = CadastroPage.new
  @login_page.load
  @login_page.logar_usuario
  @login_page.clicar_entrar
end
