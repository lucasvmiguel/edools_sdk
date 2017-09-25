require 'minitest/autorun'
require 'edools_sdk'

class SchoolTest < Minitest::Test
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