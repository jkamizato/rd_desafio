class AddSelectOptionToCampoExtras < ActiveRecord::Migration
  def change
    add_column :campo_extras, :select_option, :string
  end
end
