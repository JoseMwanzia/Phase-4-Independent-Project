class ApplicationController < ActionController::API

    include ActionController::Cookies








# Tenant methods

    def tenant_authorize 
        # Tenant.find(session[:uid]).to_i
        return render json: {error: "Not Authorized"}, status: :unauthorized unless session.include: :tid
    end

    def tenant_params 
        params.permit(:name, :email, :password,)
    end

#  Landlord 

def landlord_authorize
    return render json: {error: "Not Authorized"}, status: :unauthorized unless session.include: :lid
end


end
