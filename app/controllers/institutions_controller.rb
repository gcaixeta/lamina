class InstitutionsController < ApplicationController

  def new
    @institution = Institution.new
  end

end
