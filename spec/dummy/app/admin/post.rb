ActiveAdmin.register Post do

  jcropable
  
  form do |f|                         
    f.inputs "Details" do
      f.input :image, as: :jcropable , jcrop_options: {aspectRatio: 1}
    end                      
    f.actions
  end              
  
end
