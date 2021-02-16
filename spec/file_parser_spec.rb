# frozen_string_literal: true

RSpec.describe SpaceInvadersRadar::FileParser do
  it "raises error with invalid path" do
    expect do
      described_class.new("invalid/path").call
    end.to raise_error(Errno::ENOENT)
  end

  it "returns an array of space invaders" do
    file_content = described_class.new("spec/fixtures/space_invaders").call
    expect(file_content.first).to eq([%w[- - o - - - - - o - -],
                                      %w[- - - o - - - o - - -],
                                      %w[- - o o o o o o o - -],
                                      %w[- o o - o o o - o o -],
                                      %w[o o o o o o o o o o o],
                                      %w[o - o o o o o o o - o],
                                      %w[o - o - - - - - o - o],
                                      %w[- - - o o - o o - - -]])

    expect(file_content.last).to eq([%w[- - - o o - - -],
                                     %w[- - o o o o - -],
                                     %w[- o o o o o o -],
                                     %w[o o - o o - o o],
                                     %w[o o o o o o o o],
                                     %w[- - o - - o - -],
                                     %w[- o - o o - o -],
                                     %w[o - o - - o - o]])
  end

  it "return an array of radar images" do
    file_content = described_class.new("spec/fixtures/radar_image").call
    expect(file_content.first).to include(%w[- - - - o - - o o - - - - o - - o o
                                             o - - o o o - - - - - - - - - o - -
                                             - o o - o - - - - o o - - - o - - o
                                             - - - - - - - - - o - - - - o - - -
                                             - - - o - - - - - - - - - - - - - -
                                             - - o - - o - - o -])
  end
end