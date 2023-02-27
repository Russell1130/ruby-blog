class UsersController < ApplicationController

    def index
      @users = User.all
    end
  
    def show
      @user = User.find(params[:id])
    end
  
    def new
      @user = User.new
    end
  
    def login
      @user = User.find(user_params.name)
      if @user.password==user_params.password
        redirect_to @user
      else 
        render :login, status: :unprocessable_entity
    end
  end

    def create
      @user = User.new(user_params)
  
      if @user.save
        redirect_to @user
      else
        render :new,  status: :unprocessable_entity
      end
    end
  
    def edit
      @user = User.find(params[:id])
    end
  
    def update
      @user = User.find(params[:id])
  
      if @user.update(user_params)
        redirect_to @user
      else
        render :edit,  status: :unprocessable_entity
      end
    end
  
    def destroy
      @user = User.find(params[:id])
      @user.destroy
  
      redirect_to root_path
    end
  
    private
      def user_params
        params.require(:user).permit(:name, :password, :status)
      end
  end