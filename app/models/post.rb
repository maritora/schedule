class Post < ApplicationRecord
  validates :title, presence: true
  validates :stday, presence: true
  validates :endday, presence: true
  validate :date_before_start
  validate :date_before_finish

  def date_before_start
    unless stday == nil
    errors.add(:stday, "は今日以降のものを選択してください") if stday < Date.today
    end
  end

  def date_before_finish
    return if endday.blank? || stday.blank?
    errors.add(:endday, "は開始日以降のものを選択してください") if endday < stday
  end

end
