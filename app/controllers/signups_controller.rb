class SignupsController < ApplicationController
    def create
        signup = Signup.new(signup_params)
        activity = Activity.find_by(id: params[:activity_id])

        if signup.save
            render json: activity, status: :created
        else
            render json: {"errors": signup.errors.full_messages}, status: 422
        end
    end

    private

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end
end
