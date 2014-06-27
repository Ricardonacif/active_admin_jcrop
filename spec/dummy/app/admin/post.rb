ActiveAdmin.register Post do

  jcropable
  
  form do |f|                         
    f.inputs "Details" do
      f.input :image, as: :jcropable , jcrop_options: Post::DEFAULT_CROP_OPTIONS
    end                      
    f.actions
  end              
  
end
