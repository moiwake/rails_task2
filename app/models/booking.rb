class Booking < ApplicationRecord
  has_many :booking_hotels
  has_many :hotels, through: :booking_hotels

  has_many :booking_users
  has_many :users, through: :booking_users

  validates :start_date, :end_date, presence: true

  validates :person_num, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}

  validate :start_before_end
  def start_before_end
    errors.add(:end_date, "は開始日より前の日付は登録できません。") if start_date.nil? || end_date < start_date
  end

  validate :start_before_today
  def start_before_today
    errors.add(:start_date, "は今日より前の日付は登録できません。") if start_date.nil? || start_date < Date.today
  end

end
