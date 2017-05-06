class CategoriesController < ApplicationController
  include CurrentCart
  before_action :set_cart
  def new
    @category = Category.new
  end

  def show
  end

  def create
    @category = Category.create(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
      else
        format.html {render @new}
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
      else
        format.html {render @edit}
      end
    end
  end

  private

  def category_params
    prams.require(:category).permit(:name)
  end
end
