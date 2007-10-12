class ThemesController < ApplicationController
before_filter :login_required,  :only => [ :signup, :create ] 

def signup
end

def create
end

end
