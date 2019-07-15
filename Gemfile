source 'https://rubygems.org'

# gem 'jekyll', git: 'https://github.com/jekyll/jekyll.git', ref: 'refs/pull/7136/head'
# gem 'jekyll', git: 'https://github.com/jekyll/jekyll.git'

if ENV['JEKYLL_VERSION']
  gem 'jekyll', ENV['JEKYLL_VERSION']
elsif ENV['JEKYLL_EDGE']
  gem 'jekyll', github: 'jekyll/jekyll'
else
  gem 'jekyll'
end

gem 'memory_profiler'

gem 'liquid-c'
gem 'yt'
gem 'autoprefixer-rails'
gem 'uglifier'
gem 'hash-joiner'

group :jekyll_plugins do
  gem 'jekyll-algolia'
  gem 'jekyll-archives'
  gem 'jekyll-assets'
  gem 'jekyll-cloudinary' # :path => '/Users/nhoizey/Dropbox/Personnel/Devs/_jekyll-plugins/jekyll-cloudinary/'
  gem 'jekyll-firstimage'
  gem 'jekyll-include-cache'
  gem 'jekyll-microtypo'
  gem 'jekyll-postfiles'
  gem 'jekyll-tagging'
  gem 'jekyll-webmention_io'
  gem 'liquid-md5'
end
