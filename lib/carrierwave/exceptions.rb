# frozen_string_literal: true

module CarrierWave::OptimizeImage
  class OptimizeError < StandardError; end
  class NotFoundPngquant < OptimizeError; end
  class NotFoundJpegoptim < OptimizeError; end
end
