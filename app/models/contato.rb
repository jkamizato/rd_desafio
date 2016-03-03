class Contato < ActiveRecord::Base
  belongs_to :user
  has_many :campo_extras
end
