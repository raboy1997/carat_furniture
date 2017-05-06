class CartsController < InheritedResources::Base
  before_action :set_cart, only: [:show, :edit]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  def index
    @carts = Cart.all
  end

  def show
    #set_cart
  end

  def new
    @cart = Cart.new
  end

  def edit
  end

  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @cart = current_cart
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to products_path, notice: 'Теперь ваша корзина пуста!' }
      format.json { head :no_content }
    end
  end

  private
  def set_cart
    @cart = Cart.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    logger.error "Попытка доступа к несуществующей корзине #{params[:id]}"
    redirect_to root_path, notice: "Несуществующая корзина №#{params[:id]}"
  else
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cart }
    end
  end

  def cart_params
    params.require(:cart).permit()
  end

  def invalid_cart
    logger.error "Attempt to access invalid cart #{params[:id]}"
    redirect_to products_path, notice: 'Invalid cart'
  end
end

