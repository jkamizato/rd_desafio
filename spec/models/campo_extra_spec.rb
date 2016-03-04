require 'rails_helper'

RSpec.describe CampoExtra, type: :model do

  it 'is valid create tipo text' do
    campo_extra = CampoExtra.new(label: 'Idade', chave: 'idade', campo_tipo: 'text')
    campo_extra.valid?
    expect(campo_extra).to be_valid
  end

  it 'is valid create tipo textarea' do
    campo_extra = CampoExtra.new(label: 'Resumé', chave: 'resume', campo_tipo: 'textarea')
    campo_extra.valid?
    expect(campo_extra).to be_valid
  end

  it 'is valid create tipo combobox' do
    campo_extra = CampoExtra.new(label: 'Sexo', chave: 'sexo', campo_tipo: 'combobox', select_option: "[['Masculino', 'masculino'], ['Feminino', 'feminino']]")
    campo_extra.valid?
    expect(campo_extra).to be_valid
  end

  it 'is invalid without label' do
    campo_extra = CampoExtra.new(label: nil, chave: 'idade', campo_tipo: 'text')
    campo_extra.valid?
    expect(campo_extra.errors[:label]).to include("can't be blank")
  end

  it 'is invalid without chave' do
    campo_extra = CampoExtra.new(label: 'Idade', chave: nil, campo_tipo: 'text')
    campo_extra.valid?
    expect(campo_extra.errors[:chave]).to include("can't be blank")
  end

  it 'is invalid without tipo-campo' do
    campo_extra = CampoExtra.new(label: 'Idade', chave: 'idade', campo_tipo: nil)
    campo_extra.valid?
    expect(campo_extra.errors[:campo_tipo]).to include("can't be blank")
  end

  it 'is invalid with tipo-campo-combo and without select-option' do
    campo_extra = CampoExtra.new(label: 'Idade', chave: 'idade', campo_tipo: 'combobox', select_option: nil)
    campo_extra.valid?
    expect(campo_extra.errors[:select_option]).to include("can't be blank")
  end

  it 'is valid tipo-campo different of combo and without select-option' do
    campo_extra = CampoExtra.new(label: 'Idade', chave: 'idade', campo_tipo: 'text', select_option: nil)
    campo_extra.valid?
    expect(campo_extra).to be_valid
  end
end
