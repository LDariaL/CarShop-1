class ItemsController < ApplicationController
   
   layout false
   skip_before_action :verify_authenticity_token
   # какое-то действие, использующееся во многих контроллерах перед 
   # действием самого контроллера (например, найти предмет, юзера или запись: find_item) 
   # или проверить админство (только админ может делать что-то) 
   before_action :find_item, only: %i[show edit update destroy upvote]   
   before_action :admin?, only: %i[edit]            
   after_action :show_info, only: %i[index]
   
   def index                     # показывает все что есть в базе данных                            
      @items = Item.all
   end

   def create                          # создание одного объекта в базу
      item = Item.create(items_params)
      if item.persisted?
      redirect_to items_path
     else
      render json: item.errors, status: :unprocessable_entity  
     end
   end

# RESTful cotrollers (+create)           # show, index - endpoints

   #def new; end    # рендерит форму которая потом будет посылаться в метод create
                                                                
   #def show                  # показывает один по текущему id                                         
      #render body: 'Page not found', status: 404 unless @item - не нужно так как активирована 404 страница в public
     #end                                                             

   def update                          # обновляет объект
      if @item.update(items_params)
      redirect_to items_path
      else
         render json: item.errors, status: :unprocessable_entity
      end
   end                                                           

   #def edit             # при вызове посылается на update
      #render body: 'Page not found', status: 404 unless @item - не нужно так как активирована 404 страница в public
   #end                                                 
                                                                 

   def destroy                        # уничтожает объект
      if @item.destroy.destroyed?
         # redirect_to items_path
         redirect_to '/items'
         # render 'items/index'     при рендере (в отличие от редиректа)не происходит 
      else                          #перезагрузки страницы и мы теряем доступ к переменной @items
         render json: item.errors, status: :unprocessable_entity   
      end   
   end     
   
   def upvote
       @item.increment! :votes_count   # увеличиваем на 1 поле votes
       redirect_to items_path
   end

   def expensive
       @items = Item.where('price > 1000')
       render :index
   end

   private

   def items_params
      params.permit(:name, :price, :real, :weight, :description)
   end
      
   def find_item
      # найди айтем у которого ид равен ид айтема который мы передали в парамсах; верни не как массив, а первый элемент
      @item = Item.where(id: params[:id]).first  
      render_404 unless @item 
   end

   def admin?
      render_403 unless params[:admin]
      #render 403, status: :forbidden unless params[:admin]
      # пока юзер админ (можно передать в params в адресной строке, НЕБЕЗОПАСНО,так не делают), если нет: доступ запрещен
      # current_user.admin
   end

   def show_info
      puts 'Index endpoint'
   end
end