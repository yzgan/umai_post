json.data do
  json.array! @posts, partial: 'posts/post', as: :post
end

json.meta do
  json.count @pagy.count
  json.page @pagy.page
  json.items @pagy.items
end
