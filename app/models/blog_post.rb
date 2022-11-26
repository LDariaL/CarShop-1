class BlogPost < ApplicationRecord
    has_many :comments, as: :commentable 
#говорим что BlogPost является комментируемым (BlogPost type comments)
end
