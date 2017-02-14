# CarrierWave OptimizeImage

This gem allows you to simply optimize [CarrierWave](https://github.com/carrierwaveuploader/carrierwave) images via jpegoptim or optipng using the image_optimizer gem.

## Installation
Add this line to your application's Gemfile:

**This gem uses the following utilities for optimizing images:**

  - Install for [pngquant](https://github.com/pornel/pngquant)
  - Install for [jpegoptim](https://github.com/tjko/jpegoptim)

Or instal the utilities via homebrew:

    $ brew install pngquant jpegoptim

Add this line to your application's Gemfile:

```ruby
gem "carrierwave-optimize_image"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install carrierwave-optimize_image


## Usage

To add image optimization to your CarrierWave uploader, first include the module:

```ruby
  class ImageUploader < CarrierWave::Uploader::Base
    include CarrierWave::OptimizeImage
    ...
  end
```

Then apply to all versions via:

```ruby
  class ImageUploader < CarrierWave::Uploader::Base
    include CarrierWave::OptimizeImage
    ...
    process :optimize
  end
```

Or to a single image version via:

```ruby
  class ImageUploader < CarrierWave::Uploader::Base
    ...
    version :thumbnail do
      process :optimize
    end
  end
```

Pass an optional quality parameter to target a specific lossy JPG and PNG quality level (0-100)

```ruby
  class ImageUploader < CarrierWave::Uploader::Base
    version :thumbnail do
      process optimize: [{ quality: 60 }]
    end
  end
```

**Quiet Mode**

Pass an optional ```quiet``` parameter to compress images without logging progress.

```ruby
  class ImageUploader < CarrierWave::Uploader::Base
    ...
    version :thumbnail do
      process optimize: [{ quiet: true }]
    end
  end
```



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b new_feature_branch`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin new_feature_branch`)
5. Create new Pull Request
