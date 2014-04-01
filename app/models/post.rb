class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :topic
  has_many :votes, dependent: :destroy

  after_create :create_vote

  mount_uploader :image, ImageUploader

  def up_votes
    self.votes.where(value: 1).count
  end

  def down_votes
    self.votes.where(value: -1).count
  end

  def points
    self.votes.sum(:value).to_i
  end

  def update_rank
    age = (self.created_at - Time.new(1970, 1, 1)) / 86400
    new_rank = points + age

    self.update_attribute(:rank, new_rank)
  end

  default_scope { order('rank DESC') }

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true

  private

  def create_vote
    user.votes.create(value: 1, post: self)
  end

  # 1. Takes a look at the DB tables ``posts``
  # 2. Looks at the columns and greates getter/setters for each
end
