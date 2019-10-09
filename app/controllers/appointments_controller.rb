class AppointmentsController < ApplicationController
    # before_action !current_user 
    def new
        @appointment = Appointment.new
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
        @appointments = Appointment.where(user_id == current_user.id)
    end

    def destroy
        Appointment.find(paramsp[:id]).destroy
        redirect_to root_url
    end

    private
        def appointment_params
            params.require(:appointment).permit(:landscaper_id, :user_id, :datetime, :frequency, :recurring, :price)
        end
end