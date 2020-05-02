# frozen_string_literal: true

class Transposition
  attr_reader :original_song, :new_song, :steps_down

  def initialize(original_song:, steps_down:)
    @original_song = original_song
    @steps_down = steps_down
    @new_song = original_song.transpose_down half_steps: steps_down
  end

  def key_mappings
    @original_song.keys.each_with_index.map do |key, i|
      { original_key: key.root, new_key: @new_song.keys[i].root }
    end
  end
end
