# We want to strip undesireable tags (i.e. script, style, iframe) from user
# provided content here, to ensure it cannot be inadvertently run when rendering
# a view. The Sanitize helper in ActionView::Helpers lets us strip any html tag
# that doesn't match a whitelist from posts

class Post < ApplicationRecord
  before_save { self.content = sanitize_content(self.content) }
  default_scope -> { order(created_at: :desc) }
  validates :content, presence: true

  def sanitize_content(content)
    allowed_tags = %w(h1 h2 h3 p strong em a br blockquote ol ul li img)
    allowed_attributes = %w(href src)
    ActionController::Base.helpers.sanitize(content, tags: allowed_tags, attributes: allowed_attributes)
  end
end
