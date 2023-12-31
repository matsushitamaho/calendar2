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
      @blogs = Blog.all
      @categories = Category.all
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
      @categories = Category.all
      render 'edit', status: :unprocessable_entity
    end
  end
  
  def search
    @keyword = params[:keyword]
    if @keyword.present?
      @blogs = Blog.where("title LIKE :keyword OR content LIKE :keyword", keyword: "%#{@keyword}%").order(start_time: :asc)
    else
      @blogs = []
    end
  end
  
  private
  
  def blog_parameter
    params.require(:blog).permit(:title, :content, :start_time, :category_id)
  end
end