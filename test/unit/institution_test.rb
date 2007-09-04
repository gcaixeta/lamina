require File.dirname(__FILE__) + '/../test_helper'

class InstitutionTest < Test::Unit::TestCase
  fixtures :institutions

	# Proibi criacao dados em branco
   def test_should_be_invalid
    instituition = create(:name => nil, :cnpj => nil, :telephone => nil, :email => nil, :active => nil)
    assert_invalid instituition, "instituition shouldn't be created"
   end

  # validar o name da intitution
  def test_should_require_name
    intitution = create(:name => nil)
    assert intitution.errors.invalid?(:name), ":name should be required"
    assert_invalid intitution, "intitution shouldn't be created"
  end


 	 # validar o cnpj da intitution  
  def test_should_require_cnpj
    intitution = create(:cnpj => nil)
    assert intitution.errors.invalid?(:cnpj), ":cnpj should be required"
    assert_invalid intitution, "intitution shouldn't be created"
  end

 	# validar o telephone da intitution  
  def test_should_require_telephone
    intitution = create(:telephone => nil)
    assert intitution.errors.invalid?(:telephone), ":telephone should be required"
    assert_invalid intitution, "intitution shouldn't be created"
  end

	# validar o active da intitution  
  def test_should_require_active
    intitution = create(:active => nil)
    assert intitution.errors.invalid?(:active), ":active should be required"
    assert_invalid intitution, "intitution shouldn't be created"
  end
  
  	# validar o campo email no formato da intitution  
  def test_should_deny_bad_email
    intitution = create(:email => 'bad@format')
    assert intitution.errors.invalid?(:email), ":email should be in a valid format"
    assert_invalid intitution, "intitution shouldn't be created"
  end
  
	# validar o email da intitution  
  def test_should_require_email
    intitution = create(:email => nil)
    assert intitution.errors.invalid?(:email), ":email should be required"
    assert_invalid intitution, "User shouldn't be created"
  end

	# nao permiti criar dois usuarios duplicados da intitution  
  def test_should_deny_duplicate_intitution
    intitution = create
    assert_valid intitution
    
    intitution = create
    assert_invalid intitution, "User shouldn't be created"
  end

	#criar dados de Institution
  private
    def create(options={})
      Institution.create({
		:name => "Fatec",
		:cnpj => 321,
		:telephone => 321456,
		:email => "joao@uol.com.br",
		:active => 1
        }.merge(options))
    end

end
