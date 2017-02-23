class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'/figures/new'
  end


  post '/figures/new' do

    @figure = Figure.create(params[:figure])

    if !params[:title][:name].empty?
      title = Title.create(params[:title])
      title.figures << @figure
      @figure.titles << title
    elsif !!params[:figure][:title_ids]
      params[:figure][:title_ids].each do |t|
        title = Title.find(t)
        title.figures << @figure
        @figure.titles << title
      end
    else
    end

    if !params[:landmark][:name].empty?
      landmark = Landmark.create(params[:landmark])
      landmark.figure = @figure
      @figure.landmarks << landmark
    elsif !!params[:figure][:landmark_ids]
      params[:figure][:landmark_ids].each do |t|
        landmark = Landmark.find(t)
        landmark.figure = @figure
        @figure.landmarks << landmark
      end
    else
    end

    @figure.save
    erb :'figures/index'
  end


  patch '/figures/:id' do

    @figure = Figure.find(params[:id])
    @figure.name = params[:figure][:name]
    if !params[:landmark][:name].empty?
      @landmark = Landmark.create(params[:landmark])
      @figure.landmarks << @landmark
      @landmark.figure = @figure
      @landmark.save
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"

  end


  get '/figures' do
    erb :'figures/index'
  end


  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

end
