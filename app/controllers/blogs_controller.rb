class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.find(params[:id])
    return 
    if @blog.save
      redirect_to blogs_path :notice "投稿しました!"
    else
      render :new
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def config

  end

  
  private

  def destroy
  end
  
  def blog_params
    params.require(:blog).permit(:content)
  end
end
