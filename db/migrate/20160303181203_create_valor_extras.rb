class CreateValorExtras < ActiveRecord::Migration
  def change
    create_table :valor_extras do |t|
      t.integer :contato_id
      t.integer :campo_extra_id
      t.text :valor

      t.timestamps null: false
    end
  end
end
