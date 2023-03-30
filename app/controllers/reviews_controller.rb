class ReviewsController < ApplicationController

    def index
        @review = Review.all
        render json: @review,status: :ok
      end
      # GET /user_review/1
      def show
        review = Review.find_by(id:params[:id])
        if review
            render json: review,status: :ok
        else
            render json :{error: review.errors ,message: "not found"},status: :not_found
      end

      # POST /user_review
      def create
        @review = review.tenant.create(rewiew_params)

        if @review
          render json: @review, status: :created, location: @review
        else
          render json: @review.errors, status: :unprocessable_entity
        end
      end
      # PATCH/PUT /user_review/1
      def update
         @review = Review.find_by(id: params[:id]).update(review_params)
         if @review
          render json: @review,status: :ok
        else
          render json: @review.errors, status: :unprocessable_entity
        end
      end
      # DELETE /user_review/1
      def destroy
        @review.destroy = Review.find(params[:id])
        @review.destroy
        head :no_content
      end

    



      private
        # Use callbacks to share common setup or constraints between actions.
        def set_review
          @review = Review.find(params[:id])
        end
        # Only allow a list of trusted parameters through.
        def review_params
          params.require(:review).permit(:genre, :user_id, :review_id)
        end

       
end
