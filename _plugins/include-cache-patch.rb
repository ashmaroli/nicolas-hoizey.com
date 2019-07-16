# frozen_string_literal: true

require "digest/md5"

module JekyllIncludeCache
  class Tag < Jekyll::Tags::IncludeTag
    def render(context)
      path   = path(context)
      params = parse_params(context) if @params
      key = key(path, params)
      return unless path

      if JekyllIncludeCache.cache.key?(key)
        JekyllIncludeCache.cache[key]
      else
        JekyllIncludeCache.cache[key] = super
      end
    end

    private

    def path(context)
      site   = context.registers[:site]
      file   = render_variable(context) || @file
      locate_include_file(context, file, site.safe)
    end

    def key(path, params)
      elements = "#{path}#{params}"
      Digest::MD5.hexdigest(elements)
    end
  end
end
