jQuery ->
  ActiveAdminJcrop: ->
  $('.crop_modal_open').click ->
    content = $(this).parent().find('.crop_modal_content').clone()
    image = content.find('img.cropping_image')
    cropper = {
      object_class: image.data('object_class'),
      object_id: image.data('object_id'),
      field: image.data('field')
      }
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
          $(@).dialog('close')
        Cancel: ->
          $(@).dialog('close').remove()
      image.Jcrop
        onSelect: update_cropper
        onChange: update_cropper
        update: (coords) =>

  update_cropper = (coords, cropper) ->
    console.log(coords)
    console.log(cropper)
    cropper.x = coords.x
    cropper.y = coords.y
    cropper.w = coords.w
    cropper.h = coords.h