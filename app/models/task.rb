class Task < ApplicationRecord
  validates :title, :content, presence: true
  validates :deadline_on, presence: true
  validates :priority, presence: true
  validates :status, presence: true
  belongs_to :user
  enum priority: {low: 0, medium: 1, high: 2}
  enum status: {todo: 0, doing: 1, done: 2}

  scope :sort_created_at, -> { order(created_at: :desc) }
  scope :sort_deadline_on, -> { order(deadline_on: :asc) }
  scope :sort_priority, -> { order(priority: :desc) }

  scope :search_status, -> (status){ where(status: status) }
  scope :search_title, -> (title){ where("title LIKE ?", "%#{title}%") }


end
