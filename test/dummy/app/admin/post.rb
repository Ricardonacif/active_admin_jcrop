ActiveAdmin.register Post do

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :image, :name
  #
  # or
  form do |f|                         
    f.inputs "Details" do
      f.input :name
      # f.input :image, :hint => f.template.image_tag(f.object.image.url(:thumb))
      f.input :image, jcrop: true
      f.input :updated_at, :as => :datepicker
      #f.input :image, jcrop: {option: yeah}

    end                      
    f.actions
  end              
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
