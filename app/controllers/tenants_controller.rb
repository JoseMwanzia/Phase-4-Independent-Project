 class TenantsController < ApplicationController

    # before_action :landlord_authorize
    # skip_before_action :landlord_authorize, only: [:tenant, :update, :tenant_reviews, :house_tenant, :tenant_register]

    # shows all tenants 
    def index 
        tenants = Tenant.all
        render json: tenants, status: :ok
    end

    
    #shows the logged in tenant
    def tenant
        tenant = Tenant.find_by(id: session[:tid])
        if tenant
            render json: tenant, status: :ok
        else 
            render json: {message: "not found"}, status: :unprocessable_entity
        end
    end

    # updates details of a tenant/registers a tenant
    def tenant_register 
        tenant = Tenant.find_by(id: session[:tid])
        if tenant
            tenant.update(tenant_params) 
            render json: { data: tenant, message: "Updated successfully"}
        else
            render json: { message: "Failed"}
        end


    end

    #deletes a tenant

    def destroy 
        tenant = Tenant.find_by(params[:id])
        if tenant
            tenant.destroy
            head :no_content 
        else 
            render json: { message: "not found"}, status: :not_found
        end
    end

  


    # shows the house of the login tenant
    def house_tenant 
        tenat = Tenant.find_by(id: params[:id])
        if tenant
            render json: tenant.house, serializer: HouseTenantSerializer, status: :ok
        else 
            render json: {error: tenant.errors}, status: :not_found
        end
    end


    # shows reviews of the logged in tenant
    def tenant_reviews  
        tenant = Tenant.find_by(id: session[:tid])
        if tenant 
            render json: tenant.reviews, status: :ok 
        else  
            render json: {message: "No reviews"}
        end

    end


    private

    def tenant_params 
        params.permit(:id, :username, :email, :password, :identification)
    end


end


