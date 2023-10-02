# frozen_string_literal: true

# Available colors: https://tailwindcss.com/docs/customizing-colors#default-color-palette
# Usage:
# TailwindColor[:blue, 500].to_hex => "#3b82f6"
class TailwindColor
  COLORS = YAML.load_file(Rails.root.join("lib", "tailwind_color", "tailwind_colors.yml")).freeze
  DEFAULT_NUMBER = 500

  def self.[](color, number = DEFAULT_NUMBER)
    new(color, number)
  end

  def initialize(color, number = DEFAULT_NUMBER)
    @color = color
    @number = number
  end

  def to_hex
    COLORS[color.to_s][number]
  end

  private

  attr_reader :color, :number
end
