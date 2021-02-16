# frozen_string_literal: true

module SpaceInvadersRadar
  class SimilarityScorer
    DEFAULT_THRESHOLD = 0.85
    AVAILABLE_ANALYZERS = { levenshtein: SpaceInvadersRadar::Analyzers::LevenshteinComparison }.freeze

    def initialize(to_compare:, compare_target:, threshold: DEFAULT_THRESHOLD, analyzer: :levenshtein)
      raise ArgumentError, "wrong analyzer" unless AVAILABLE_ANALYZERS[analyzer]

      @threshold      = threshold
      @analyzer       = AVAILABLE_ANALYZERS[analyzer]
      @to_compare     = to_compare
      @compare_target = compare_target
    end

    def valid?
      concrete_analyzer.valid?
    end

    def score
      @score ||= concrete_analyzer.call
    end

    private

    attr_reader :analyzer, :threshold, :compare_target, :to_compare

    def concrete_analyzer
      analyzer.new(to_compare: to_compare, compare_target: compare_target, threshold: threshold)
    end
  end
end
