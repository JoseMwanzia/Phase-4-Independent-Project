class ApplicationController < ActionController::API

    include ActionController::Cookies








# Tenant methods

    def tenant_authorize 
        # Tenant.find(session[:uid]).to_i
        return render json: {error: "Not Authorized"}, status: :unauthorized unless session.include? :tid
    end

    def tenant_params 
        params.permit(:id, :username, :email, :password)
    end

#  Landlord 

def landlord_authorize
    return render json: {error: "Not Authorized"}, status: :unauthorized unless session.include? :lid
end


def landlord_params
    params.permit(:id, :username, :contact_number, :email, :password)
end


# rescue all common errors

def standard_error(exception)
    render json: {message: "Failed", data: {info: exception.message}}, status: :unprocessable_entity
end


end
