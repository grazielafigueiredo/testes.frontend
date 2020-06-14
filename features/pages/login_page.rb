# frozen_string_literal: true

class LoginPage < SitePrism::Page
  set_url '/'

  element :cmp_entrar, 'div[class="Header__login"]'
  element :cmp_email, 'input[name="email"]'
  element :cmp_senha, 'input[name="password"]'
  element :btn_entrar, 'button[type="submit"]'

  def logar_usuario
    cmp_entrar.click
    cmp_email.set 'user22@gmail.com'
    cmp_senha. set '1234'
  end

  def logar_usuario_senha_incorreta
    cmp_entrar.click
    cmp_email.set 'user22@gmail.com'
    cmp_senha. set '123489'
    btn_entrar.click
  end

  def logar_usuario_senha_vazia
    cmp_entrar.click
    cmp_email.set 'user22@gmail.com'
    cmp_senha. set ''
    btn_entrar.click
  end

  def logar_usuario_email_vazio
    cmp_entrar.click
    cmp_email.set ''
    cmp_senha. set '1234'
    btn_entrar.click
  end

  def logar_usuario_email_invalido
    cmp_entrar.click
    cmp_email.set 'user22@gmail'
    cmp_senha. set '1234'
    btn_entrar.click
  end

  def clicar_entrar
    btn_entrar.click
  end
end
