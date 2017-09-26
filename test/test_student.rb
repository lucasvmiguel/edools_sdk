require 'minitest/autorun'
require 'edools_sdk'

ENV["edools_token"] = "token_example"

class StudentTest < Minitest::Test

  def test_parse_json
    student1_json = {'first_name' => 'test1', 'email' => 'test1@test1'}
    student2_json = {'first_name' => 'test2', 'email' => 'test2@test2'}

    expected1 = EdoolsSdk::Student.new
    expected1.first_name = 'test1'
    expected1.email = 'test1@test1'

    expected2 = EdoolsSdk::Student.new
    expected2.first_name = 'test2'
    expected2.email = 'test2@test2'

    assert_equal expected1.first_name, EdoolsSdk::Student.parse_json(student1_json).first_name
    assert_equal expected1.email, EdoolsSdk::Student.parse_json(student1_json).email
    assert_equal expected2.first_name, EdoolsSdk::Student.parse_json(student2_json).first_name
    assert_equal expected2.email, EdoolsSdk::Student.parse_json(student2_json).email
  end

  def test_initialize
    student = EdoolsSdk::Student.new

    assert_nil student.id
    assert_nil student.first_name
    assert_nil student.last_name
    assert_nil student.email
    assert_nil student.password_digest
    assert_nil student.cpf
    assert_nil student.phone
    assert_nil student.skype
    assert_nil student.company_name
    assert_nil student.company_position
    assert_nil student.born_at
    assert_nil student.biography
    assert_nil student.cover_image_url
    assert_nil student.created_at
    assert_nil student.updated_at
  end

  def test_all
    stub_request(:get, "https://core.myedools.info/api/students").
      with(headers: {'Authorization'=>'Token token="token_example"', 'Connection'=>'close', 'Host'=>'core.myedools.info', 'User-Agent'=>'http.rb/2.2.2'}).
      to_return(status: 200, body: File.open("#{Dir.pwd}/test/mocks/students_response.json", 'rb'), headers: {})

    response = EdoolsSdk::Student.all

    assert_equal response.size, 1
    assert_equal response.first.id, 588417
    assert_equal response.first.email, "test@test.com"
  end

  def test_all!
    stub_request(:get, "https://core.myedools.info/api/students").
      with(headers: {'Authorization'=>'Token token="token_example"', 'Connection'=>'close', 'Host'=>'core.myedools.info', 'User-Agent'=>'http.rb/2.2.2'}).
      to_return(status: 200, body: File.open("#{Dir.pwd}/test/mocks/students_response.json", 'rb'), headers: {})

    response = EdoolsSdk::Student.all!

    assert_equal response.size, 1
    assert_equal response.first.id, 588417
    assert_equal response.first.email, "test@test.com"
  end

  def test_all_by_product_id
    stub_request(:get, "https://core.myedools.info/api/students?school_product_id=1").
      with(headers: {'Authorization'=>'Token token="token_example"', 'Connection'=>'close', 'Host'=>'core.myedools.info', 'User-Agent'=>'http.rb/2.2.2'}).
      to_return(status: 200, body: File.open("#{Dir.pwd}/test/mocks/students_response.json", 'rb'), headers: {})

    response = EdoolsSdk::Student.all_by_product_id(1)

    assert_equal response.size, 1
    assert_equal response.first.id, 588417
    assert_equal response.first.email, "test@test.com"
  end

  def test_all_by_product_id!
    stub_request(:get, "https://core.myedools.info/api/students?school_product_id=1").
      with(headers: {'Authorization'=>'Token token="token_example"', 'Connection'=>'close', 'Host'=>'core.myedools.info', 'User-Agent'=>'http.rb/2.2.2'}).
      to_return(status: 200, body: File.open("#{Dir.pwd}/test/mocks/students_response.json", 'rb'), headers: {})

    response = EdoolsSdk::Student.all_by_product_id!(1)

    assert_equal response.size, 1
    assert_equal response.first.id, 588417
    assert_equal response.first.email, "test@test.com"
  end

  def test_self_invite!
    stub_request(:post, "https://core.myedools.info/api/invitations").
      with(body: "{\"first_name\":\"test\",\"last_name\":\"test\",\"email\":\"test@test\",\"password\":\"123456\",\"confirm_password\":\"123456\"}", headers: {'Authorization'=>'Token token="token_example"', 'Connection'=>'close', 'Host'=>'core.myedools.info', 'User-Agent'=>'http.rb/2.2.2'}).
      to_return(status: 200, body: File.open("#{Dir.pwd}/test/mocks/invitation_response.json", 'rb'), headers: {})

    student = EdoolsSdk::Student.new
    student.id = 588417
    student.first_name = 'test'
    student.last_name = 'test'
    student.email = 'test@test'

    response = student.self_invite!('123456', '123456')

    assert_equal response.id, 588415
    assert_equal response.email, "test@live.com"
  end

  def test_self_invite
    stub_request(:post, "https://core.myedools.info/api/invitations").
      with(body: "{\"first_name\":\"test\",\"last_name\":\"test\",\"email\":\"test@test\",\"password\":\"123456\",\"confirm_password\":\"123456\"}", headers: {'Authorization'=>'Token token="token_example"', 'Connection'=>'close', 'Host'=>'core.myedools.info', 'User-Agent'=>'http.rb/2.2.2'}).
      to_return(status: 200, body: File.open("#{Dir.pwd}/test/mocks/invitation_response.json", 'rb'), headers: {})

    student = EdoolsSdk::Student.new
    student.id = 588417
    student.first_name = 'test'
    student.last_name = 'test'
    student.email = 'test@test'

    response = student.self_invite('123456', '123456')

    assert_equal response.id, 588415
    assert_equal response.email, "test@live.com"
  end
end