# frozen_string_literal: true

RSpec.describe SpaceInvadersRadar::CLI do
  it "fails with no arguments" do
    expect do
      subject.scan
    end.to raise_error(ArgumentError)
  end

  it "works with no flags" do
    output = capture(:stdout) do
      subject.scan("spec/fixtures/space_invaders", "spec/fixtures/radar_image")
    end
    reference = File.read("spec/fixtures/result_image")
    expect(output).to eq(reference)
  end

  it "accept algorithm threshold flag" do
    subject.options = { threshold: 0.85 }

    output = capture(:stdout) do
      subject.scan("spec/fixtures/space_invaders", "spec/fixtures/radar_image")
    end
    reference = File.read("spec/fixtures/result_image")
    expect(output).to eq(reference)
  end

  it "fail with wrong algorithm option" do
    subject.options = { analyzer: :invalid }

    expect do
      capture(:stderr) do
        subject.scan("spec/fixtures/space_invaders", "spec/fixtures/radar_image")
      end
    end.to raise_error(SystemExit)
  end
end
