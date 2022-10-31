class ItemsController < ApplicationController
   
   layout false
   skip_before_action :verify_authenticity_token

   def index                                                                 # показывает все что есть в базе данных                            
      @items = Item.all
   end

   def create                                                                # создание одного объекта в базу
      item = Item.create(items_params)
      if item.persisted?
      render json: item.name, status: :created
     else
      render json: item.errors, status: :unprocessable_entity  
     end
   end

# RESTful cotrollers (+create)                                                # show, index - endpoints

   def new; end                                                      # рендерит форму которая потом будет посылаться в метод create
                                                                
   def show                                                                  # показывает один по текущему id
      unless (@item = Item.where(id: params[:id]).first)         # найди айтем у которого ид равен ид айтема который мы передали в парамсах; верни не как массив, а первый элемент
      render body: 'Page not found', status: 404
     end  
     end                                                             

   def update                                               # обновляет объект
      item = Item.where(id: params[:id]).first
      if item.update(items_params)
      redirect_to item_path
      else
         render json: item.errors, status: :unprocessable_entity
      end
   end                                                           

   def edit                                                    # при вызове посылается на update
      unless (@item = Item.where(id: params[:id]).first)
         render body: 'Page not found', status: 404
      end
   end                                                 
                                                                 

   def destroy                                                             # уничтожает объект
      item = Item.where(id: params[:id]).first.destroy
      if item.destroyed?
         redirect_to items_path
      else
         render json: item.errors, status: :unprocessable_entity   
      end   
   end                            

   private

   def items_params
      params.permit(:name, :price, :real, :weight, :description)
   end

end
