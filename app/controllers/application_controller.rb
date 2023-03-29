class ApplicationController < ActionController::API



    def tenant 
        Tenant.find(session[:uid]).to_i
    end


end
