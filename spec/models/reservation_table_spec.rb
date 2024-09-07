require 'rails_helper'

RSpec.describe ReservationTable , type: :model do
  context 'Associations' do
    it 'has associations' do
      should belong_to(:reservation)
      should belong_to(:table)
    end
  end
end