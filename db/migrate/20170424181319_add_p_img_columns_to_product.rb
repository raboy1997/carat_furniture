class AddPImgColumnsToProduct < ActiveRecord::Migration[5.0]
  def self.up
    change_table :products do |f|
      f.has_attached_file :p_img
    end
  end

  def self.down
    drop_attached_file :products, :p_img
  end
end
