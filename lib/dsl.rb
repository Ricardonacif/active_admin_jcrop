module ActiveAdminJcrop
  module DSL
    
    def jcropable
      member_action :jcropper, method: :put do
        resource
        binding.pry
        respond_to do |format|
          format.js { render json: true }
        end
      end
    end


  end
end
