json.array!(@reviews) do |review|
  json.extract! review, :body, :stars, :user_id, :movie_id
  json.url review_url(review, format: :json)
end
