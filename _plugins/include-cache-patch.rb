# frozen_string_literal: true

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
  end
end
