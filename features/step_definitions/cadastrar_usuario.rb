# frozen_string_literal: true

Dado('que acesso o cadastro do usuário') do
  @cadastro_page = CadastroPage.new
  @cadastro_page.load
end
# Dado('preencho os campos do formulário com {string}, {string}, {string}, {string}, {string}') do |string, string2, string3, string4, string5|  
#   @cadastro_page.prencher_form_com_dados(string, string2, string3, string4, string5)

# end
Dado('preencho os campos do formulário com dados válidos') do
  @cadastro_page.prencher_form_com_dados
end

Quando('confirmo o cadastro') do
  @cadastro_page.clicar_finalizar
end

Então('o sistema deve exibir a mensagem de boas vindas') do
  expect(find("div[class='Toastify__toast Toastify__toast--success']").visible?).to be true

  js_script = 'return window.localStorage.getItem("tokenAutenticado");'
  token = page.execute_script(js_script)
  expect(token).to eql 'true'
end

Dado('preencho os campos do formulário com dados inválidos') do
  @cadastro_page.prencher_form_com_menoridade
end

Então('o sistema deve exibir a mensagem de alerta') do
  expect(find("span[class='form-error']")).to have_content '* É necessário ter mais de 16 anos!'
end

Dado('preencho os campos do formulário com senhas diferentes') do
  @cadastro_page.prencher_form_com_senhas_diferentes
end

Então('o sistema deve exibir a mensagem que as senhas não conferem') do
  expect(find("span[class='inputError']", text: 'As senhas não conferem.').visible?).to be true
end

Dado('preencho os campos do formulário e não aceito o termo') do
  @cadastro_page.prencher_form_sem_assinalar_termo
end

Então('o sistema deve exibir a mensagem de alerta do termo') do
  expect(find("span[class='inputError']", text: 'Você deve aceitar os termos de uso para continuar.').visible?).to be true
end

Dado('preencho os campos do formulário com email inválido') do
  @cadastro_page.prencher_form_com_email_invalido
end

Então('o sistema deve exibir a mensagem de email inválido') do
  expect(find("span[class='inputError']", text: 'Informe um email válido.').visible?).to be true
end

Dado('preencho os campos do formulário com email duplicado') do
  @cadastro_page.prencher_form_com_email_duplicado
end

Então('o sistema deve exibir a mensagem de email duplicado') do
  expect(find("span[class='form-error']", text: "* Este e-mail já está cadastrado. Informe um outro e-mail ou clique em 'Esqueci a minha senha'.").visible?).to be true
end

Dado('preencho os campos do formulário com cpf inválido, é exibito mensagem de erro') do |table|
  @cadastro_page.cmp_cadastrar.click

  table.hashes.each do |cpf|
    @cadastro_page.prencher_form_com_cpf_invalido(cpf)
    expect(find("span[class='inputError']", text: 'Informe um cpf válido.').visible?).to be true
  end
end

Dado('preencho os campos do formulário com cpf duplicado') do
  @cadastro_page.prencher_form_com_cpf_duplicado
end

Então('o sistema deve exibir a mensagem de cpf duplicado') do
  expect(find("span[class='form-error']", text: "* Este CPF já está cadastrado. Informe um outro CPF ou clique em 'Esqueci a minha senha'.").visible?).to be true
end

Dado('preencho os campos do formulário com nome inválido') do
  @cadastro_page.prencher_form_com_nome_invalido
end

Então('o sistema deve exibir a mensagem de nome inválido') do
  expect(find("span[class='inputError']", text: 'Nome inválido!').visible?).to be true
end
