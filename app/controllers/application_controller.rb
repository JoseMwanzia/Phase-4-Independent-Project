class ApplicationController < ActionController::API







    
# Tenant methods

    def tenant 
        Tenant.find(session[:uid]).to_i
    end

    def tenant_params 
        params.permit(:name, :email, :password,)
    end


end
