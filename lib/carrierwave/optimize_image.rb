# frozen_string_literal: true

require "carrierwave/optimize_image/image_optimizer"
require "carrierwave/optimize_image/version"

module CarrierWave
  module OptimizeImage
    def optimize(opts = {})
      ImageOptimizer.optimize(current_path, opts)
    end
  end
end
