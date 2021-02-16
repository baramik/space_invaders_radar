RSpec.shared_examples "radar_model" do
  describe "#width" do
    it "returns width property" do
      result = described_class.new(id: "", content: [[1, 2, 2]])

      expect(result.width).to eq(3)
    end
  end

  describe "#height" do
    it "returns height property" do
      result = described_class.new(id: "", content: [[1, 2, 2]])

      expect(result.height).to eq(1)
    end
  end
end