class CampoExtra < ActiveRecord::Base
  has_many :users
  has_many :contatos
end
