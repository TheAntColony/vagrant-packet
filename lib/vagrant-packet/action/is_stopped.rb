# frozen_string_literal: true

module VagrantPlugins
  module Packet
    module Action
      # This can be used with "Call" built-in to check if the machine
      # is stopped and branch in the middleware.
      class IsStopped
        def initialize(app, _env)
          @app = app
        end

        def call(env)
          env[:result] = env[:machine].state.id == :inactive
          @app.call(env)
        end
      end
    end
  end
end
