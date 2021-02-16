# frozen_string_literal: true

require "levenshtein"
require "byebug"
require "matrix"
require "thor"

require_relative "space_invaders_radar/analyzers/base"
require_relative "space_invaders_radar/analyzers/levenshtein_comparison"

require_relative "space_invaders_radar/models/base"
require_relative "space_invaders_radar/models/invader"
require_relative "space_invaders_radar/models/radar_field"

require_relative "space_invaders_radar/cli"
require_relative "space_invaders_radar/similarity_scorer"
require_relative "space_invaders_radar/object_scanner"
require_relative "space_invaders_radar/version"
require_relative "space_invaders_radar/file_parser"

module SpaceInvadersRadar
  class Error < StandardError; end
  # Your code goes here...
end
