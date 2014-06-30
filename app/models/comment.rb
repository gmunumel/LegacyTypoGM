require_dependency 'spam_protection'
require 'timeout'

class Comment < Feedback
  belongs_to :article
  belongs_to :user
  content_fields :body
  validates_presence_of :author, :body

  attr_accessor :user_agent
  attr_accessor :referrer
  attr_accessor :permalink

  def notify_user_via_email(user)
    if user.notify_via_email?
      EmailNotify.send_comment(self, user)
    end
  end

  def interested_users
    users = User.find_all_by_notify_on_comments(true)
    # XXX: What's this doing here?
    self.notify_users = users
    users
  end

  def default_text_filter
    blog.comment_text_filter.to_text_filter
  end

  def feed_title
    "Comment on #{article.title} by #{author}"
  end
  
  # added by gabriel muñumel
  # function to merge two comments
  def self.merge(id, merge_id)
    com_merge = self.find_by_article_id(merge_id)
    self.create com_merge.update(article_id: id) if not com_merge.blank?
  end

  protected

  def article_allows_feedback?
    return true if article.allow_comments?
    errors.add(:article, "Article is not open to comments")
    false
  end

  def originator
    author
  end

  def content_fields
    [:body]
  end
end
