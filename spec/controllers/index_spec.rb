
# require '/Users/apprentice/Desktop/build_an_api_challenge/spec/spec_helper.rb'
require 'spec_helper'
# response = HTTParty.get('http://localhost:9393/users')

# puts response.body, response.code, response.message, response.headers.inspect

describe 'index controller' do

  describe 'GET /users' do

    context 'when there are no users' do
      before(:each) do
        User.delete_all
      end

      it "should render an empty array successfully" do
        get '/users?key=jessica'
        expect(last_response.status).to eq(200)
        expect(JSON.parse(last_response.body)).to eq []
      end
    end

    context 'when there are 2 users' do
      before(:each) do
        @bob = User.create!(
          username: "Bob",
          email: "bob@email.com",
          name: "BobB",
          bio: "bob is awesome",
        )
        @joe = User.create!(
          username: "Joe",
          email: "joe@email.com",
          name: "JoeJ",
          bio: "joe is awesome",
        )
      end

      it "should render 2 users successfully" do
        get '/users?key=jessica'
        expect(last_response.status).to eq(200)
        expect(JSON.parse(last_response.body)).to eq [
          {
            "bio"      => "bob is awesome",
            "email"    => "bob@email.com",
            "id"       => @bob.id,
            "name"     => "BobB",
            "username" => "Bob"
          },
          {
            "bio"      => "joe is awesome",
            "email"    => "joe@email.com",
            "id"       => @joe.id,
            "name"     => "JoeJ",
            "username" => "Joe",
          },
        ]
      end
    end
  end



  describe 'GET /articles' do

    context 'when there are no articles' do
      before(:each) do
        Article.delete_all
      end

      it "should render an empty array successfully" do
        get '/articles?key=jessica'
        expect(last_response.status).to eq(200)
        expect(JSON.parse(last_response.body)).to eq []
      end
    end

    context 'when there are 2 articles' do
      before(:each) do
        @article_one = Article.create!(
          body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempore ipsum molestias hic in maxime eaque cupiditate consectetur dolores vel id quos sapiente, nostrum et minima magnam a autem doloremque ratione.",
          title: "Lorem ipsum dolor sit amet.",
          user_id: 1,
        )
        @article_two = Article.create!(
          body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempore ipsum molestias hic in maxime eaque cupiditate consectetur dolores vel id quos sapiente, nostrum et minima magnam a autem doloremque ratione.",
          title: "Lorem ipsum dolor sit amet.",
          user_id: 1,
        )
      end

      it "should render 2 articles successfully" do
        get '/articles?key=jessica'
        expect(last_response.status).to eq(200)
        expect(JSON.parse(last_response.body)).to eq [
          {
            "body"=>"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempore ipsum molestias hic in maxime eaque cupiditate consectetur dolores vel id quos sapiente, nostrum et minima magnam a autem doloremque ratione.",
            "id"=> @article_one.id,
             "title"=>"Lorem ipsum dolor sit amet.",
             "user_id"=>1},
          {
            "body"=>"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempore ipsum molestias hic in maxime eaque cupiditate consectetur dolores vel id quos sapiente, nostrum et minima magnam a autem doloremque ratione.",
             "id"=> @article_two.id,
             "title"=>"Lorem ipsum dolor sit amet.",
             "user_id"=>1
          }
        ]
      end
    end
  end

  describe 'GET /users/:user_id/comments' do

    context 'when there are no comments' do
      before(:each) do
        Comment.delete_all
      end

      it "should render an empty array successfully" do
        get '/users/:user_id/comments?key=jessica'
        expect(last_response.status).to eq(200)
        expect(JSON.parse(last_response.body)).to eq []
      end
    end

    context 'when there are 2 comments' do
      before(:each) do
        @comm_one = Comment.create!(
          article_id: 1,
          body:       "Lorem ipsum dolor sit amet.",
          user_id:    1,
        )
        @comm_two = Comment.create!(
          article_id: 1,
          body:       "Lorem ipsum dolor sit amet.",
          user_id:    1,
        )
      end

      it "should render 2 comments successfully" do
        get '/users/1/comments?key=jessica'
        expect(last_response.status).to eq(200)
        expect(JSON.parse(last_response.body)).to eq [
          {
            "article_id" => 1,
            "body"       => "Lorem ipsum dolor sit amet.",
            "id"         => @comm_one.id,
            "user_id"    => 1
          },
          {
            "article_id" => 1,
            "body"       => "Lorem ipsum dolor sit amet.",
            "id"         => @comm_two.id,
            "user_id"    => 1
          }
        ]

      end
    end
  end

  # POST new Article

  describe 'POST /users/:user_id/articles' do

     context 'when there are no articles' do
      before(:each) do
        @bob = User.create!(
          username: "Bob",
          email:    "bob@email.com",
          name:     "BobB",
          bio:      "bob is awesome",
        )
      end

      it "Should increase the number of articles when created" do
        expect{post "/users/#{@bob.id}/articles?key=jessica", {body: "Lorem ipsum dolor sit.", title: "Lorem ipsum."}}.to change{Article.count}.by(1)
      end
    end
  end

  # POST new Comment

  describe 'POST /users/user_id/articles/article_id/comments' do

     context 'when there are no comments' do
      before(:each) do
        @bob = User.create!(
          username: "Bob",
          email:    "bob@email.com",
          name:     "BobB",
          bio:      "bob is awesome",
        )
        @article = Article.create!(
          body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempore ipsum molestias hic in maxime eaque cupiditate consectetur dolores vel id quos sapiente, nostrum et minima magnam a autem doloremque ratione.",
          title: "Lorem ipsum dolor sit amet.",
          user_id: 1,
        )
      end

      it "Should increase the number of comments when created" do
        expect{post "/users/#{@bob.id}/articles/#{@article.id}/comments?key=jessica" , {body: "Lorem ipsum dolor sit."}}.to change{Comment.count}.by(1)
      end
    end
  end

end
