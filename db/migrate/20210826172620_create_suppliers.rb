class CreateSuppliers < ActiveRecord::Migration[6.1]
  def change
    create_table :suppliers do |t|
      t.integer "Код_поставщика"
      t.string "Название_поставщика"
    end
  end
end
