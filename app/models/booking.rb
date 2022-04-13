class Booking < ApplicationRecord
  has_many :booking_hotels
  has_many :hotels, through: :booking_hotels

  has_many :booking_users
  has_many :users, through: :booking_users

  validate :start_end_check
  def start_end_check
    if start_date.nil?
      errors.add(:start_date, "を入力してください。")
    elsif end_date.nil?
      errors.add(:end_date, "を入力してください。")
    elsif end_date < start_date
      errors.add(:end_date, "は開始日より前の日付は登録できません。")
    end
  end

  validate :start_before_today
  def start_before_today
    errors.add(:start_date, "は今日より前の日付は登録できません。") if start_date.nil? || start_date < Date.today
  end


  validates :person_num, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}

end
