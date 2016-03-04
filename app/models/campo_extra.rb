class CampoExtra < ActiveRecord::Base
  has_many :users
  validates_uniqueness_of :chave, scope: :user_id
  before_save :downcase_remove_space_chave
  validates_presence_of :label, :chave, :campo_tipo
  validates :select_option, presence: true,  if: :campo_tipo_combobox

  def downcase_remove_space_chave
    self.chave.downcase!
  end

  def campo_tipo_combobox
    self.campo_tipo == 'combobox'
  end
end
