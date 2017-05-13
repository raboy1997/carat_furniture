class AddSlidersImgToSliders < ActiveRecord::Migration[5.0]
  def change
    add_column :sliders, :sliders_img, :string
  end
end
