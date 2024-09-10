class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.order(:created_at)
    @tables = Table.all
    @future_times = generate_future_times
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.valid? && @reservation.reserve_tables
      @reservation.save!
      flash[:notice] = "Reservation successful!"
    else
      flash[:alert] = "Reservation failed. Please check capacity and availability."
    end

    redirect_to reservations_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:name, :party_size, :reservation_time).merge(reservation_time: params[:reservation_time])
  end


  def generate_future_times
    now = Time.current.in_time_zone("Central Time (US & Canada)")
    start_hour = now.hour + 1
    start_hour = 0 if start_hour >= 24
  
    future_dates = (0..20).map do |i|
      future_date = now + i.days
      future_date.beginning_of_day
    end.uniq
  
    future_dates.flat_map do |date|
      (start_hour..23).map do |hour|
        time = date.change(hour: hour, min: 0, sec: 0)
        formatted_time = time.strftime("%B %d, %Y at %I:%M %p")
        [formatted_time, time.iso8601]
      end
    end
  end
end
