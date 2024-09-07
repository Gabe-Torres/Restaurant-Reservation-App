# == Schema Information
#
# Table name: reservation_tables
#
#  id             :bigint           not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  reservation_id :bigint           not null
#  table_id       :bigint           not null
#
# Indexes
#
#  index_reservation_tables_on_reservation_id  (reservation_id)
#  index_reservation_tables_on_table_id        (table_id)
#
# Foreign Keys
#
#  fk_rails_...  (reservation_id => reservations.id)
#  fk_rails_...  (table_id => tables.id)
#
class ReservationTable < ApplicationRecord
  belongs_to :reservation
  belongs_to :table
end
