# frozen_string_literal: true

class CapoService
  def initialize(original_song:)
    @original_song = original_song
  end

  def optimize
    transpositions = (0..6).to_a.map { |i| Transposition.new(original_song: @original_song, steps_down: i) }
    transpositions_with_caged_keys = transpositions.filter { |transposition| transposition.new_song.keys.any?(&:caged_key?) }
    transpositions_with_caged_keys.sort do |a, b|
      b.new_song.keys.count(&:caged_key?) <=> a.new_song.keys.count(&:caged_key?)
    end
  end
end
