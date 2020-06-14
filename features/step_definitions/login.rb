# frozen_string_literal: true

Dado('que acesso o login do usuário') do
  @login_page = LoginPage.new
  @login_page.load
end

Dado('preencho os campos do formulário de login') do
  @login_page.logar_usuario
end

Quando('confirmo') do
  @login_page.clicar_entrar
end

Então('o sistema deve exibir a mensagem de bem-vindo') do
  expect(find("div[class='Toastify__toast Toastify__toast--success']").visible?).to be true

  js_script = 'return window.localStorage.getItem("tokenAutenticado");'
  token = page.execute_script(js_script)
  expect(token).to eql 'true'
end

Dado('preencho os campos do formulário de login com a senha incorreta') do
  @login_page.logar_usuario_senha_incorreta
end

Então('o sistema deve exibir a mensagem de senha incorreta') do
  expect(find('span[class="form-error"]', text: '* Usuário e/ou Senha incorretos.').visible?).to be true
end

Dado('preencho os campos do formulário de login com a senha vazia') do
  @login_page.logar_usuario_senha_vazia
end

Então('o sistema deve exibir a mensagem de senha vazia') do
  expect(find("span[class='inputError']", text: 'Senha é obrigatória.').visible?).to be true
end

Dado('preencho os campos do formulário de login com a email vazio') do
  @login_page.logar_usuario_email_vazio
end

Então('o sistema deve exibir a mensagem de email vazio') do
  expect(find("span[class='inputError']", text: 'E-mail é obrigatório.').visible?).to be true
end

Dado('preencho os campos do formulário de login com a email inválido') do
  @login_page.logar_usuario_email_invalido
end
