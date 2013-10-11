require 'bundler'
Bundler.require :default, :assets

module App
  module Assets
    class Environment
      def self.get(root_path, preprocess = false)
        assets = Sprockets::Environment.new root_path

        # Application assets
        assets.append_path 'assets/stylesheets'
        assets.append_path 'assets/javascripts'

        # Vendor assets
        assets.append_path 'vendor/assets/stylesheets'
        assets.append_path 'vendor/assets/javascripts'


        if preprocess
          assets.css_compressor = YUI.CssCompressor.new
          assets.js_compressor = Uglifier.new
        end

        return assets
      end
    end
  end
end