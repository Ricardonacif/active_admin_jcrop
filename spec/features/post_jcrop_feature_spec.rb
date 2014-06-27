require 'spec_helper'
require 'phashion'


feature 'Post admin' do

  describe 'Croping modal', js: true do
    
    subject { page }

    background do
      @post = FactoryGirl.create(:post)
      visit "/admin/posts/#{@post.id}/edit"
    end

    elements = {'button to open crop modal' => '.crop_modal_open', 
      'modal div' => '.crop_modal_content', 
      'image to be cropped' => '.cropping_image'
    }

    elements.each_pair do |name, element_class|
      it "should have the #{name} displayed" do 
        expect(page).to have_css(element_class, visible: false)
      end
    end
    
    
    it "should open the crop modal when clicking at the button" do
      modal_classes = '.ui-dialog.ui-widget.ui-widget-content.ui-corner-all.ui-front'
      expect(page).not_to have_css(modal_classes)
      click_link "Crop Image"
      modal = page.find(modal_classes)
      expect(modal).to have_css('img.cropping_image')      
    end

    it "should close the modal when click at cancel" do
      modal_classes = '.ui-dialog.ui-widget.ui-widget-content.ui-corner-all.ui-front'
      click_link "Crop Image"
      click_link "Cancel"
      expect(page).not_to have_css(modal_classes)
    end

    it "should crop the thumb version of the Image" do
      thumb = Phashion::Image.new(MiniMagick::Image.open(@post.image.thumb.path).path) #load copy of image as a temp file
      click_link "Crop Image"
      click_button "Save Cropped Image"
      sleep 3 # wait for the ajax
      cropped_thumb = Phashion::Image.new @post.image.thumb.path
      expect(cropped_thumb.duplicate?(thumb)).to be_falsey      
    end

    it "should pass the options specified at the form to jcrop" do
      new_options = {aspectRatio: 0.5, setSelect: [0, 0, 25, 25]}
      stub_const "Post::DEFAULT_CROP_OPTIONS", new_options
      visit "/admin/posts/#{@post.id}/edit"
      jcrop_attributes = page.find('.cropping_image', visible: false)['data-jcrop-options']
      expect(jcrop_attributes).to be_present
      jcrop_attributes = JSON.parse(jcrop_attributes).symbolize_keys
      expect(jcrop_attributes).to be == new_options
    end
  end
end