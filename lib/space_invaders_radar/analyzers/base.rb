# frozen_string_literal: true

module SpaceInvadersRadar
  module Analyzers
    class Base
      DEFAULT_THRESHOLD = 0.85

      def initialize(to_compare:, compare_target:, threshold: DEFAULT_THRESHOLD)
        raise ArgumentError, "comparisons should be array" unless to_compare.is_a?(Array) || compare_target.is_a?(Array)
        raise ArgumentError, "incorrect threshold" if threshold < DEFAULT_THRESHOLD || threshold > 1.0

        @threshold      = threshold
        @to_compare     = to_compare
        @compare_target = compare_target
      end

      def call
        raise NotImplementedError
      end

      private

      attr_reader :to_compare, :compare_target, :threshold
    end
  end
end