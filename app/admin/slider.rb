ActiveAdmin.register Slider do

  controller do
    def permitted_params
      params.permit slider: [ :sliders_img ]
    end
  end

  form do |f|
    f.inputs "Додавання фото до слайдера на головній сторінці" do
      f.input :sliders_img, lable: "Фото" , :hint => f.template.image_tag(f.object.sliders_img_url)
    end
    f.actions
  end

  show do |ad|
    attributes_table do
      row  :sliders_img  do
        image_tag(ad.sliders_img_url)
      end

    end
  end

end
