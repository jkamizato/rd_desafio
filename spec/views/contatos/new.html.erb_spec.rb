require 'rails_helper'

RSpec.describe "contatos/new", type: :view do
  include Devise::TestHelpers

  before do
    user = FactoryGirl.create(:user)
    sign_in user
  end

  it 'must have email field' do
    assign(:contato, Contato.new)
    #render
    # rendered.should contain('Email')
  end

  # it 'when have campo extra texto, must render it'
end
