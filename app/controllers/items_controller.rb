class ItemsController < ApplicationController
   
   # layout false                        # позволяет не отрендеривать лайауты
   skip_before_action :verify_authenticity_token
   # какое-то действие, использующееся во многих контроллерах перед 
   # действием самого контроллера (например, найти предмет, юзера или запись: find_item) 
   # или проверить админство (только админ может делать что-то) 
   before_action :find_item, only: %i[show edit update destroy upvote]   
   #before_action :admin?,    only: %i[edit]            
   after_action :show_info,  only: %i[index]

   
   def index                                  # показывает все что есть в базе данных   
      @items = Item.all.order(:id).includes :image 
      # @items = @items.includes(:image)        # пример жадной загрузки (eager loading)

      # примеры поиска по объектам через get (параметры передаются в адресной строке):
      # @items = @items.where('price >= ?', params[:price_from]) if params[:price_from]
      # @items = @items.where('created_at >= ?', 1.day.ago) if params[:today]
      # @items = @items.where('votes_count >= ?', params[:votes_from]) if params[:votes_from]                      
   end

   def create                          # создание одного объекта в базу
      @item = Item.create(items_params)
      if @item.persisted?
         flash[:success] = 'Item was saved'
      redirect_to items_path
     else
      flash.now[:error] = 'Please fill all fields correctly'
      render :new
     end
   end

# RESTful cotrollers (+create)           # show, index - endpoints

   def new                     # рендерит форму которая потом будет посылаться в метод create
      @item = Item.new
   end
                                                                
   #def show                  # показывает один по текущему id                                         
      #render body: 'Page not found', status: 404 unless @item - не нужно так как активирована 404 страница в public
     #end                                                             

   def update                          
      if @item.update(items_params)
         flash[:success] = 'Item was updated'
      redirect_to items_path
      else
         flash.now[:error] = 'Please fill all fields correctly'
         render json: @item.errors, status: :unprocessable_entity
      end
   end                                                           

   #def edit             # при вызове посылается на update
      #render body: 'Page not found', status: 404 unless @item - не нужно так как активирована 404 страница в public
   #end                                                 
                                                                 

   def destroy                        # уничтожает объект
      if @item.destroy.destroyed?
         flash[:success] = 'Item has been deleted'
         # render json: { success: true }
         redirect_to items_path
         # redirect_to '/items'
         # redirect_to 'items/index'   # при рендере (в отличие от редиректа)не происходит 
      else                             # перезагрузки страницы и мы теряем доступ к переменной @items
         flash[:error] = "Item wasn't deleted"
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
      params.require(:item).permit(:name, :price, :description)
   end
      
   def find_item
      # найди айтем у которого ид равен ид айтема который мы передали в парамсах; верни не как массив, а первый элемент
      @item = Item.where(id: params[:id]).first  
      render_404 unless @item 
   end

   def show_info
      puts 'Index endpoint'
   end
end