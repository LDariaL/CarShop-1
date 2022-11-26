class Item < ApplicationRecord

# валидации 

validates :price, numericality: {greater_than: 0}
validates :name, presence: true

has_many :positions
has_many :carts, through: :positions
has_many :comments, as: :commentable  
has_one  :image, as: :imageable
#говорим что Item является комментируемым (Item type comments)

#has_and_belongs_to_many :carts (if we have carts_items table)

# callbacks что происходит когда что-то создается.удаляется.случается

after_initialize { p 'initialize' } 
after_save       { p 'save'}        
after_create     { p 'create'}
after_update     { p 'update' }
after_destroy    { p 'destroy' }

end