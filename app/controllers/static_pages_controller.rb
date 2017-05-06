class StaticPagesController < ApplicationController
  include CurrentCart
  before_action :set_cart

end
