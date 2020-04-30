# frozen_string_literal: true
require_relative '../services/capo_service'

class HomeController < ApplicationController
  PERMITTED_KEYS = %i[A A# B C C# D D# E F F# G G#].freeze
  def get; end

  def optimize
    key_roots = params.permit(*PERMITTED_KEYS).select { |_k, v| v == '1' }.keys
    keys = key_roots.map { |root| Key.from_root root }
    song = Song.new(keys: keys)
    transposition_options = CapoService.new(original_song: song).optimize
    binding.pry
    render 'get'
  end
end
