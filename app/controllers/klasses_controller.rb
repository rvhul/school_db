class KlassesController < ApplicationController
  def index
    @klass = Klass.all
    @new_klass = Klass.new
  end
end
