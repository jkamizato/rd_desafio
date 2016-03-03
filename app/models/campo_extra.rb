class CampoExtra < ActiveRecord::Base
  has_many :users
  validates_uniqueness_of :chave, scope: :user_id
  before_save :downcase_remove_space_chave

  def downcase_remove_space_chave
    self.chave.downcase!
  end
end
