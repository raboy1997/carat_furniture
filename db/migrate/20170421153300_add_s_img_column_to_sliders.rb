class AddSImgColumnToSliders < ActiveRecord::Migration[5.0]
  def self.up
    change_table :sliders do |f|
      f.has_attached_file :s_img
    end
  end

  def self.down
    drop_attached_file :sliders , :s_img
  end
end
