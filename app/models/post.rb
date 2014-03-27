class Post < ActiveRecord::Base
  has_many :comments

  # 1. Takes a look at the DB tables ``posts``
  # 2. Looks at the columns and greates getter/setters for each
end
