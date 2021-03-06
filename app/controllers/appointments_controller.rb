class AppointmentsController < ApplicationController
    before_action :authenticate_landscaper!, only: [:create, :new]
    before_action :landscaper_or_user_signed_in?, only: [:index, :destroy, :show]

    def new
        @appointment = Appointment.new
        @landscaper = current_landscaper
    end

    def create
        appointment = Appointment.new(appointment_params)
        if appointment.save
            redirect_to landscaper_appointments_path(current_landscaper) if landscaper_signed_in?
            redirect_to user_appointments_path(current_user) if user_signed_in?
        else
            flash[:notice] = "Appointment not saved"
            redirect_to new_appointment_path
        end
    end

    def index
        if params[:user_id]
            if params[:user_id] == current_user.id.to_s
                @appointments = current_user.appointments
            else
                flash[:notice] = "Invalid URL for current user."
                redirect_to user_appointments_path(current_user)
            end
        elsif params[:landscaper_id]
            if params[:landscaper_id] == current_landscaper.id.to_s
                @appointments = current_landscaper.appointments
            else
                flash[:notice] = "Invalid URL for current user."
                redirect_to landscaper_appointments_path(current_landscaper)
            end
        end
    end

    def show
        if current_landscaper && current_landscaper.appointment_ids.include?(params[:id].to_i)
            @appointment = Appointment.find(params[:id])
        elsif current_user && current_user.appointment_ids.include?(params[:id].to_i)
            @appointment = Appointment.find(params[:id])
        else
            flash[:notice] = "Appointment does not exist."
            redirect_to landscaper_appointments_path(current_landscaper) if current_landscaper
            redirect_to user_appointments_path(current_user) if current_user
        end
    end

    def destroy
        Appointment.find(params[:id]).destroy
        redirect_to landscaper_appointments_path(current_landscaper) if landscaper_signed_in?
        redirect_to user_appointments_path(current_user) if user_signed_in?
    end

    private
        def appointment_params
            params.require(:appointment).permit(:landscaper_id, :user_id, :datetime, :frequency, :recurring, :price)
        end
end