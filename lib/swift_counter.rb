# frozen_string_literal: true

require_relative "swift_counter/version"
require "swift_counter/swift_counter"

module SwiftCounter
  class Counter
    alias_method :_native_initialize, :initialize

    def initialize(initial_count = 0, step = 1)
      _native_initialize(initial_count, step)
    end

    def decrement
      self.count -= self.step
    end

    def reset(new_count = 0)
      self.count = new_count
    end
  end
end
