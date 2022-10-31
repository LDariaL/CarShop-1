class Item < ApplicationRecord

# валидации 

validates :price, numericality: { greater_than: 0, allow_nil: true }
validates :name, presence: true

# callbacks что происходит когда что-то создается.удаляется.случается

after_initialize { p 'initialize' } 
after_save       { p 'save'}        
after_create     { p 'create'}
after_update     { p 'update' }
after_destroy    { p 'destroy' }

end
