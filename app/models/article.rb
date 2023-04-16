class Article < ApplicationRecord
  has_many :comments, dependent: :destroy

  VALID_STATUSES = ['public','private','archived']

  validates :title, presence: true
  validates :body, presence: true, length: {minimum: 10}

  validates :status, inclusion: {in: VALID_STATUSES}

  def archived?
    status == 'archived'
  end
end
