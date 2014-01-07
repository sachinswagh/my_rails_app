class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
		#@users=User.all
	end

	def create
		@user = User.new(params[:user].permit(:user_name,:email))
 
	  if @user.save
	    redirect_to @user
	  else
	    render 'new'
	  end
	end

  	def edit
	  @user = User.find(params[:id])
	end

	def update
	  @user = User.find(params[:id])
	 
	  if @user.update(params[:user].permit(:user_name,:email))
	    redirect_to @user
	  else
	    render 'edit'
	  end
	end

	def destroy
	  @user = User.find(params[:id])
	  @user.destroy
	 
	  redirect_to users_path
	end

end