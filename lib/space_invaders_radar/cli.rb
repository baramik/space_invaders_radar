module SpaceInvadersRadar
  class CLI < Thor
    package_name "space_invaders_scan"
    map "-L" => :list

    desc "scan space_invaders_image_path radar_image_path", "Scans radar image for space invaders"
    option :analyzer, type: :string,  aliases: [:a]
    option :threshold, type: :numeric, aliases: [:t]

    def scan(invaders_path, radar_screen_file)
      threshold = options[:threshold] ? options[:threshold].to_f : 0.85
      analyzer = options[:analyzer] ? options[:analyzer].to_sym : :levenshtein
      result = ObjectScanner.new(invaders_path, radar_screen_file, threshold: threshold, analyzer: analyzer).scan

      puts(result)
    rescue StandardError => e
      warn("ERROR: #{e.message}")

      exit 1
    end

    def self.exit_on_failure?
      true
    end
  end
end