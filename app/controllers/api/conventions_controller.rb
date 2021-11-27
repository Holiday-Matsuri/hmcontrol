class Api::ConventionsController < ApplicationController
  def show
    @convention = Convention.active.first
  end  
end