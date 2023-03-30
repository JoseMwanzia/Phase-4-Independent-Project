class SessionsController < ApplicationController


    # tenant authentication

    def tenant_login  

        sql = "username = :username OR email = :email"

         tenant = Tenant.where(sql, { username: tenant_params[:username],email: tenant_params[:email] }).first

        if tenant&.authenticate(tenant_params[:password])
            session[:tid] = tenant.id
            render json: {message: "Login successful",  data: {user:user, token:token}}, status: :ok
        else
            render json: {message: "Invalid username or password"}, status: :unauthorized
        end
    end

    def tenant_signup 
        tenant = Tenant.create(tenant_params)
        if tenant 
            session[:tid] = tenant.id
            render json: tenant, status: :created
        else  
            render json: { errors: tenant.errors, status: :unprocessable_entity, message: "Failed"}
        end
    end

    def tenant_logout

        session.delete(:tid)
        render json: { message: "Logged out successful"}

    end

    # landlord authentication

    def landlord_signup 
        landlord = Landlord.create(landlord_params)
        if landlord 
            session[:lid] = landlord.id
            render json: landlord, status: :created
        else  
            render json: { errors: landlord.errors, status: :unprocessable_entity, message: "Failed"}
        end
    end
    
    def landlord_login
        landlord = Landlord.find_by(username: params[:username])
        if landlord&.authenticate(params[:password])
            session[:lid] = landlord.id
            render json: landlord, status: :created
        else
            render json: { error: "Invalid username or password"}, status: :unauthorized
        end
    end



    def landlord_logout

        session.delete(:lid)
        render json: { message: "Logged out successful"}

    end

end
