class ReviewsController < ApplicationController

    def index
        @reviews = Review.all
        
        render json: @reviews
    end

    def show
        @review = Review.find(params[:id])

        render json: @review
    end

    def create
        # merge the params for the reviews with the logged in user
        # it enables to create review for the user logged in
        # which means the user who create the review.
        create_review = review_params.merge({user_id: logged_user.id})
        @review = Review.create(create_review)

        render json: @review
    end

    def update
        @review = Review.find(params[:id])
        @review.update(review_params)

        render json: @review
    end

    def destroy
        @review = Review.find(params[:id])
        @review.destroy

        render json: {message: "Review has been deleted", review: @review}
    end

    private

    def review_params
        params.permit(:user_id, :item_id, :comment, :rating)
    end

end