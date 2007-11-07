ActionController::Routing::Routes.draw do |map|
  map.resources :activities







  # The priority is based upon order of creation: first created -> highest priority.


#institutions/id/registrations/ID do profile???
#Institution.find(2).registrations.find_all_by_profile_id(3)

  map.resources :institutions,  :collection => {:inactive => :get, :signup => :get }, :member => {}  do |institutions|
    institutions.resources :registrations, :collection => {:signup => :get, :create => :post}
  end

#FIXME Problemas, ver URLS para acessar dados necessários
# /institutions/:id/participations/

#url de acesso ao ambiente de desenvolvimento de perguntas e respostas
#/groups/:id
# tenho id da institutions? Precisa? tenho através do registration
#Group.find(1).registrations


  map.resources :themes do |themes|
    themes.resources :links
    themes.resources :groups, :name_prefix => "theme_", :collection => {:list =>:get}
    themes.resources :archives
    themes.resources :games
  end

#Planejamento de URL do Grupos
#URLs de acesso do Professor
#/themes/:theme_id/groups/new -get
#/themes/:theme_id/groups/create - post
#/themes/:theme_id/groups/edit - get
#/themes/:theme_id/groups/update - put
#/themes/:theme_id/groups/destroy - delete
#/themes/:theme_id/groups/list - Listar por ultima interacao



#/groups/id - show - acessa o ambiente
#/groups/index - listar os grupos do aluno (e do professor?)

  map.resources :groups,  :collection => {:message => :post} do |groups|  
    groups.resources :messages, :collection => {:list =>:post}
    groups.resources :interactions, :collection => {:list =>:post}
    groups.resources :activities
    groups.resources :answers
    groups.resources :questions
    groups.resources :plays
  end





  map.resources :users
  map.resource  :session
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.login  '/login', :controller => 'session', :action => 'new'
  map.logout '/logout', :controller => 'session', :action => 'destroy'



#partes do site
  map.about '/about', :controller => 'site', :action => 'about'




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
