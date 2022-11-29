class User < ApplicationRecord
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :assigns, dependent: :destroy
  has_many :groups, through: :assigns, source: :group
  attr_accessor :group_id
end
