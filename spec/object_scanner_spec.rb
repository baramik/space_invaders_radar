# frozen_string_literal: true

RSpec.describe SpaceInvadersRadar::ObjectScanner do
  describe "#scan" do
    it "returns a radar map with found objects" do
      result = described_class.new("spec/fixtures/space_invaders",
                                   "spec/fixtures/radar_image").scan
      expected_result = File.read("spec/fixtures/result_image")

      expect(result).to eq(expected_result)
    end
  end
end