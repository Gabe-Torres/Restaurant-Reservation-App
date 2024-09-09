# == Schema Information
#
# Table name: reservations
#
#  id               :bigint           not null, primary key
#  name             :string
#  party_size       :integer
#  reservation_time :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Reservation < ApplicationRecord
  has_many :reservation_tables
  has_many :tables, through: :reservation_tables

  validates :name, presence: true
  validates :party_size, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :reservation_time, presence: true

  def reserve_tables
    table = Table.available_table(party_size, reservation_time)

    if table
      self.tables << table
      true
    else
      false
    end
  end

  def formatted_reservation_time
    reservation_time.strftime("%B %d, %Y at %I:%M %p") if reservation_time.present?
  end
end
