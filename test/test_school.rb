require 'minitest/autorun'
require 'edools_sdk'

ENV["edools_token"] = "token_example"

class SchoolTest < Minitest::Test
  def test_parse_json
    school1_json = {'name' => 'test1', 'cnpj' => 'test1'}
    school2_json = {'name' => 'test2', 'cnpj' => 'test2'}

    expected1 = EdoolsSdk::School.new
    expected1.name = 'test1'
    expected1.cnpj = 'test1'

    expected2 = EdoolsSdk::School.new
    expected2.name = 'test2'
    expected2.cnpj = 'test2'

    assert_equal expected1.name, EdoolsSdk::School.parse_json(school1_json).name
    assert_equal expected1.cnpj, EdoolsSdk::School.parse_json(school1_json).cnpj
    assert_equal expected2.name, EdoolsSdk::School.parse_json(school2_json).name
    assert_equal expected2.cnpj, EdoolsSdk::School.parse_json(school2_json).cnpj
  end

  def test_initialize
    school = EdoolsSdk::School.new

    assert_nil school.id
    assert_nil school.credentials
    assert_nil school.name
    assert_nil school.password
    assert_nil school.subdomain
    assert_nil school.domains
    assert_nil school.rdstation_token
    assert_nil school.adroll_adv_id
    assert_nil school.adroll_pix_id
    assert_nil school.email
    assert_nil school.phone
    assert_nil school.cnpj
    assert_nil school.samba_key
    assert_nil school.samba_player_key
    assert_nil school.samba_access_token
    assert_nil school.samba_project_id
    assert_nil school.terms_of_use
    assert_nil school.adroll_adv_id
    assert_nil school.adroll_pix_id
    assert_nil school.facebook
    assert_nil school.twitter
    assert_nil school.linkedin
    assert_nil school.pinterest
    assert_nil school.google_plus
    assert_nil school.youtube
    assert_nil school.instagram
    assert_nil school.site
    assert_nil school.address
    assert_nil school.company_name
    assert_nil school.seo_title
    assert_nil school.seo_description
    assert_nil school.logo
    assert_nil school.metadata
    assert_nil school.meta_available_locales
    assert_nil school.event
    assert_nil school.created_at
    assert_nil school.updated_at
  end

  def test_create
    stub_request(:post, "https://core.myedools.info/api/schools/wizard").
      with(body: "{\"name\":\"test\"}", headers: {'Authorization'=>'Token token="another_token_example"', 'Connection'=>'close', 'Content-Type'=>'application/json; charset=UTF-8', 'Host'=>'core.myedools.info', 'User-Agent'=>'http.rb/2.2.2'}).
      to_return(status: 201, body: File.open("#{Dir.pwd}/test/mocks/school_created_response.json", 'rb'), headers: {})

    response = EdoolsSdk::School.create("another_token_example", "name" => "test")

    assert_equal response.id, 572
    assert_equal response.credentials, "foo"
  end

  def test_create!
    stub_request(:post, "https://core.myedools.info/api/schools/wizard").
      with(body: "{\"name\":\"test\"}", headers: {'Authorization'=>'Token token="another_token_example"', 'Connection'=>'close', 'Content-Type'=>'application/json; charset=UTF-8', 'Host'=>'core.myedools.info', 'User-Agent'=>'http.rb/2.2.2'}).
      to_return(status: 201, body: File.open("#{Dir.pwd}/test/mocks/school_created_response.json", 'rb'), headers: {})

    response = EdoolsSdk::School.create!("another_token_example", "name" => "test")
    
    assert_equal response.id, 572
    assert_equal response.credentials, "foo"
  end

  def test_update_by_id
    stub_request(:put, "https://core.myedools.info/api/schools/572").
      with(body: "{\"name\":\"test23\"}", headers: {'Authorization'=>'Token token="token_example"', 'Connection'=>'close', 'Content-Type'=>'application/json; charset=UTF-8', 'Host'=>'core.myedools.info', 'User-Agent'=>'http.rb/2.2.2'}).
      to_return(status: 204, body: nil, headers: {})

    response = EdoolsSdk::School.update_by_id(572, "name" => "test23")

    assert_equal response.name, "test23"
  end

  def test_update_by_id!
    stub_request(:put, "https://core.myedools.info/api/schools/572").
      with(body: "{\"name\":\"test23\"}", headers: {'Authorization'=>'Token token="token_example"', 'Connection'=>'close', 'Content-Type'=>'application/json; charset=UTF-8', 'Host'=>'core.myedools.info', 'User-Agent'=>'http.rb/2.2.2'}).
      to_return(status: 204, body: nil, headers: {})

    response = EdoolsSdk::School.update_by_id!(572, "name" => "test23")

    assert_equal response.name, "test23"
  end
end