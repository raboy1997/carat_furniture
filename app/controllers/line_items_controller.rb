class LineItemsController < InheritedResources::Base
  include CurrentCart
  before_action :set_cart, only: [:create]

  def index
    @line_items = LineItem.all
  end

  def show
  end

  def new
    @line_item = LineItem.new
  end

  def edit
  end

  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.cart }
        format.json { render action: 'show', status: :created, location: @line_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @line_item.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @line_item.quantity -= 1
    if @line_item.quantity < 1
      @line_item.destroy
    else
      @line_item.save
    end
    respond_to do |format|
      format.js do
        @cart = current_cart

      end
      format.html do
        redirect_to store_url, notice: I18n.t('activerecord.attributes.line_item.messages.delete_successful')
      end
      format.json { head :no_content }
    end
  end

  private

    def line_item_params
      params.require(:line_item).permit(:product_id)
    end
end

