class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
    
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
    @blog = current_user.blogs.build(blog_params)
    # @blog = Blog.find(params[:id])
    render :new if @blog.invalid?
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    render :new if params[:back]
    if @blog.update(blog_params)
      redirect_to blogs_path 
    else
      render :new
    end
  end
    
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    if @blog.destroy
      redirect_to blogs_path flash[:notice] = "削除しました!"
    end
  end
  private

  def blog_params
    params.require(:blog).permit(:content, :image, :image_cache)
  end
end
