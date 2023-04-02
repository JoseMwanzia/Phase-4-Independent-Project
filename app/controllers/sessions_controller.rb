class SessionsController < ApplicationController


    # tenant authentication

    def tenant_login  

        sql = "username = :username OR email = :email"

         tenant = Tenant.where(sql, { username: tenant_s_params[:username],email: tenant_s_params[:email] }).first

        if tenant&.authenticate(tenant_s_params[:password])
            session[:tid] = tenant.id
            render json: tenant, status: :ok
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

    # def tenant_logout

    #     session.delete(:tid)
    #     render json: { message: "Logged out successful"}

    # end

    # landlord authentication

    def landlord_login

        sql = "username = :username OR email = :email"

        landlord = Landlord.where(sql, { username: landlord_s_params[:username],email: landlord_s_params[:email] }).first
    
        if landlord&.authenticate(landlord_s_params[:password])
            session[:lid] = landlord.id
            render json: landlord, status: :ok
        else  
            render json: { message: "Failed"}
        end
    end
    
    def landlord_signup
      
        landlord = Landlord.create(landlord_params)
        if landlord
            session[:lid] = landlord.id
            render json: landlord, status: :created
        else
            render json: { error: "Not created"}, status: :unprocessable_entity
        end
    end



    # def landlord_logout

    #     session.delete(:lid)
    #     render json: { message: "Logged out successful"}

    # end

    def logout 
        tenant = Tenant.find_by(id: session[:tid].to_i)
        landlord =  Landlord.find_by(id: session[:lid].to_i)
        if landlord
            session.delete :lid
            render json: { message: "success"}
        elsif tenant
            session.delete :tid
            render json: { message: "success"}
        else
            render json: {message: "no one logged"}
        end

    end

    # password reset

    def password_reset
        tenant = Tenant.find_by(email: tenant_params[:email] )
        landlord =  Landlord.find_by(email: landlord_params[:email])
        if tenant
            tenant.update(password: tenant_params[:password])
            render json: {message: "Tenants password reset succesfully"}, status: :created
        elsif landlord
            landlord.update(password: landlord_params[:password])
            render json: {message: "landlord password reset succesfully"}, status: :created
        else 
            render json: {message: "unsuccessfull"}, status: :unprocessable_entity
        end

    end


    def check_login_status
        tenant = Tenant.find_by(id: session[:tid].to_i)
        landlord =  Landlord.find_by(id: session[:lid].to_i)
        if tenant
            render json: {message: "success", data: tenant}, status: :ok
        elsif landlord
            render json: {message: "success", data: landlord}, status: :ok

        else
            render json: {message: "No one is logged in"}
        end
    end

    private

    def tenant_s_params 
        params.require(:session).permit(:id, :username, :email, :password)
    end



def landlord_s_params
    params.require(:session).permit(:username, :contact_number, :email, :password)
end

end
