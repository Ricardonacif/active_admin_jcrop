module ActiveAdminJcrop
  module ImageHelper

    class <<self
      def crop(img, w, h, x, y)
        processor = img.class.name =~ /^MiniMagick/ ? 'minimagick' : 'rmagick'
        send("#{processor}_crop", img, w, h, x, y)
      end

      def minimagick_crop(img, w, h, x, y)
        geometry = "#{w}x#{h}+#{x}+#{y}"
        img.crop geometry
      end

      def rmagick_crop(img, w, h, x, y)
        img.crop! x.to_i, y.to_i, w.to_i, h.to_i
      end
    end

  end
end
