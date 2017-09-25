require 'minitest/autorun'
require 'webmock/minitest'
require 'edools_sdk'

ENV["edools_token"] = "token_example"

class CourseTest < Minitest::Test
  def test_to_h
    course1 = EdoolsSdk::Course.new
    course1.name = 'test1'

    course2 = EdoolsSdk::Course.new
    course2.description = 'test2'

    expected1 = {"id"=>nil, "name"=>"test1", "description"=>nil, "image_url"=>nil, "duration"=>nil, "ready"=>nil, "path_ids"=>nil, "forum_section_ids"=>nil, "linear_requirements"=>nil, "library_resource"=>nil, "created_at"=>nil, "updated_at"=>nil}
    expected2 = {"id"=>nil, "name"=>nil, "description"=>"test2", "image_url"=>nil, "duration"=>nil, "ready"=>nil, "path_ids"=>nil, "forum_section_ids"=>nil, "linear_requirements"=>nil, "library_resource"=>nil, "created_at"=>nil, "updated_at"=>nil}

    assert_equal expected1, course1.to_h
    assert_equal expected2, course2.to_h
  end

  def test_parse_json
    course1_json = {"id"=>nil, "name"=>"test1", "description"=>nil, "image_url"=>nil, "duration"=>nil, "ready"=>nil, "path_ids"=>nil, "forum_section_ids"=>nil, "linear_requirements"=>nil, "library_resource"=>nil, "created_at"=>nil, "updated_at"=>nil}
    course2_json = {"id"=>nil, "name"=>nil, "description"=>"test2", "image_url"=>nil, "duration"=>nil, "ready"=>nil, "path_ids"=>nil, "forum_section_ids"=>nil, "linear_requirements"=>nil, "library_resource"=>nil, "created_at"=>nil, "updated_at"=>nil}

    expected1 = EdoolsSdk::Course.new
    expected1.name = 'test1'

    expected2 = EdoolsSdk::Course.new
    expected2.description = 'test2'

    assert_equal expected1.name, EdoolsSdk::Course.parse_json(course1_json).name
    assert_nil EdoolsSdk::Course.parse_json(course1_json).description
    assert_nil EdoolsSdk::Course.parse_json(course2_json).name
    assert_equal expected2.description, EdoolsSdk::Course.parse_json(course2_json).description
  end

  def test_initialize
    course = EdoolsSdk::Course.new

    assert_nil course.id
    assert_nil course.name
    assert_nil course.description
    assert_nil course.image_url
    assert_nil course.duration
    assert_nil course.ready
    assert_nil course.path_ids
    assert_nil course.forum_section_ids
    assert_nil course.linear_requirements
    assert_nil course.library_resource
    assert_nil course.created_at
    assert_nil course.updated_at
  end

  def test_all
    stub_request(:get, "https://core.myedools.info/api/courses").
      with(headers: {'Authorization'=>'Token token="token_example"', 'Connection'=>'close', 'Host'=>'core.myedools.info', 'User-Agent'=>'http.rb/2.2.2'}).
      to_return(status: 200, body: File.open("#{Dir.pwd}/test/mocks/courses_response.json", 'rb'), headers: {})

    response = EdoolsSdk::Course.all

    assert_equal response.size, 1
    assert_equal response.first.id, 21530
    assert_equal response.first.name, "test 4"
  end

  def test_all!
    stub_request(:get, "https://core.myedools.info/api/courses").
      with(headers: {'Authorization'=>'Token token="token_example"', 'Connection'=>'close', 'Host'=>'core.myedools.info', 'User-Agent'=>'http.rb/2.2.2'}).
      to_return(status: 200, body: File.open("#{Dir.pwd}/test/mocks/courses_response.json", 'rb'), headers: {})

    response = EdoolsSdk::Course.all

    assert_equal response.size, 1
    assert_equal response.first.id, 21530
    assert_equal response.first.name, "test 4"
  end

  def test_create
    stub_request(:post, "https://core.myedools.info/api/courses").
      with(body: "{\"name\":\"test\"}", headers: {'Authorization'=>'Token token="token_example"', 'Connection'=>'close', 'Content-Type'=>'application/json; charset=UTF-8', 'Host'=>'core.myedools.info', 'User-Agent'=>'http.rb/2.2.2'}).
      to_return(status: 201, body: "{\"id\":1,\"name\":\"test\"}", headers: {})

    response = EdoolsSdk::Course.create("name" => "test")

    assert_equal response.id, 1
    assert_equal response.name, "test"
  end

  def test_create!
    stub_request(:post, "https://core.myedools.info/api/courses").
      with(body: "{\"name\":\"test\"}", headers: {'Authorization'=>'Token token="token_example"', 'Connection'=>'close', 'Content-Type'=>'application/json; charset=UTF-8', 'Host'=>'core.myedools.info', 'User-Agent'=>'http.rb/2.2.2'}).
      to_return(status: 201, body: "{\"id\":1,\"name\":\"test\"}", headers: {})

    response = EdoolsSdk::Course.create!("name" => "test")

    assert_equal response.id, 1
    assert_equal response.name, "test"
  end

  def test_save
    stub_request(:post, "https://core.myedools.info/api/courses").
      with(body: "{\"id\":null,\"name\":\"test\",\"description\":null,\"image_url\":null,\"duration\":null,\"ready\":null,\"path_ids\":null,\"forum_section_ids\":null,\"linear_requirements\":null,\"library_resource\":null,\"created_at\":null,\"updated_at\":null}", headers: {'Authorization'=>'Token token="token_example"', 'Connection'=>'close', 'Content-Type'=>'application/json; charset=UTF-8', 'Host'=>'core.myedools.info', 'User-Agent'=>'http.rb/2.2.2'}).
      to_return(status: 201, body: "{\"id\":1,\"name\":\"test\"}", headers: {})

    course = EdoolsSdk::Course.new
    course.name = "test"

    response = course.save

    assert_equal response.id, 1
    assert_equal response.name, "test"
  end

  def test_save!
    stub_request(:post, "https://core.myedools.info/api/courses").
      with(body: "{\"id\":null,\"name\":\"test\",\"description\":null,\"image_url\":null,\"duration\":null,\"ready\":null,\"path_ids\":null,\"forum_section_ids\":null,\"linear_requirements\":null,\"library_resource\":null,\"created_at\":null,\"updated_at\":null}", headers: {'Authorization'=>'Token token="token_example"', 'Connection'=>'close', 'Content-Type'=>'application/json; charset=UTF-8', 'Host'=>'core.myedools.info', 'User-Agent'=>'http.rb/2.2.2'}).
      to_return(status: 201, body: "{\"id\":1,\"name\":\"test\"}", headers: {})

    course = EdoolsSdk::Course.new
    course.name = "test"

    response = course.save!

    assert_equal response.id, 1
    assert_equal response.name, "test"
  end
end