module TrueStack
  class Reporter
    class << self
      def run
        # Setup client connection
        EM.run do
          all_plugins.each do |plugin|
            EM.add_periodic_timer(plugin.quantum) do
              fork do
                # Run the plugin
                response = plugin.execute
                # Send back the response
                send(response)
              end
            end
          end
        end
      end

      def send(response)
        # Client connection
      end

      def all_plugins
        [ ]
      end
    end
  end
end
