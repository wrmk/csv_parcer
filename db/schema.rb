# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_30_172643) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "skus", primary_key: "SKU", force: :cascade do |t|
    t.string "Код_поставщика"
    t.string "Название_товара"
    t.string "Доп_поле_1"
    t.string "Доп_поле_2"
    t.string "Доп_поле_3"
    t.string "Доп_поле_4"
    t.string "Доп_поле_5"
    t.float "Цена"
  end

  create_table "suppliers", primary_key: "Код_поставщика", force: :cascade do |t|
    t.string "Название_поставщика"
  end

end
