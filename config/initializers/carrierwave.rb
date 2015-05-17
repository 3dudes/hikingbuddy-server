CarrierWave.configure do |config|
  config.asset_host = "http://black-comet-58-226236.euw1.nitrousbox.com:3000/"
end

module CarrierWave
  module Processing
    module MiniMagick
      # Strips out all embedded information from the image
      #
      #   process :strip
      #
      def strip
        manipulate! do |img|
          img.strip
          img = yield(img) if block_given?
          img
        end
      end

      # Reduces the quality of the image to the percentage given
      #
      #   process :quality => 90
      #
      def quality(percentage)
        manipulate! do |img|
          img.quality(percentage.to_s)
          img = yield(img) if block_given?
          img
        end
      end

      # Sets the colorspace of the image to the specified value.
      #
      #   process :colorspace => :rgb # force rgb
      #   process :colorspace => :cmyk # force cmyk
      #
      def colorspace(cs)
        manipulate! do |img|
          img.combine_options do |c|
            case cs.to_sym
            when :rgb
              c.colorspace "sRGB"
            when :cmyk
              c.colorspace "CMYK"
            end
          end
          img = yield(img) if block_given?
          img
        end
      end

      # reduce image noise and reduce detail levels
      #
      #   process :blur => [0, 8]
      #
      def blur(radius, sigma)
        manipulate! do |img|
          img.blur "#{radius}x#{sigma}"
          img = yield(img) if block_given?
          img
        end
      end

      # Auto-orients the image
      #
      #   process :auto_orient
      def auto_orient
        manipulate! do |img|
          img.auto_orient
          img
        end
      end

      # Resize and crop the image
      def resize_and_crop(size)
        manipulate! do |image|
          if image[:width] < image[:height]
            remove = ((image[:height] - image[:width])/2).round
            image.shave("0x#{remove}")
          elsif image[:width] > image[:height]
            remove = ((image[:width] - image[:height])/2).round
            image.shave("#{remove}x0")
          end
          image.resize("#{size}x#{size}")
          image
       end
      end
    end
  end
end
