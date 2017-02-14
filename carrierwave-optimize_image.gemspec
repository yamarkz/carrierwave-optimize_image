# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "carrierwave/optimize_image/version"

Gem::Specification.new do |spec|
  spec.name          = "carrierwave-optimize_image"
  spec.version       = CarrierWave::OptimizeImage::VERSION
  spec.authors       = ["kazuki YAMAGUCHI"]
  spec.email         = ["y.kazuki0614n@gmail.com"]
  spec.homepage      = "https://github.com/yamakichi/carrierwave-optimize_image"
  spec.description   = %q{A simple image optimize for CarrierWave}
  spec.summary       = %q{Simple optimize CarrierWave via jpegoptim and pngquant}
  spec.license       = "MIT"
  spec.files         = `git ls-files`.split("\n")
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '>= 2.2.0'

  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "mini_magick"
  spec.add_development_dependency "carrierwave"
end
