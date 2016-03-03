class CreateCampoExtras < ActiveRecord::Migration
  def change
    create_table :campo_extras do |t|
      t.string :label
      t.string :campo_tipo
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
