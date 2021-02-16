# frozen_string_literal: true

module SpaceInvadersRadar
  module Analyzers
    class LevenshteinComparison < Base
      def call
        score
      end

      def valid?
        score >= threshold
      end

      private

      def score
        @score ||= 1 - levenshtein_distance
      end

      def levenshtein_distance
        @levenshtein_distance ||= Levenshtein.normalized_distance(to_comparable_string(to_compare),
                                                                  to_comparable_string(compare_target))
      end

      def to_comparable_string(array)
        array.flatten.join("")
      end
    end
  end
end
