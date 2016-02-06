class Micropost < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
   mount_uploader :picture, PictureUploader
     validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

private
	#アップロード画像のサイズを検証
	def picture_size
		if picture_size > 5.megabytes
			errors.add(:picture,"should be less than 5MB")
		end
	end
end
