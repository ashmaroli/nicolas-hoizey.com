# frozen_string_literal: true

module Jekyll
  module WebmentionIO
    class WebmentionTag < Liquid::Tag
      def initialize(tag_name, text, tokens)
        super
      end

      def render(context)
        return ''
      end
    end
  end
end
