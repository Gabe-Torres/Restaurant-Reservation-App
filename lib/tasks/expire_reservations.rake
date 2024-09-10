namespace :reservations do
  desc "Expire reservations that are past their time and make tables available again"
  task expire: :environment do
    now = Time.current.in_time_zone("Central Time (US & Canada)")

    Reservation.where("reservation_time < ?", now).find_each do |reservation|
      reservation.tables.update_all(available: true)
      
      reservation.reservation_tables.destroy_all
      
      reservation.destroy
    end
  end
end