class ApartmentsController < ApplicationController
    before_action :set_apartment, only: [:show, :update, :destroy]

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
      render json: @apartment
    end
  
    # POST /apartment
    def create
      @apartment = Apartment.landlord.create(apartment_params)
  
      if @apartment
        render json: @apartment, status: :created, location: @apartment
      else
        render json: @apartment.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /apartment
    def update
        @apartment = Apartment.find_by(id: params[:id]).update(apartment_params)
      if @apartment
        render json: @apartment, status: :ok
      else
        render json: @apartment.errors, status: :unprocessable_entity
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
     @apartment = Apartment.find(params[:id])
      @apartment.destroy
      head :no_content

    end


  
    private

      def set_apartment
        @apartment = Apartment.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def apartment_params
        params.require(:apartment).permit(:address, :rent)
      end 

      def render_not_found_response
        render json: { error: "Apartment not found" }, status: :not_found
      end
    
end
