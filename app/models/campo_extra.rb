class CampoExtra < ActiveRecord::Base
  has_many :users
  validates_uniqueness_of :chave, scope: :user_id
  before_save :downcase_remove_space_chave
  validates_presence_of :label, :chave, :campo_tipo
  validates :select_option, presence: true,  if: :campo_tipo_combobox
  validate :select_option_format

  def downcase_remove_space_chave
    self.chave.downcase!
  end

  def campo_tipo_combobox
    self.campo_tipo == 'combobox'
  end

  def select_option_format
    return true if self.select_option.nil?

    begin
      combos = eval(self.select_option)

      if combos.class != Array
        self.errors[:select_option] = 'is invalid'
        false
      else
        combos.each do |combo|
          if combo.class != Array
            self.errors[:select_option] = 'is invalid'
            false
          end

          if combo.size != 2
            self.errors[:select_option] = 'is invalid'
            false
          end
        end
      end

      true
    rescue Exception => e
      self.errors[:select_option] = 'is invalid'
      false
    end


  end
end
