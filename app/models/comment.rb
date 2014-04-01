class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  after_create :send_favorite_emails

  validates :body, length: { minimum: 5 }, presence: true
end


