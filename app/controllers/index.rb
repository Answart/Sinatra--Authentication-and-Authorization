get '/' do
  # render home page
 #TODO: Show all users if user is signed in
  @users = User.all
  erb :index
end

#----------- SESSIONS -----------
get '/sessions/new' do
  # render sign-in page 
  erb :sign_in
end

post '/sessions' do
  # sign-in
  @user = User.find_by_email(params[:email])
  puts "="*80
  p @user
  p "@user.password: #{@user.password}"
  p "params[:password] : #{params[:password]}"
  puts "*"*50
  if @user
    if @user.password == params[:password_hash]
      session[:user_id] = @user.id
    end
  end
  redirect "/"
end

delete '/sessions/:id' do
  # sign-out -- invoked via AJAX
  session[:user_id] = nil
  redirect to '/'
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
  # sign-up a new user
  @user = User.new(params[:user])
  @user.password = params[:password]
  @user.save!
  session[:user_id] = @user.id
  redirect to '/'
end