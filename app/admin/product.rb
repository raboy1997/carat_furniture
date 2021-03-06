ActiveAdmin.register Product do

  index do
    column :id
    column :name
    column :price
    column :dimensions
    column :materials
    column :category
    column :created_at
    column :updated_at
    actions do |product|
    end

  end
  controller do
    def permitted_params
      params.permit product: [ :name, :description, :price, :color, :dimensions, :materials, :category_id, :product_img ]
    end
  end

  form do |f|
    f.inputs "Product Details" do
      f.collection_select :category_id, Category.all, :id, :name, { promt: "Choose a Category" }
      f.input :name, :input_html => {:style => 'width:35%'}
      f.input :description, :input_html => {:style => 'width:70%'}
      f.input :price, :input_html => {:style => 'width:35%'}
      f.input :color
      f.input :dimensions, :input_html => {:style => 'width:35%' }
      f.input :materials, :input_html => {:style => 'width:50%'}
      f.input :product_img, lable: "Фото" , :as => :file, :hint => f.template.image_tag(f.object.product_img_cache)
    end
    f.actions
  end

  show do |ad|
    attributes_table do
      row :category_id
      row :name
      row :price
      row :color
      row :dimensions
      row :materials
      row  :product_img  do
        image_tag(ad.product_img_cache)
      end
    end
  end
end
