# frozen_string_literal: true

class Transposition
  attr_reader :original_song, :new_song, :steps_down

  def initialize(original_song:, steps_down:)
    @original_song = original_song
    @steps_down = steps_down
    @new_song = original_song.transpose_down half_steps: steps_down
  end
end
