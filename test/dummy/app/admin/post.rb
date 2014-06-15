ActiveAdmin.register Post do

  jcropable
  
  permit_params :image, :name
  #
  # or
  form do |f|                         
    f.inputs "Details" do
      f.input :name
      # f.input :image, :hint => f.template.image_tag(f.object.image.url(:thumb))
      f.input :image, as: :jcrop
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
