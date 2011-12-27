class SessionsController < Devise::SessionsController
  
    # POST /resource/sign_in
    # def create
    #     cookies[:current_list_id] = nil
    #     super
    #   end
    # 
  # GET /resource/sign_out
  # will probably be useful later on navigation, although not currently working properly
  # def destroy
  #   cookies.delete :current_list_id
  #   current_list = nil
  #   super
  # end
    # 
    # def store_location
    #   session[:return_to] = request.fullpath
    # end
    # 
  
end
