class ThemesController < ApplicationController
before_filter :login_required,  :only => [ :new, :create ] 

def new
end

def create
end

end
