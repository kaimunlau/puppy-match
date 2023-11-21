class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  enum status: { pending: 0, confirmed: 1, rejected: 2 }

  validates :start_date, presence: true
  validates :end_date, presence: true

  validate :start_date_not_in_past
  validate :end_date_after_start_date

  private

  def start_date_not_in_past
    return if end_date.blank? || start_date.blank?
      if start_date <= Date.current
        errors.add(:start_date, "must be after today")
      end
  end

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?
      if end_date < start_date
        errors.add(:end_date, "must be after the start date")
      end
  end
end
