# Frozen-string-literal: true
# Encoding: utf-8

module Jekyll
  module Assets
    class Tag < Liquid::Tag
      def render(ctx)
        env = ctx.registers[:site].sprockets; args, asset = render_raw(ctx)
        return_or_build(ctx, args: args, asset: asset) do
          HTML.build(args: args, asset: asset, ctx: ctx)
        end
      rescue Sprockets::FileNotFound => e
        e_not_found(e, {ctx: ctx})
      rescue ExecJS::RuntimeError => e
        e_exjs(e, {args: args, ctx: ctx})
      # @note you can --trace to get this same info Handle errors that Sass ships because Jekyll finds
      # error handling hard, and makes it even harder, so we need to ship debug info to the user, or
      # they'll never get it. That's not very good.
      rescue Sass::SyntaxError => e
        e_sass(e, {args: args, ctx: ctx})
      end
    end

    class Logger
      PREFIX = "Assets:"

      def self.with_timed_logging(msg, type: :debug)
        s, t, out = Time.now, nil, yield

        Logger.send(type) do
          format("\n#{msg}", {
            time: "#{t = Time.now - s}s",
          })
        end

        {
          result: out, time: t
        }
      end
    end
  end
end
