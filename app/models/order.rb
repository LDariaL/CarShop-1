class Order < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :items

    def calculate_total

       write_attribute :total, items.map(&:price).inject(:+)

       # создаем дополнительный виртуальный аттрибут для этой модели
       # перебираем items, цены и + между собой 
    end
end
