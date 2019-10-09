class AppointmentsController < ApplicationController
    before_action :authenticate_landscaper!, only: [:create, :new]

    def new
        @appointment = Appointment.new
        @landscaper = current_landscaper
    end

    def create
        appointment = Appointment.new(appointment_params)
        if appointment.save
            redirect_to appointments_path
        else
            redirect_to appointments_new_path
        end
    end

    def index
        if user_signed_in?
            @appointments = Appointment.where("user = current_user")
        elsif landscaper_signed_in?
            @appointments = Appointment.where("landscaper = current_landscaper")
        else
            redirect_to root_url
        end
    end

    def destroy
        Appointment.find(params[:id]).destroy
        redirect_to root_url
    end

    private
        def appointment_params
            params.require(:appointment).permit(:landscaper_id, :user_id, :datetime, :frequency, :recurring, :price)
        end
end