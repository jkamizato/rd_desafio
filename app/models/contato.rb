class Contato < ActiveRecord::Base
  belongs_to :user
  has_many :campo_extras

  validates_uniqueness_of :email, scope: :user_id
  validates_presence_of :email
end
