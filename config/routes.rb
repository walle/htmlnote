Htmlnote::Application.routes.draw do
  match ':slideshow', :controller => :slides, :action => :index
  root :to => 'slides#index'
end
