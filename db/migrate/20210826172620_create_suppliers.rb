class CreateSuppliers < ActiveRecord::Migration[6.1]
  def change
    create_table :suppliers, :primary_key => "Код_поставщика" do |t|
      t.string "Название_поставщика"
    end
  end
end
