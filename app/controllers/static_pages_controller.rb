class StaticPagesController < ApplicationController
  def home
    @consortiumFrontPage = Consortium.last
  end

  def about
  end

  def conference_info
  end
end
