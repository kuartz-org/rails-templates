# frozen_string_literal: true

class TailwindColor
  COLORS = YAML.load_file(Rails.root.join("lib", "tailwind_color", "tailwind_colors.yml")).freeze

  def initialize(color, number = 500)
    @color = color
    @number = number
  end

  def to_hex
    COLORS[color.to_s][number]
  end

  private

  attr_reader :color, :number
end
