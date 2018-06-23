require 'nokogiri'

module Jekyll
  module MarkdownToTweetFilter

    def markdown_to_tweet(markdown)
      return markdown if markdown.nil?

      tweet = markdown

      # replace \n
      tweet.gsub!(/(\n)/, "\u000a")

      # replace <del>blah blah</del> by b̶̶l̶a̶h̶ ̶b̶l̶a̶h̶
      tweet.gsub!(/<del>([^<]+)<\/del>/) { |del| del.gsub(/<\/?del>/, '').chars.map{|c| "#{c}\u0336"}.join }

      # mentions
      tweet.gsub!(/\[@?([^@\]]+)\]\(https:\/\/twitter\.com\/\1\/?\)/, "@\\1")
      tweet.gsub!(/\[Twitter\]\(https:\/\/twitter\.com\/([^)\/]+)\/?\)/, "@\\1")
      tweet.gsub!(/\[([^\]]+)\]\(https:\/\/twitter\.com\/([^)\/]+)\/?\)/, "@\\2 (\\1)")

      # links
      tweet.gsub!(/\[([^\]]+)\]\(([^)]+)\)/, "\\1 (\\2)")

      tweet
    end
  end
end

Liquid::Template.register_filter(Jekyll::MarkdownToTweetFilter)