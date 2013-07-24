get '/' do
  @success = session.delete(:success) if session[:success]
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do

  @event = Event.new(:human_date => "today")
  erb :new
end

post '/events/create' do
  # params = {"sherif"=>"isdabomb", "event"=>{"organizer_name"=>"a", "organizer_email"=>"a@bc", "title"=>"asdf", "human_date"=>"today"}}

  # debugger
  @event = Event.new(params[:event])
    
  if @event.save
    session[:success] = "You made an event!"
    redirect to ("/")
  else
    #redirect back to the form page and show the errors
    @errors = @event.errors.full_messages
    erb :new
  end
   # = Event.new()
 end

  # event_params = { organizer_name: params[:organizer_name],
  #                  organizer_email: params[:organizer_email],
  #                  title: params[:title]

  # event_params
