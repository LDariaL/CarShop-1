class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :commentable, polymorphic: true 
# полиморфная ассоциация комментируемы другие модели (item,blog_post) 
end
