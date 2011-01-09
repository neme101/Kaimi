class HomeController < ApplicationController
  def index
    @featured_realties = Realty.featured
  end
end
