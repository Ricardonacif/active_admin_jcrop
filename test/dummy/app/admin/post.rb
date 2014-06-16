ActiveAdmin.register Post do

  jcropable
  
  form do |f|                         
    f.inputs "Details" do
      f.input :image, as: :jcrop
    end                      
    f.actions
  end              
  
end
