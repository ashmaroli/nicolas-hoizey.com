# frozen_string_literal: true

require "open-uri"
require "json"

module Jekyll

  # convert tweet url to embedding html
  class LazyTweetEmbedding
    def get_html(id)
        url = "https://api.twitter.com/1/statuses/oembed.json?id=#{id}"
        JSON.parse(open(url).read, { :symbolize_names => true })[:html]
    end

    def convert(line)
      r = /^https?:\/\/twitter\.com\/[a-zA-Z0-9_]+\/status(es)?\/([0-9]+)\/?$/
      r =~ line ? get_html($~[2]) : line
    end

    def embed(content)
      result = String.new('')
      content.each_line do |line|
        result << convert(line)
      end
      result
    end
  end

  # for markdown, extend oroginal parser's convert method
  module Converters
    class Markdown < Converter
      alias_method :parser_converter, :convert

      def convert(content)
        parser_converter(Jekyll::LazyTweetEmbedding.new.embed(content))
      end
    end
  end

  # for html, extend converter as a plugin
  class EmbeddingTweetIntoHTML < Converter
    safe true
    priority :low

    def matches(ext)
      ext =~ /^\.html$/i
    end

    def output_ext(ext)
      ".html"
    end

    def convert(content)
      Jekyll::LazyTweetEmbedding.new.embed(content)
    end
  end

end
