require 'rails_helper'

RSpec.describe "contatos/edit", type: :view do
  include Devise::TestHelpers
  include FactoryGirl::Syntax::Methods


  before do
    @user = FactoryGirl.create(:user)
    sign_in @user
    @campo_extra = Array.new
    @valor_extra = Hash.new
  end

  it 'Must be email filled' do
    @contato = FactoryGirl.create(:contato)
    render
    assign(:contato, @contato)
    expect(rendered).to have_field('Email', with: @contato.email)
  end

  it 'Must have user_id hidden filled' do
    @contato = FactoryGirl.create(:contato)
    render
    assign(:contato, @contato)
    expect(rendered).to have_selector("input[value='#{@user.id}']")

  end
end
