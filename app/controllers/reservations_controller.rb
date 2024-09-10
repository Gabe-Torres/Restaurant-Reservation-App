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
      flash[:success] = "Reservation successful!"
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
  
    today_times = if now.hour < 23
                    (now.hour + 1..23).map { |hour| format_time(now.change(hour: hour)) }
                  else
                    []
                  end
  
    future_dates = (1..20).map do |i|
      future_date = now + i.days
      (0..23).map { |hour| format_time(future_date.change(hour: hour)) }
    end
  
    today_times + future_dates.flatten
  end
  
  def format_time(time)
    formatted_time = time.strftime("%B %d, %Y at %I:%M %p")
  end
end
