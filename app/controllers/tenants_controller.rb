 class TenantsController < ApplicationController

    before_action :landlord_authorize
    skip_before_action :landlord_authorize, only: [:show, :update, :tenant_reviews, :house_tenant]

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



    def house_tenant 
        tenat = Tenant.find_by(id: params[:id])
        if house 
            render json: tenant.house, serializer: HouseTenantSerializer, status: :ok
        else 
            render json: {error: tenant.errors}, status: :not_found
        end
    end


    def tenant_reviews  
        tenant = Tenant.find_id(id: params[:id])
        if house 
            render json: tenant.reviews, status: :ok 
        else  
            render json: {message: "No reviews", error: tenant.errors}
        end

    end


    private

    def tenant_params 
        params.permit(:name, :email, :password,)
    end


end


