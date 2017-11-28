class StaticPagesController < ApplicationController
  def home
    @post1 = Post.last
    @post2 = Post.second_to_last
  end

  def about
  end

  def conference_info
  end
end
