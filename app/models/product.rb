class Product < ApplicationRecord
  belongs_to :category
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  has_attached_file :p_img, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :p_img, content_type: /\Aimage\/.*\z/
  validates :name, :description, :price, presence: true

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
