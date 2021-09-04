require 'csv'

namespace :import do
  task suppliers: :environment do
    filename = File.join Rails.root, "suppliers.csv"
    CSV.foreach(filename, col_sep: '¦') do |row|
      columns = ['Код_поставщика','Название_поставщика']
      row_hash = Hash[columns.zip(row)]
      
      supplier = Supplier.where([row_hash.first].to_h)
      if supplier.exists?
        supplier.update(row_hash)
      else
        supplier = Supplier.create(row_hash)
      end
      p supplier
    end
  end

  # task sku: :environment do
  #   filename = File.join Rails.root, "sku.csv"
  #   CSV.foreach(filename, col_sep: '¦') do |row|
  #     sku,id_supplier, item_name, field_1, field_2, field_3, field_4, field_5, price = row

  #     sku = SKU.where("SKU" => sku)
  #     # if supplier_update(supplier, name_supplier) 
  #     # else 
  #     sku = SKU.create(
  #               "SKU" => sku,
  #               "Код_поставщика" => id_supplier,
  #               "Название_товара" => item_name,
  #               "Доп_поле_1" => field_1,
  #               "Доп_поле_2" => field_2,
  #               "Доп_поле_3" => field_3,
  #               "Доп_поле_4" => field_4,
  #               "Доп_поле_5" => field_5,
  #               "Цена" => price
  #               )
  #     end
  #     p sku
  #   # end
  # end  
end
