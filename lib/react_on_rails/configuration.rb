module ReactOnRails
  def self.configure
    yield(configuration)
  end

  def self.configuration
    @configuration ||= Configuration.new(
      server_bundle_js_file: "app/assets/javascripts/generated/server.js",
      prerender: false,
      replay_console: true,
      generator_function: false,
      trace: Rails.env.development?
    )
  end

  class Configuration
    attr_accessor :server_bundle_js_file, :prerender, :replay_console, :generator_function, :trace

    def initialize(server_bundle_js_file: nil, prerender: nil, replay_console: nil,
                   generator_function: nil, trace: nil)
      if File.exist?(server_bundle_js_file)
        self.server_bundle_js_file = server_bundle_js_file
      else
        self.server_bundle_js_file = nil
      end

      self.prerender = prerender
      self.replay_console = replay_console
      self.generator_function = generator_function
      self.trace = trace.nil? ? Rails.env.development? : trace
    end
  end
end
