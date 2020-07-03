# frozen_string_literal: true

class CadastroPage < SitePrism::Page
  set_url '/'

  element :cmp_cadastrar, 'div.Header__button > a'
  element :cmp_email, 'input[name="email"]'
  element :cmp_nome, 'input[name="name"]'
  element :cmp_cpf, 'input[name="cpf"]'
  element :cmp_senha, '[name="password"]'
  element :cmp_confirmar_senha, '[name="confirmPassword"]'
  element :cmp_dia, 'select[name="bDay"] option:nth-child(2)'
  element :cmp_mes, 'select[name="bMonth"] option:nth-child(2)'
  element :cmp_ano, 'select[name="bYear"] option:nth-child(31)'
  element :cmp_ano_menoridade, 'select[name="bYear"] option:nth-child(13)'
  element :rd_termo, '#terms'
  element :btn_confirmar, 'button[type="submit"]'

  def prencher_form_com_dados
    cmp_cadastrar.click
    cmp_email.set Faker::Internet.email
    cmp_nome.set 'Maria Silva'
    cmp_cpf.set CpfUtils.cpf
    btn_confirmar.click
    cmp_senha.set '1234'
    cmp_confirmar_senha.set '1234'
    cmp_dia.click
    cmp_mes.click
    cmp_ano.click
    rd_termo.set true
  end
  # def prencher_form_com_dados(a, b, c, d, e)
  #   cmp_cadastrar.click
  #   cmp_email.set a
  #   cmp_nome.set b
  #   cmp_cpf.set c
  #   btn_confirmar.click
  #   cmp_senha.set d
  #   cmp_confirmar_senha.set e
  #   cmp_dia.click
  #   cmp_mes.click
  #   cmp_ano.click
  #   if cmp_ano == 'pf'
  #     rd_termo.set true
  #   elsif cmp_ano == 'pj'
  #     rd_termo.set false
  #   end
  #   rd_termo.set true
  # end
  
  def clicar_finalizar
    btn_confirmar.click
  end

  def prencher_form_com_menoridade
    cmp_cadastrar.click
    cmp_email.set Faker::Internet.email
    cmp_nome.set 'Maria Silva'
    cmp_cpf.set CpfUtils.cpf
    btn_confirmar.click
    cmp_senha.set '1234'
    cmp_confirmar_senha.set '1234'
    cmp_dia.click
    cmp_mes.click
    cmp_ano_menoridade.click
    rd_termo.set true
  end

  def prencher_form_com_senhas_diferentes
    cmp_cadastrar.click
    cmp_email.set Faker::Internet.email
    cmp_nome.set 'Maria Silva'
    cmp_cpf.set CpfUtils.cpf
    btn_confirmar.click
    cmp_senha.set '1234'
    cmp_confirmar_senha.set '123456'
    cmp_dia.click
    cmp_mes.click
    cmp_ano.click
    rd_termo.set true
  end

  def prencher_form_sem_assinalar_termo
    cmp_cadastrar.click
    cmp_email.set Faker::Internet.email
    cmp_nome.set 'Maria Silva'
    cmp_cpf.set CpfUtils.cpf
    btn_confirmar.click
    cmp_senha.set '1234'
    cmp_confirmar_senha.set '1234'
    cmp_dia.click
    cmp_mes.click
    cmp_ano.click
  end

  def prencher_form_com_email_invalido
    cmp_cadastrar.click
    cmp_email.set 'Faker::Internet.email'
    cmp_nome.set 'Maria Silva'
    cmp_cpf.set CpfUtils.cpf
    btn_confirmar.click
  end

  def prencher_form_com_email_duplicado
    cmp_cadastrar.click
    cmp_email.set 'user22@gmail.com'
    cmp_nome.set 'Maria Silva'
    cmp_cpf.set CpfUtils.cpf
    btn_confirmar.click
  end

  def prencher_form_com_cpf_duplicado
    cmp_cadastrar.click
    cmp_email.set Faker::Internet.email
    cmp_nome.set 'Maria Silva'
    cmp_cpf.set '00000002054'
    btn_confirmar.click
  end

  def prencher_form_com_nome_invalido
    cmp_cadastrar.click
    cmp_email.set Faker::Internet.email
    cmp_nome.set 'Maria'
    cmp_cpf.set CpfUtils.cpf
    btn_confirmar.click
  end

  def prencher_form_com_cpf_invalido(cpf)
    cmp_email.set Faker::Internet.email
    cmp_nome.set 'Maria Silva'
    cmp_cpf.set cpf
    btn_confirmar.click
  end
end
