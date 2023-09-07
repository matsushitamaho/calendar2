class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
    @blog = Blog.new
    @categories = Category.all
  end
  
  def new
    @blog = Blog.new
  end
  
  def show
    @blog = Blog.find(params[:id])
  end
  
  def create
    @blog = Blog.new(blog_parameter)
    if @blog.save
      flash[:success] = "追加しました！"
      redirect_to blogs_path
    else
      render 'index', status: :unprocessable_entity
    end
  end
  
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    flash[:success] = "削除しました！"
    redirect_to blogs_path
  end
  
  def edit
    @blog = Blog.find(params[:id])
    @categories = Category.all
  end
  
  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_parameter)
      flash[:success] = "更新しました！"
      redirect_to blog_path
    else
      render 'edit', status: :unprocessable_entity
    end
  end
  
  private
  
  def blog_parameter
    params.require(:blog).permit(:title, :content, :start_time, :category_id)
  end
end