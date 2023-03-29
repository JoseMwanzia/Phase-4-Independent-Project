 class TenantsController < ApplicationController


    def index 
        tenants = Tenant.all
        render json: tenants, status: :ok
    end

    

    def show
        tenant = Tenant.find_by(id: params[:id])
        if tenant
            render house: tenant, status: :ok
        else 
            render json: { errors: tenant.errors, status: :unprocessable_entity}
        end
    end

    def update 
        tenant = Tenant.house.find(params[:id]).update(tenant_params) 

        if  tenant.valid?
            render json: { message: "Updated successfully"}
        else
            render json: { message: "Failed"}
        end


    end


    def destroy 
        tenant = Tenant.find_by(params[:id])
        if tenant
            tenant.destroy
            head :no_content 
        else 
            render json: { message: "not fount"}, status rrende
        end
    end


    def tenant_reviews 
        house = House.find_by(params[:id])
        if house 
            render json: house, serializer: HouseReviewsSerializer, status: :ok
        else  
            render json{message: "Not found", error: house:errors} 

        end

    end

    def house_tenant 
        tenat = Tenant.find_by(id: params[:id])
        if house 
            render json: house.tenant, serializer: HouseTenantSerializer, status: :ok
        else 
            render json: {error: house.errors}, status: :not_found
        end
    end


    def tenant_reviews  
        tenant = House.find_id(id: params[:id])
        if house 
            render json: tenant.reviews, status: :ok 
        else  
            render json: {message: "House not found", error: house.errors}
        end

    end


    private

    def tenant_params 
        params.permit(:name, :email, :password,)
    end


end


