require 'csv'

namespace :import do
  task suppliers: :environment do
    filename = File.join Rails.root, "suppliers.csv"
    CSV.foreach(filename, col_sep: '¦') do |row|
      columns = ['Код_поставщика',
                 'Название_поставщика'
                ]
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

  task sku: :environment do
    filename = File.join Rails.root, "sku.csv"
    CSV.foreach(filename, col_sep: '¦') do |row|
      columns = ['SKU',
                 'Код_поставщика',
                 'Название_товара',
                 'Доп_поле_1',
                 'Доп_поле_2',
                 'Доп_поле_3',
                 'Доп_поле_4',
                 'Доп_поле_5',
                 'Цена'
                ]

      row_hash = Hash[columns.zip(row)]

      sku = Sku.where([row_hash.first].to_h)
      if sku.exists?
        sku.update(row_hash)
      else
        sku = Sku.create(row_hash)
      end
      p sku      
    end
  end  
end
