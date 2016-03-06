require 'rails_helper'

RSpec.describe "campo_extras/new", type: :view do
  include Devise::TestHelpers
  include FactoryGirl::Syntax::Methods

  before do
    @user = FactoryGirl.create(:user)
    sign_in @user
    @campo_extra = CampoExtra.new
  end

  it 'should render Labels: Label, Chave and Campo tipo' do
    assign(:campo_extra, @campo_extra)
    render
    expect(rendered).to match /Label/
    expect(rendered).to match /Chave/
    expect(rendered).to match /Campo tipo/
    expect(rendered).to match /Select option/
  end

  it 'Select option must have text, textarea and combobox' do
    assign(:campo_extra, @campo_extra)
    render
    expect(rendered).to match /<option value="text">Text<\/option>/
    expect(rendered).to match /<option value="textarea">Textarea<\/option>/
    expect(rendered).to match /<option value="combobox">Combo box<\/option>/
  end
end
