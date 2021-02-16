# frozen_string_literal: true

RSpec.describe SpaceInvadersRadar::SimilarityScorer do

  describe "#score" do
    it "returns area score" do
      to_compare = %w[0 - - -]
      compare_target = %w[0 - - -]
      result = described_class.new(to_compare: to_compare, compare_target: compare_target).score

      expect(result).to eq(1.0)
    end

    it "raises Argument error if threshold greater than 1" do
      to_compare = %w[0 - - -]
      compare_target = %w[0 - - -]

      expect do
        described_class.new(to_compare: to_compare, compare_target: compare_target, threshold: 2).score
      end.to raise_error(ArgumentError)
    end

    it "raises Argument error if threshold less than DEFAULT_THRESHOLD" do
      to_compare = %w[0 - - -]
      compare_target = %w[0 - - -]

      expect do
        described_class.new(to_compare: to_compare,
                            compare_target: compare_target,
                            threshold: described_class::DEFAULT_THRESHOLD - 0.5).score
      end.to raise_error(ArgumentError)
    end
  end
  describe "#valid?" do
    it "returns true when score is more or equals threshold" do
      to_compare = %w[0 - - -]
      compare_target = %w[0 - - -]
      result = described_class.new(to_compare: to_compare, compare_target: compare_target).valid?

      expect(result).to eq(true)
    end
    it "returns false when score is less than threshold" do
      to_compare = %w[0 - - -]
      compare_target = %w[0 0 0 0]
      result = described_class.new(to_compare: to_compare, compare_target: compare_target).valid?

      expect(result).to eq(false)
    end
  end
end
