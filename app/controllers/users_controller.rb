class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index 
    @users = User.all

    end
    
    def show 
        @user = User.find(params[:id])  
        @article = Article.all   
    end

    def new
        @user = User.new
    end

    def create 
         @user = User.new(user_params)  
         if @user.save
            session[:user_id] = user.id
            flash[:notice] = "Welcome #{@user.username} to the Alpha Blog, you have signed in successfully"
            redirect_to articles_path
        else    
            render 'new'
          end
    end    
 
    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
           flash[:notice] = "Profile Updations Were Made Successfuly"
           redirect_to articles_path
        else
          render 'edit '
        end
    end 

   private 
     def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end


end


