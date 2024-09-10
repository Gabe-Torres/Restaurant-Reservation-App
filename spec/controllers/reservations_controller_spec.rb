require 'rails_helper'

RSpec.describe ReservationsController, type: :controller do
  describe '#index' do
    it 'generates future hours correctly' do
      controller_instance = ReservationsController.new
      
      future_hours = controller_instance.send(:generate_future_times)

      now = Time.current.in_time_zone("Central Time (US & Canada)")
      start_hour = now.hour + 1
      start_hour = 0 if start_hour >= 24 

      expected_times = (0..20).flat_map do |i|
        future_date = now + i.days
        date = future_date.beginning_of_day

          (i == 0 ? (start_hour..23) : (0..23)).map do |hour|
            time = date.change(hour: hour, min: 0, sec: 0)
            time.strftime("%B %d, %Y at %I:%M %p") 
        end
      end


      expect(future_hours).to eq(expected_times)
      expect(future_hours.uniq).to eq(future_hours)
    end
  end
end