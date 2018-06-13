class Post < ApplicationRecord
	has_many :comments, dependent: :destroy
	# @post.comments
	# バリデーション
	validates :title, presence: true, length: { minimum: 3, messeage: 'Too short to post!' }
	validates :body, presence: true
end
