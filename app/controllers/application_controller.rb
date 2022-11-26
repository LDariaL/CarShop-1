class ApplicationController < ActionController::Base       
    # если мы сюда что-то добавляем, это будет доступно в любом контроллере в нашем приложении

    def render_403
        render file: 'public/403.html', status: :forbidden
    end
    
    def render_404
        render file: 'public/404.html', status: :not_found
    end     

    def admin?
        render_403 unless params[:admin]
        #render 403, status: :forbidden unless params[:admin]
        # пока юзер админ (можно передать в params в адресной строке, НЕБЕЗОПАСНО,так не делают), если нет: доступ запрещен
        # current_user.admin
     end

end
