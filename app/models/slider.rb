class Slider < ApplicationRecord
  has_attached_file :s_img, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :s_img, content_type: /\Aimage\/.*\z/
end
