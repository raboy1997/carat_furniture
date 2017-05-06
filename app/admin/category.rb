ActiveAdmin.register Category do


  controller do
    def permitted_params
      params.permit category: [ :name ]
    end
  end

  form do |f|
    f.inputs "Category Details" do
      f.input :name, :input_html => {:style => 'width:35%'}
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
    end
  end

end
