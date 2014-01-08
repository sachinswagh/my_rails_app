class MicropostsController < ApplicationController
	def index
    @microposts = Micropost.all
  end

  def show
    @micropost = Micropost.find(params[:id])
  end

  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = Micropost.new(params[:micropost].permit(:content,:user_id))
 
	  if @micropost.save
	    redirect_to @micropost
	  else
	    render 'new'
	  end
  end

  def edit
     @micropost = Micropost.find(params[:id])
  end

  def update
    @micropost = Micropost.find(params[:id])
	 
	  if @micropost.update(params[:micropost].permit(:content,:user_id))
	    redirect_to @micropost
	  else
	    render 'edit'
	  end
  end

  def destroy
    @micropost = Micropost.find(params[:id])
	  @micropost.destroy
	 
	  redirect_to microposts_path
  end
end
