require 'rails_helper'

RSpec.describe Post, type: :model do
  it "is not empty" do
    post = Post.new(content: "")
    expect(post.valid?).to be false
  end
end
