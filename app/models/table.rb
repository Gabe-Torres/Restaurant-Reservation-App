# == Schema Information
#
# Table name: tables
#
#  id         :bigint           not null, primary key
#  capacity   :integer
#  number     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Table < ApplicationRecord
  has_many :reservation_tables
  has_many :reservations, through: :reservation_tables

  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :number, presence: true
end
