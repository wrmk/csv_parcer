class CreateSkus < ActiveRecord::Migration[6.1]
  def change
    create_table :skus, :primary_key => "SKU" do |t|
      t.string "Код_поставщика"
      t.string "Название_товара"
      t.string "Доп_поле_1"
      t.string "Доп_поле_2"
      t.string "Доп_поле_3"
      t.string "Доп_поле_4"
      t.float "Цена"
    end
  end
end
