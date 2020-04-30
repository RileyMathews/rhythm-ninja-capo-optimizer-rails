# frozen_string_literal: true

class Song
  attr_reader :keys

  def initialize(keys:)
    @keys = keys
  end

  def transpose_down(half_steps:)
    new_keys = keys.map { |key| key.transpose_down half_steps: half_steps }
    self.class.new(keys: new_keys)
  end

  def transpose_up(half_steps:)
    new_keys = keys.map { |key| key.transpose_up half_steps: half_steps }
    self.class.new(keys: new_keys)
  end
end
