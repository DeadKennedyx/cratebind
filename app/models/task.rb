class Task < ApplicationRecord
  has_many :user_tasks
  has_many :users, through: :user_tasks
  belongs_to :project
  has_many :attachments, dependent: :destroy
  accepts_nested_attributes_for :attachments, reject_if: :all_blank, allow_destroy: true

end
