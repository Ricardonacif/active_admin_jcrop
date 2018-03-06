window.active_admin_jcrop =
  start: ->
    if $('.crop_modal_open').length
      $('.crop_modal_open').click ->
        content = $(this).parent().find('.crop_modal_content').clone()
        image = content.find('img.cropping_image')
        active_admin_jcrop.buttons_text =
          save_cropped_image: image.data('translateSaveCroppedImage')
          cancel: image.data('translateCancel')
        active_admin_jcrop.cropper =
          object_class: image.data('objectClass')
          object_id: image.data('objectId')
          crop_field: image.data('cropField')
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
          buttons: [
            {
              text: active_admin_jcrop.buttons_text.save_cropped_image
              click: ->
                submitButton = $('input[type="submit"]')[0]
                submitButton.disabled = true
                previousValue = submitButton.value
                submitButton.value = 'Cropping image...'
                text: 'aews'
                cropper = active_admin_jcrop.cropper
                $.ajax
                  type: 'PUT'
                  url: cropper.jcropper_url
                  data:
                    image_data: cropper
                  success: ->
                    location.reload();
                    submitButton.value = previousValue
                    submitButton.disabled = false
                  error: ->
                    alert('There was an error while cropping the image')
                  $(@).dialog('close')
            }
            {
              text: active_admin_jcrop.buttons_text.cancel
              click: ->
                $(@).dialog('close').remove()

            }
          ]
        options = $.extend {}, image.data('jcropOptions')
        options.onSelect = (coords) ->
          update_cropper(coords)
          if image.data('jcropOptions').showDimensions
            content.find('.crop_modal_dimensions').first().text("#{coords.w}x#{coords.h}")
          if fn = image.data('jcropOptions').onSelect
            if typeof fn is 'string'
              window[fn] coords
            else if typeof fn is 'function'
              fn coords
          return
        options.onChange = (coords) ->
          update_cropper(coords)
          if image.data('jcropOptions').showDimensions
            content.find('.crop_modal_dimensions').first().text("#{coords.w}x#{coords.h}")
          if fn = image.data('jcropOptions').onChange
            if typeof fn is 'string'
              window[fn] coords
            else if typeof fn is 'function'
              fn coords
          return
        options.onRelease = ->
          if fn = image.data('jcropOptions').onRelease
            if typeof fn is 'string'
              window[fn] coords
            else if typeof fn is 'function'
              fn coords
          return
        image.Jcrop(options)
        return

      update_cropper = (coords) ->
        active_admin_jcrop.cropper.crop_x = coords.x
        active_admin_jcrop.cropper.crop_y = coords.y
        active_admin_jcrop.cropper.crop_w = coords.w
        active_admin_jcrop.cropper.crop_h = coords.h
        return
      return

$ ->
  active_admin_jcrop.start()
