class Restaurant < ActiveRecord::Base

	PAGINATION = 10

	belongs_to :user, dependent: :destroy
	has_many :tables, dependent: :destroy

	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

	validates_presence_of :name, :user_id
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

end
