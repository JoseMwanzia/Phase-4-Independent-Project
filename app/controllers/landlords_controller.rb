class LandlordsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
before_action :landlord_authorize 
skip_before_action :landlord_authorize, only: [:index]
    def index
        landlords = Landlord.all
       render json: landlords
    end 

       
    #shows the logged in landlord
    def landlord 
        landlord = landlord.find_by(id: session[:lid])
        if landlord
            render json: landlord, status: :ok
        else 
            render json: {message: "not found"}, status: :unprocessable_entity
        end
    end
    

    def update 
        landlord = Landlord.find_by(id: params[:id])
        if landlord
            landlord.update(landlord_params)
            render json: landlord, status: :created
        else
            render json: {error: "validation error"}, status: :unauthorized
        end
    end

    def destroy
        landlord = Landlord.find(params[:id])
        landlord.destroy
    end

    private 

    # def landlord_params
    #     params.permit(:username, :contact_number, :email, :password)
    # end

    def render_not_found_response
        render json: {error: "Landlord not found"}, status: :not_found
    end

end
