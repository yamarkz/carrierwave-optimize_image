require "spec_helper"
require "carrierwave/optimize_image/image_optimizer"
require "carrierwave/optimize_image"

class MiniMagickUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include CarrierWave::OptimizeImage
end

describe CarrierWave::OptimizeImage::ImageOptimizer do
  describe "#optimize" do
    let(:sample_jpg_path) { File.join('spec', 'assets', 'sample.jpg') }
    let(:sample_jpg_image) { File.open(sample_jpg_path) }

    let(:sample_png_path) { File.join('spec', 'assets', 'sample.png') }
    let(:sample_png_image) { File.open(sample_png_path) }

    def upload_file(uploader, image)
      uploader.store!(image)
      uploader.manipulate! do |img|
        img
      end
    end

    it "calls the uploader's `current_path` when MiniMagick is used" do
      uploader = MiniMagickUploader.new
      upload_file(uploader, sample_jpg_image)
      expect(CarrierWave::OptimizeImage::ImageOptimizer).to receive(:optimize).with(uploader.current_path, {})
      uploader.optimize
    end

    it "calls `optimize_png` if the .png files MIME type is that of a PNG" do
      uploader = MiniMagickUploader.new
      upload_file(uploader, sample_png_image)
      expect(CarrierWave::OptimizeImage::ImageOptimizer).to receive(:optimize_png).with(uploader.current_path, {})
      uploader.optimize
    end

    it "calls `optimize_jpg` if the .jpg files MIME type is that of a JPEG" do
      uploader = MiniMagickUploader.new
      upload_file(uploader, sample_jpg_image)
      expect(CarrierWave::OptimizeImage::ImageOptimizer).to receive(:optimize_jpg).with(uploader.current_path, {})
      uploader.optimize
    end
  end
end
