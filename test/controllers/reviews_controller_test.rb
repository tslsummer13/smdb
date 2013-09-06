require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  setup do
    @review = reviews(:zebra)
    session[:user_id] = users(:jeff).id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reviews)   # @reviews = ...
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create review" do
    assert_difference('Review.count') do
      # u = User.create name: 'Jeff', email: 'jeff@example.com', password: 'hockey', password_confirmation: 'hockey'

      post :create, review: { body: @review.body, movie_id: @review.movie_id, stars: @review.stars, user_id: @review.user_id }
    end
    new_review = assigns(:review)
    assert_redirected_to movie_url(new_review.movie_id)
    # assert_redirected_to review_path(assigns(:review))
  end

  test "should show review" do
    get :show, id: @review
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @review
    assert_response :success
  end

  test "should update review" do
    patch :update, id: @review, review: { body: @review.body, movie_id: @review.movie_id, stars: @review.stars, user_id: @review.user_id }
    assert_redirected_to review_path(assigns(:review))
  end

  test "should destroy review" do
    assert_difference('Review.count', -1) do
      delete :destroy, id: @review
    end

    assert_redirected_to reviews_path
  end
end
