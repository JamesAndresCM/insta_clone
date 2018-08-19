class Pic < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates_presence_of :title
  validates_presence_of :description
  belongs_to :user
  acts_as_votable

  def self.user_pics
      joins(:user).select(:email, :title, :description, :image,:id, :created_at).order(created_at: :desc)
  end
end
