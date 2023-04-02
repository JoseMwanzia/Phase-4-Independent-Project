class ApartmentsController < ApplicationController
    # before_action :set_apartment, only: [:show, :update, :destroy]

    before_action :landlord_authorize
    skip_before_action :landlord_authorize, only: [:index, :show, :apartment_houses]
    # GET /apartment
    def index
      @apartments = Apartment.all
      render json: @apartments, status: :ok
    end
  
    # GET /apartment
    def show

        apartment = Apartment.find_by(id: params[:id])
        if apartment
            render json: apartment,status: :ok
        else 
            render json: {error: apartment.errors, message: "not found"}, status: :not_found
        end
     
    end
  
    # POST /apartment
    def create
      landlord = Landlord.find(session[:lid])
      apartment = landlord.apartments.create(apartment_params)

      if apartment
        render json: apartment, status: :created
      else
        render json: {errors: apartment.errors}, status: :unprocessable_entity
      end

    end
  
    # PATCH/PUT /apartment
    def update
        apartment = Apartment.find_by(id: params[:id])
      if apartment
        apartment.update(apartment_params)
        render json: apartment, status: :ok
      else
        render json: apartment.errors, status: :unprocessable_entity
      end
    end


    def apartment_houses 

        apartment = Apartment.find_by(id: params[:id])
        if apartment
            render json: apartment.houses 
        end

    end


  
    # DELETE /apartment
    def destroy
     apartment = Apartment.find(params[:id])
      apartment.destroy
      head :no_content

    end


  
    private

      def set_apartment
        apartment = Apartment.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def apartment_params
        params.require(:apartment).permit(:name, :location, :category)
      end 

      def render_not_found_response
        render json: { error: "Apartment not found" }, status: :not_found
      end
    
end
