# frozen_string_literal: true

class HomeController < ApplicationController
  def get; end

  def optimize
    binding.pry
    render 'get'
  end
end
