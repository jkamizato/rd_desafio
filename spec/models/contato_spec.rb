require 'rails_helper'

RSpec.describe Contato, type: :model do

  it "is valid" do
    expect(FactoryGirl.create(:contato)).to be_valid
  end

  it "is invalid without email" do
    contato = Contato.new
    contato.valid?
    expect(contato.errors[:email]).to include("can't be blank")
  end

  it 'is invalid with a duplicate address for a user' do
    Contato.create(user_id: 1, email: 'julio@gmail.com')
    contato = Contato.new(user_id: 1, email: 'julio@gmail.com')
    contato.valid?
    expect(contato.errors[:email]).to include("has already been taken")
  end

  it 'is valid duplicate email when user is different' do
    Contato.create(user_id: 1, email: 'julio@gmail.com')
    contato = Contato.new(user_id: 2, email: 'julio@gmail.com')
    contato.valid?
    expect(contato).to be_valid
  end

  it 'is invalid with bad format email' do
    contato = Contato.new(user_id: 1, email: 'emailinvalido')
    expect(contato).to_not be_valid
    expect(contato.errors[:email]).to include("is invalid")
  end
end
