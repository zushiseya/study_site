class Group < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships
  validates :name, presence: true
  validates :description, presence: true
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
end
