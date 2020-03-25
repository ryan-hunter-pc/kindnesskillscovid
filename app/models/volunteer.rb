class Volunteer < ApplicationRecord
  belongs_to :user
  has_many :errands
  has_many :offers

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true

  def full_name
    [first_name, last_name].join(" ")
  end

  def location
    [city, state].join(", ")
  end

  def to_s
    full_name
  end
end
