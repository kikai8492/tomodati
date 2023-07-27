class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    render :new if params[:back]
    if @blog.save
      redirect_to blogs_path flash[:notice] = "投稿しました!"
    else
      render :new
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def confirm
    @blog = Blog.find(params[:id])
    render :new if @blog.invalid?
  end

  def edit
    @blog = current_user.blogs.build(blog_params)
  end

  def update
    @blog = Blog.find(params[:id])
    if
    else
    end
  end
    
  private

  def destroy
    @blog = Blog.find(params[:id])
  end
  
  def blog_params
    params.require(:blog).permit(:content)
  end
end
