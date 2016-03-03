class AddChaveToCampoExtras < ActiveRecord::Migration
  def change
    add_column :campo_extras, :chave, :string
  end
end
