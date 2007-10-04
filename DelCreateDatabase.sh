#/bin/bash

echo "deletando os bancos"
mysqladmin -u root drop per_test
mysqladmin -u root drop per_development
echo "recriando os bancos"
mysqladmin -u root create per_test
mysqladmin -u root create per_development

echo "Olha o config!!!"
cp config/database_example.yml config/database.yml

echo "E finalmente o migrate :)"
rake db:migrate

