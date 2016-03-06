require 'rails_helper'

RSpec.describe "contatos/new", type: :view do
  include Devise::TestHelpers
  include FactoryGirl::Syntax::Methods


  before do
    @user = FactoryGirl.create(:user)
    sign_in @user
    @campo_extra = Array.new
    @campo_extra << FactoryGirl.create(:campo_extra)
    @valor_extra = Hash.new
  end

  it 'must have email field' do

    assign(:contato, Contato.new)
    assign(:campo_extra, @campo_extra)
    render
    expect(rendered).to match /Email/
  end

  it 'when have campo extra texto, must render it' do
    @campo_extra << FactoryGirl.create(:campo_extra_text)
    assign(:contato, Contato.new)
    assign(:campo_extra, @campo_extra)
    render
    expect(rendered).to match /Text/
  end

  it 'when have campo extra textarea, must render it' do
    @campo_extra << FactoryGirl.create(:campo_extra_textarea)

    assign(:contato, Contato.new)
    assign(:campo_extra, @campo_extra)
    render
    expect(rendered).to match /Textarea/
  end

  it 'when have combobox, must render it' do
    @campo_extra << FactoryGirl.create(:campo_extra_combobox)
    assign(:contato, Contato.new)
    assign(:campo_extra, @campo_extra)
    render
    expect(rendered).to match /Combobox/
  end
end
