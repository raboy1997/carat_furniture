class ProductsController < ApplicationController
  include CurrentCart
  before_action :set_cart, :kind

  def new
    @product = Product.new
  end

  def index
    @categories = Category.all
    if params[:categories].blank?
      @products = Product.search(params[:search])
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @products }
        format.js
      end
    else
      @products = Product.search(params[:search]).where(category_id: @category_id)
      @category_id = Category.find_by(name: params[:category_id])
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @products}
        format.js
      end
    end
  end

  def products_index
    @sliders = Slider.all
    @products = Product.last(4)
  end

  def show
    @product = Product.find(params[:id])
  end

  def show_products_category
    @categories = Category.all
    if params[:category].blank?
      @products = Product.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @products = Product.where(category_id: @category_id).order("created_at DESC")
    end
  end

  def search
    @categories = Category.all
    @products = Product.where(name: params[:search] , category_id: params[:category].to_i)
  end

  def create
    @product = Product.create(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
      else
        format.html {render @new}
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
      else
        format.html {render @edit}
      end
    end
  end

  def kind
    @kind = Category.last(5)
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :priсe, :color, :dimensions, :materials, :p_img, :category_id)
  end
end
