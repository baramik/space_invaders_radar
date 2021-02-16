module SpaceInvadersRadar
  module Models
    class Base
      attr_reader :id, :content

      def initialize(id: "", content: [])
        @id = id
        @content = content
      end

      def width
        content.map(&:length).max
      end

      def height
        content.count
      end

      def to_s(separator = "")
        content.flatten.join(separator)
      end

      def to_matrix
        ::Matrix[*content]
      end
    end
  end
end