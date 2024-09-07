require 'rails_helper'

RSpec.describe Table, type: :model do
  context 'Associations' do
    it "has associations" do
      should have_many(:reservation_tables)
      should have_many(:reservations).through(:reservation_tables)
    end
  end

  context 'Validations' do
    it "has validations" do
      should validate_presence_of(:capacity)
      should validate_numericality_of(:capacity).only_integer.is_greater_than(0)
      should validate_presence_of(:number)
    end
  end
end