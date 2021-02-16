module SpaceInvadersRadar
  class ObjectScanner
    def initialize(invaders_path, radar_screen_path)
      @invaders_path     = invaders_path
      @radar_screen_path = radar_screen_path
    end

    def scan
      (0..mapped_radar_map.width - 1).each do |column_idx|
        (0..mapped_radar_map.height - 1).each do |row_idx|
          mapped_invaders.each do |invader|
            row_range = row_idx..(row_idx + invader.height - 1)
            column_range = column_idx..(column_idx + invader.width - 1)

            scan_window = scan_window(row_range, column_range)
            scorer = SimilarityScorer.new(to_compare: invader.content, compare_target: scan_window.to_a)
            apply_score_result(radar_matrix, row_range, column_range, invader.id) if scorer.valid?
          end
        end
      end

      format_result(radar_matrix)
    end

    private

    attr_reader :invaders_path, :radar_screen_path

    def format_result(radar_matrix)
      radar_matrix.to_a.map { |row| "#{row.join}\n" }.join
    end

    def apply_score_result(radar_matrix, row_range, column_range, found_object_name)
      row_range.to_a.each do |row_idx|
        column_range.to_a.each do |col_idx|
          radar_matrix[row_idx, col_idx] = found_object_name
        end
      end

      radar_matrix
    end

    def build_score_result(invader, scan_window, scorer)
      score_result = { invader_id: "", invader_location: [], score_result: 0.0 }
      score_result[:score_result] = scorer.score
      score_result[:invader_location] = scan_window.to_a
      score_result[:invader_id] = invader.id

      score_result
    end

    def result_map
      @result_map ||= Array.new(mapped_radar_map.height) { Array.new(mapped_radar_map.width, "x") }
    end

    def scan_window(row_range, column_range)
      radar_matrix.minor(row_range, column_range)
    end

    def radar_matrix
      @radar_matrix ||= mapped_radar_map.to_matrix
    end

    def mapped_radar_map
      @mapped_radar_map ||= Models::RadarField.new(content: radar_map[0])
    end

    def mapped_invaders
      @mapped_invaders ||= invaders.map.with_index do |invader, idx|
        Models::Invader.new(id: idx.to_s, content: invader)
      end
    end

    def invaders
      SpaceInvadersRadar::FileParser.new(invaders_path).call
    end

    def radar_map
      SpaceInvadersRadar::FileParser.new(radar_screen_path).call
    end
  end
end