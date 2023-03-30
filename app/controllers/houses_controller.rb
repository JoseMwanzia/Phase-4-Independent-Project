class HousesController < ApplicationController

   
    before_action :landlord_authorize 
    skip_before_action :landlord_authorize, only: [:index, :show, :house_apartment, :house_reviews]

    rescue_from StandardError, with: :standard_error

    def index 
        houses = House.all
        render json: houses, status: :ok
    end


    def create 
        house = tenant.houses.create(house_params)
        if house.valid? 
            render json: house, status: :created
        else  
            render json: { errors: house.errors, status: :unprocessable_entity, message: "Failed"}
        end
    end

    def show
        house = House.find_by(id: params[:id])
        if house
            render house: house, status: :ok
        else 
            render json: { errors: house.errors, status: :unprocessable_entity}
        end
    end

    def update 
        house = tenant.houses.find(params[:id]).update(house_params) 

        if house.valid?
            render json: { message: "Updated successfully"}
        else
            render json: { message: "Failed"}
        end


    end


    def destroy 
        house = House.find_by(params[:id])
        if house
            house.destroy
            head :no_content 
        else 
            render json: {error: house.errors}
        end
    end


    def house_reviews 
        house = House.find_by(params[:id])
        if house 
            render json: house, serializer: HouseReviewsSerializer, status: :ok
        else  
            render json: {message: "Not found"} 

        end

    end

    def house_tenant 
        house = House.find_by(id: params[:id])
        if house 
            render json: house.tenant, serializer: HouseTenantSerializer, status: :ok
        else 
            render json:{message: "Not found"}, status: :not_found
        end
    end


    def house_apartment  
        house = House.find_by(id: params[:id])
        if house 
            render json: house, serializer: HouseApartmentSerializer, status: :ok 
        else  
            render json: {message: "House not found", error: house.errors}
        end

    end


    private

    def house_params
        params.permit(:house_number, :description, :rent)
    end

end
