require 'rails_helper'

RSpec.describe "campo_extras/edit", type: :view do
  include Devise::TestHelpers
  include FactoryGirl::Syntax::Methods

  before do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  it 'must have filled well. Factory girl campo_extra_text' do
    @campo_extra = FactoryGirl.create(:campo_extra_text)
    assign(:campo_extra, @campo_extra)
    render
    expect(rendered).to have_field('Label', with: @campo_extra.label)
    expect(rendered).to have_field('Chave', with: @campo_extra.chave)
    expect(rendered).to have_field('Campo tipo', with: @campo_extra.campo_tipo)
  end

  it 'mult have filled well, with combobox' do
    @campo_extra = FactoryGirl.create(:campo_extra_combobox)
    assign(:campo_extra, @campo_extra)
    render
    expect(rendered).to have_field('Label', with: @campo_extra.label)
    expect(rendered).to have_field('Chave', with: @campo_extra.chave)
    expect(rendered).to have_field('Campo tipo', with: @campo_extra.campo_tipo)
    expect(rendered).to have_field('Select option', with: @campo_extra.select_option)
  end

end
