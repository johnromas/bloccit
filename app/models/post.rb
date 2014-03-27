class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  default_scope { order('created_at DESC') }

  # 1. Takes a look at the DB tables ``posts``
  # 2. Looks at the columns and greates getter/setters for each
end
