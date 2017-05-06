ActiveAdmin.register Slider do

  controller do
    def permitted_params
      params.permit slider: [ :s_img ]
    end
  end

  form do |f|
    f.inputs "Додавання фото до слайдера на головній сторінці" do
      f.input :s_img, lable: "Фото" , :as => :file, :hint => f.template.image_tag(f.object.s_img.url(:thumb))
    end
    f.actions
  end

  show do |ad|
    attributes_table do
      row  :s_img  do
        image_tag(ad.s_img.url(:thumb))
      end

    end
  end

end
