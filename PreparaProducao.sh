#/bin/bash

echo "criando BD producao"
mysqladmin -u root drop per_production
mysqladmin -u root create per_production


echo "Olha o config!!!"
cp config/database_example.yml config/database.yml

echo "E finalmente o migrate :)"
rake db:migrate  RAILS_ENV=production

echo "Agora carregar dados no banco!!!"
rake db:fixtures:load RAILS_ENV=production


script/server --environment=production
