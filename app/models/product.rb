class Product < ApplicationRecord
  belongs_to :category
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  validates :name, :description, :price, presence: true
  mount_uploader :product_img, ProductImgUploader


  def self.search(params)
    if params
      where(category_id: params[:category].to_i)
      where("description LIKE ?", params[:search]) if params[:search].present?
    else
      all
    end
  end

  private

  # убеждаемся в отсутствии товарных позиций, ссылающихся на данный товар
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'существуют товарные позиции')
      return false
    end
  end

end
