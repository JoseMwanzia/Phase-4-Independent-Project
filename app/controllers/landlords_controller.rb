class LandlordsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
before_action :landlord_authorize 
skip_before_action :landlord_authorize, only: [:index]
    def index
        landlords = Landlord.all
       render json: landlords
    end 

    
    def show 
        landlord = Landlord.find(params[:id])
        render json: landlord
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

    def landlord_params
        params.permit(:name, :contact_number, :email, :password)
    end

    def render_not_found_response
        render json: {error: "Landlord not found"}, status: :not_found
    end

end
