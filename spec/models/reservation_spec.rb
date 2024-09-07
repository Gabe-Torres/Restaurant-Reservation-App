require 'rails_helper'

RSpec.describe Reservation , type: :model do
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
end