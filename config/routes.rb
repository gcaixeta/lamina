ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.


#institutions/id/registrations/ID do profile???
#Institution.find(2).registrations.find_all_by_profile_id(3)

  map.resources :institutions,  :collection => {:inactive => :get, :signup => :get}, :member => {}  do |institutions|
    institutions.resources :registrations, :collection => {:signup => :get}
  end

#FIXME Problemas, ver URLS para acessar dados necessários
# /institutions/:id/participations/

#url de acesso ao ambiente de desenvolvimento de perguntas e respostas
#/groups/:id
# tenho id da institutions? Precisa? tenho através do registration
#Group.find(1).registrations

#themes/theme_id/groups/id
  map.resources :themes do |themes|
    themes.resources :groups
  end



  map.resources :users
  map.resource  :session
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.login  '/login', :controller => 'session', :action => 'new'
  map.logout '/logout', :controller => 'session', :action => 'destroy'





  # Sample of regular route:
  # map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  # map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # You can have the root of your site routed by hooking up '' 
  # -- just remember to delete public/index.html.
  # map.connect '', :controller => "welcome"
   map.connect '', :controller => 'site', :action => 'index'

 # map.home '', :controller => 'site', :action => 'index'
  # Allow downloading Web Service WSDL as a file with an extension
  # instead of a file named 'wsdl'

#  map.connect ':controller/service.wsdl', :action => 'wsdl'

  # Install the default route as the lowest priority.
 # map.connect ':controller/:action/:id.:format'
  #map.connect ':controller/:action/:id'



end
