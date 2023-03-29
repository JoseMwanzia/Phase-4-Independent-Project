class SessionsController < ApplicationController
    def landlord_login
        landlord = Landlord.find_by(username: params[:username])
        if landlord&.authenticate(params[:password])
            session[:landlord_id] = landlord.id
            render json: landlord, status: :created
        else
            render json: { error: "Invalid username or password"}, status: :unauthorized
        end
    end

    

end
