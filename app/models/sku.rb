class Sku < ApplicationRecord
  self.primary_key = "SKU"

  validates "SKU", presence: true, uniqueness: true
  validates "Код_поставщика", presence: true
  validates "Название_товара", presence: true
  validates "Цена", presence: true
  
  belongs_to :supplier, :foreign_key => "Код_поставщика"
  accepts_nested_attributes_for :supplier  
end
