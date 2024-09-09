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
require 'rails_helper'

RSpec.describe Reservation , type: :model do
  before(:each) do
    @reservation_time = Time.current + 1.hour
    @table = Table.create!(capacity: 4, number: "T1")
  end
  
  after(:each) do
    Table.delete_all
    Reservation.delete_all
  end

  context 'Associations' do
    it "has associations" do
      should have_many(:reservation_tables)
      should have_many(:tables).through(:reservation_tables)
    end
  end

  context 'Validations' do
    it "has validations" do
      should validate_presence_of(:name)
      should validate_presence_of(:party_size)
      should validate_numericality_of(:party_size).only_integer.is_greater_than(0)
      should validate_presence_of(:reservation_time)
    end
  end

  describe '#reserve_tables' do
    it 'assigns available tables to the reservation' do
      reservation = Reservation.new(name: "Shane O'Malley", party_size: 2, reservation_time: @reservation_time)
      reservation.reserve_tables
      expect(reservation.tables).to include(@table)
    end

    it 'does not assign tables if none are available' do
      Table.delete_all
      reservation = Reservation.new(name: "Shane O'Malley", party_size: 2, reservation_time: @reservation_time)
      reservation.reserve_tables
      expect(reservation.tables).to be_empty
    end
  end
end
