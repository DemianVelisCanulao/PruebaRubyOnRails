class Project < ApplicationRecord
  belongs_to :user

  has_many :task, dependent: :destroy
  validates :title, presence: true
end
