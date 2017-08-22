# frozen_string_literal: true

module CarrierWave
  module OptimizeImage
    module ImageOptimizer
      class << self
        def optimize(path, opts = {})
          raise NotFoundPngquant if `which pngquant` == ""
          raise NotFoundJpegoptim if `which jpegoptim` == ""
          optimize_for(path, opts)
        end

        private

          def optimize_for(path, opts)
            case mimetype(path)
              when "jpeg" then optimize_jpg(path, opts)
              when "png"  then optimize_png(path, opts)
            end
          end

          def mimetype(path)
            IO.popen(["file", "--brief", "--mime-type", path], in: :close, err: :close) { |io| io.read.chomp.sub(/image\//, "") }
          end

          def system!(*args)
            system(*args) || abort("\n== Command #{args} failed ==")
          end

          def optimize_png(path, opts = {})
            options = { verbose: false, quality: 100 }.merge!(opts)
            quality = (0..100).include?(options[:quality]) ? options[:quality] : 100
            vo = options[:verbose] ? " --verbose" : "--quiet"
            path.gsub!(/([\(\)\[\]\{\}\*\?\\])/, '\\\\\1')
            system! "pngquant --quality #{quality} #{vo} #{path}"
          end

          def optimize_jpg(path, opts = {})
            options = { verbose: false, quality: 100 }.merge!(opts)
            quality = (0..100).include?(options[:quality]) ? options[:quality] : 100
            vo = options[:verbose] ? "--verbose" : "--quiet"
            path.gsub!(/([\(\)\[\]\{\}\*\?\\])/, '\\\\\1')
            system! "jpegoptim --force --max=#{quality} #{vo} #{path}"
          end
      end
    end
  end
end
