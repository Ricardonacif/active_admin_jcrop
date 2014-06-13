window.active_admin_jcrop =
  start: ->
    if $('.crop_modal_open').length
      $('.crop_modal_open').click ->
        content = $(this).parent().find('.crop_modal_content').clone()
        image = content.find('img.cropping_image')
        active_admin_jcrop.cropper =
          object_class: image.data('objectClass')
          object_id: image.data('objectId')
          field: image.data('field')
          jcropper_url: image.data('jcropperUrl')

        $(content).appendTo('body').dialog
          width: content.width() 
          height: content.height() + 100
          modal: true
          position: {
             my: "center",
             at: "center",
             of: window
          }
          buttons:
            'Crop Image': ->
              
              cropper = active_admin_jcrop.cropper
              $.ajax
                type: 'PUT'
                url: cropper.jcropper_url
                data:
                  image_data: cropper
                success: ->
                  console.log('nois')
                error: ->
                  alert('There was an error while cropping the image')
                $(@).dialog('close')
            Cancel: ->
              $(@).dialog('close').remove()
          
          image.Jcrop
            onSelect: update_cropper
            onChange: update_cropper

      update_cropper = (coords) ->
        active_admin_jcrop.cropper.x = coords.x
        active_admin_jcrop.cropper.y = coords.y
        active_admin_jcrop.cropper.w = coords.w
        active_admin_jcrop.cropper.h = coords.h

$ ->
  active_admin_jcrop.start()