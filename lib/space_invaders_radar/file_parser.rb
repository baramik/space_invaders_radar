# frozen_string_literal: true

module SpaceInvadersRadar
  class FileParser
    attr_accessor :path, :entities, :delimiter

    DEFAULT_DELIMITER = "~~~~\n"

    def initialize(path, delimiter: DEFAULT_DELIMITER)
      @path = path
      @entities = []
      @delimiter = delimiter
    end

    def call
      parse_entities
    end

    private

    def parse_entities(delimiter: DEFAULT_DELIMITER)
      file_content = File.read(path)

      return unless file_content

      file_entities = file_content.split(delimiter).map(&:strip).reject(&:empty?)

      file_entities.each do |entity|
        entities << entity.split("\n").map { |entity| entity.split("") }
      end

      entities
    end
  end
end
