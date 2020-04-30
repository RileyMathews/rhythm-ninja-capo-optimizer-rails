# frozen_string_literal: true

class Key
  INDEX_TO_ROOT = {
    0 => 'A',
    1 => 'A#',
    2 => 'B',
    3 => 'C',
    4 => 'C#',
    5 => 'D',
    6 => 'D#',
    7 => 'E',
    8 => 'F',
    9 => 'F#',
    10 => 'G',
    11 => 'G#'
  }.freeze

  CAGED_KEYS = %w[C A G E D].freeze

  attr_reader :chromatic_index, :root

  class << self
    def from_root(root)
      chromatic_index = INDEX_TO_ROOT.key(root)
      raise ArgumentError, "#{root} is not a valid key" if chromatic_index.nil?

      new(chromatic_index, root)
    end

    def from_chromatic_index(index)
      root = INDEX_TO_ROOT[index]
      raise ArgumentError, "#{index} is not a valid index" if root.nil?

      new(index, root)
    end
  end

  def caged_key?
    CAGED_KEYS.include? root
  end

  def transpose_up(half_steps:)
    new_index = chromatic_index + half_steps
    eleven_base_index = new_index % 12
    Key.from_chromatic_index(eleven_base_index)
  end

  def transpose_down(half_steps:)
    new_index = chromatic_index - half_steps
    eleven_base_index = new_index.negative? ? new_index + 12 : new_index
    Key.from_chromatic_index(eleven_base_index)
  end

  private

  def initialize(chromatic_index, root)
    @chromatic_index = chromatic_index
    @root = root
  end
end
