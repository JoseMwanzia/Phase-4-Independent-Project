class ReviewsController < ApplicationController
  # before_action :tenant_authorize
  # skip_before_action :tenant_authorize, only: [:index]

    def index
        review = Review.all
        render json: review, status: :ok
      end

      # GET /user_review/1
      def show
        review = Review.find_by(id: params[:id])
        if review
            render json: review, status: :ok
        else
            render json: {error: review.errors ,message: "not found"}, status: :not_found
        end
      end

      # POST /tenant_review
      def add_review
        tenant = Tenant.find_by(id: session[:tid])
        # review = tenant.reviews.create(review_params[:review])
        if tenant
          review = tenant.reviews.create(review_params)
          render json: review, status: :created
        else
          render json: {message: "Not added"}, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /user_review/1
      def update
         review = Review.tenant.find_by(id: params[:id]).update(review_params)
         if review
          render json: review,status: :ok
        else
          render json: {errors: review.errors}, status: :unprocessable_entity
        end
      end
      # DELETE /user_review/1
      def destroy
        review = Review.find(params[:id])
        review.destroy
        head :no_content
      end

   

    



      private
      
        # Only allow a list of trusted parameters through.
        def review_params
          params.require(:review).permit(:description,:rating, :house_id)
        end

       
end
