class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]
  
  def index
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "追加しました！"
      redirect_to categories_path
    else
      @categories = Category.all
      render 'index', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:success] = "更新しました！"
      redirect_to categories_path
    else
      render 'edit', status: :unprocessable_entity
    end
  end
  
  def destroy
    @category.destroy
    redirect_to categories_path
    flash[:success] = "削除しました！"
  end
  
  private
  
  def set_category
    @category = Category.find(params[:id])
  end
  
  def category_params
    params.require(:category).permit(:name)
  end
end