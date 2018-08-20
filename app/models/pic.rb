class Pic < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates_processing_of :image
  validates_presence_of :title, message: "Put some title please!"
  validates_presence_of :description, message: "Put some description please!"
  belongs_to :user
  acts_as_votable

  def self.user_pics
      joins(:user).select(:email, :title, :description, :image,:id, :created_at).order(created_at: :desc)
  end
end
