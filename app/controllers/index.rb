# KEYS_SECURED_IN_DB = ["sam", "jessica"]
# before '/*' do
#   halt 401 unless KEYS_SECURED_IN_DB.include?(params[:key])
# end

get '/users' do
  @users = User.all
  content_type :json
  @users.to_json
end

get '/articles' do
  @articles = Article.all
  content_type :json
  @articles.to_json
end

get '/users/:user_id/comments' do
  @comments = Comment.where(user_id: params[:user_id])
  content_type :json
  @comments.to_json

end

post '/users/:user_id/articles' do
  @article = Article.create({
    user_id: params[:user_id],
    body: params[:body],
    title: params[:title],
    })
  content_type :json
  @article.to_json
end

post '/users/:user_id/articles/:article_id/comments' do
  @comment = Comment.create({
    user_id: params[:user_id],
    body: params[:body],
    article_id: params[:article_id],
    })
  content_type :json
  @comment.to_json
end
