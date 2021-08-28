class Supplier < ApplicationRecord
  validates "Код_поставщика", presence: true, uniqueness: true
  validates "Название_поставщика", presence: true
end
