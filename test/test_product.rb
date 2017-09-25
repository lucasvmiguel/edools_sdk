require 'minitest/autorun'
require 'edools_sdk'

class ProductTest < Minitest::Test
  def test_to_h
    product1 = EdoolsSdk::Product.new
    product1.title = 'test1'

    product2 = EdoolsSdk::Product.new
    product2.description = 'test2'

    expected1 = {"id"=>nil, "title"=>"test1", "description"=>nil, "subtitle"=>nil, "logo"=>nil, "video_url"=>nil, "video_title"=>nil, "video_description"=>nil, "published"=>nil, "hidden"=>nil, "restricted"=>nil, "certification"=>nil, "classes_auto_generation"=>nil, "certification_min_progress"=>nil, "meta_title"=>nil, "meta_description"=>nil, "meta_keys"=>nil, "available_time_type"=>nil, "available_time_length"=>nil, "available_time_unit"=>nil, "expire_date"=>nil, "library_resource_id"=>nil, "max_attendance_type"=>nil, "max_attendance_length"=>nil, "allowed_emails"=>nil, "class_teacher_ids"=>nil, "category_ids"=>nil, "gallery_media_ids"=>nil, "created_at"=>nil, "updated_at"=>nil}
    expected2 = {"id"=>nil, "title"=>nil, "description"=>"test2", "subtitle"=>nil, "logo"=>nil, "video_url"=>nil, "video_title"=>nil, "video_description"=>nil, "published"=>nil, "hidden"=>nil, "restricted"=>nil, "certification"=>nil, "classes_auto_generation"=>nil, "certification_min_progress"=>nil, "meta_title"=>nil, "meta_description"=>nil, "meta_keys"=>nil, "available_time_type"=>nil, "available_time_length"=>nil, "available_time_unit"=>nil, "expire_date"=>nil, "library_resource_id"=>nil, "max_attendance_type"=>nil, "max_attendance_length"=>nil, "allowed_emails"=>nil, "class_teacher_ids"=>nil, "category_ids"=>nil, "gallery_media_ids"=>nil, "created_at"=>nil, "updated_at"=>nil}

    assert_equal expected1, product1.to_h
    assert_equal expected2, product2.to_h
  end

  def test_parse_json
    product1_json = {"id"=>nil, "title"=>"test1", "description"=>nil, "subtitle"=>nil, "logo"=>nil, "video_url"=>nil, "video_title"=>nil, "video_description"=>nil, "published"=>nil, "hidden"=>nil, "restricted"=>nil, "certification"=>nil, "classes_auto_generation"=>nil, "certification_min_progress"=>nil, "meta_title"=>nil, "meta_description"=>nil, "meta_keys"=>nil, "available_time_type"=>nil, "available_time_length"=>nil, "available_time_unit"=>nil, "expire_date"=>nil, "library_resource_id"=>nil, "max_attendance_type"=>nil, "max_attendance_length"=>nil, "allowed_emails"=>nil, "class_teacher_ids"=>nil, "category_ids"=>nil, "gallery_media_ids"=>nil, "created_at"=>nil, "updated_at"=>nil}
    product2_json = {"id"=>nil, "title"=>nil, "description"=>"test2", "subtitle"=>nil, "logo"=>nil, "video_url"=>nil, "video_title"=>nil, "video_description"=>nil, "published"=>nil, "hidden"=>nil, "restricted"=>nil, "certification"=>nil, "classes_auto_generation"=>nil, "certification_min_progress"=>nil, "meta_title"=>nil, "meta_description"=>nil, "meta_keys"=>nil, "available_time_type"=>nil, "available_time_length"=>nil, "available_time_unit"=>nil, "expire_date"=>nil, "library_resource_id"=>nil, "max_attendance_type"=>nil, "max_attendance_length"=>nil, "allowed_emails"=>nil, "class_teacher_ids"=>nil, "category_ids"=>nil, "gallery_media_ids"=>nil, "created_at"=>nil, "updated_at"=>nil}

    expected1 = EdoolsSdk::Product.new
    expected1.title = 'test1'

    expected2 = EdoolsSdk::Product.new
    expected2.description = 'test2'

    assert_equal expected1.title, EdoolsSdk::Product.parse_json(product1_json).title
    assert_nil EdoolsSdk::Product.parse_json(product1_json).description
    assert_nil EdoolsSdk::Product.parse_json(product2_json).title
    assert_equal expected2.description, EdoolsSdk::Product.parse_json(product2_json).description
  end

  def test_initialize
    product = EdoolsSdk::Product.new

    assert_nil product.id
    assert_nil product.title
    assert_nil product.description
    assert_nil product.subtitle
    assert_nil product.logo
    assert_nil product.video_url
    assert_nil product.video_title
    assert_nil product.video_description
    assert_nil product.published
    assert_nil product.hidden
    assert_nil product.restricted
    assert_nil product.certification
    assert_nil product.classes_auto_generation
    assert_nil product.certification_min_progress
    assert_nil product.meta_title
    assert_nil product.meta_description
    assert_nil product.meta_keys
    assert_nil product.available_time_type
    assert_nil product.available_time_length
    assert_nil product.available_time_unit
    assert_nil product.expire_date
    assert_nil product.library_resource_id
    assert_nil product.max_attendance_type
    assert_nil product.max_attendance_length
    assert_nil product.allowed_emails
    assert_nil product.class_teacher_ids
    assert_nil product.category_ids
    assert_nil product.gallery_media_ids
    assert_nil product.created_at
    assert_nil product.updated_at
  end

  def test_all
    stub_request(:get, "https://core.myedools.info/api/school_products").
      with(headers: {'Authorization'=>'Token token="token_example"', 'Connection'=>'close', 'Host'=>'core.myedools.info', 'User-Agent'=>'http.rb/2.2.2'}).
      to_return(status: 200, body: File.open("#{Dir.pwd}/test/mocks/products_response.json", 'rb'), headers: {})

    response = EdoolsSdk::Product.all

    assert_equal response.size, 1
    assert_equal response.first.id, 22395
    assert_equal response.first.title, "test product 1"
  end

  def test_all!
    stub_request(:get, "https://core.myedools.info/api/school_products").
      with(headers: {'Authorization'=>'Token token="token_example"', 'Connection'=>'close', 'Host'=>'core.myedools.info', 'User-Agent'=>'http.rb/2.2.2'}).
      to_return(status: 200, body: File.open("#{Dir.pwd}/test/mocks/products_response.json", 'rb'), headers: {})

    response = EdoolsSdk::Product.all

    assert_equal response.size, 1
    assert_equal response.first.id, 22395
    assert_equal response.first.title, "test product 1"
  end

  def test_create
    stub_request(:post, "https://core.myedools.info/api/schools/111/school_products").
      with(body: "{\"title\":\"test\"}", headers: {'Authorization'=>'Token token="token_example"', 'Connection'=>'close', 'Content-Type'=>'application/json; charset=UTF-8', 'Host'=>'core.myedools.info', 'User-Agent'=>'http.rb/2.2.2'}).
      to_return(status: 201, body: "{\"id\":1,\"title\":\"test\"}", headers: {})

    response = EdoolsSdk::Product.create(111, "title" => "test")

    assert_equal response.id, 1
    assert_equal response.title, "test"
  end

  def test_create!
    stub_request(:post, "https://core.myedools.info/api/schools/111/school_products").
      with(body: "{\"title\":\"test\"}", headers: {'Authorization'=>'Token token="token_example"', 'Connection'=>'close', 'Content-Type'=>'application/json; charset=UTF-8', 'Host'=>'core.myedools.info', 'User-Agent'=>'http.rb/2.2.2'}).
      to_return(status: 201, body: "{\"id\":1,\"title\":\"test\"}", headers: {})

    response = EdoolsSdk::Product.create!(111, "title" => "test")

    assert_equal response.id, 1
    assert_equal response.title, "test"
  end

  def test_save
    stub_request(:post, "https://core.myedools.info/api/schools/111/school_products").
      with(body: "{\"id\":null,\"title\":\"test\",\"description\":null,\"subtitle\":null,\"logo\":null,\"video_url\":null,\"video_title\":null,\"video_description\":null,\"published\":null,\"hidden\":null,\"restricted\":null,\"certification\":null,\"classes_auto_generation\":null,\"certification_min_progress\":null,\"meta_title\":null,\"meta_description\":null,\"meta_keys\":null,\"available_time_type\":null,\"available_time_length\":null,\"available_time_unit\":null,\"expire_date\":null,\"library_resource_id\":null,\"max_attendance_type\":null,\"max_attendance_length\":null,\"allowed_emails\":null,\"class_teacher_ids\":null,\"category_ids\":null,\"gallery_media_ids\":null,\"created_at\":null,\"updated_at\":null}", headers: {'Authorization'=>'Token token="token_example"', 'Connection'=>'close', 'Content-Type'=>'application/json; charset=UTF-8', 'Host'=>'core.myedools.info', 'User-Agent'=>'http.rb/2.2.2'}).
      to_return(status: 201, body: "{\"id\":1,\"title\":\"test\"}", headers: {})

    product = EdoolsSdk::Product.new
    product.title = "test"
    response = product.save(111)

    assert_equal response.id, 1
    assert_equal response.title, "test"
  end

  def test_save!
    stub_request(:post, "https://core.myedools.info/api/schools/111/school_products").
      with(body: "{\"id\":null,\"title\":\"test\",\"description\":null,\"subtitle\":null,\"logo\":null,\"video_url\":null,\"video_title\":null,\"video_description\":null,\"published\":null,\"hidden\":null,\"restricted\":null,\"certification\":null,\"classes_auto_generation\":null,\"certification_min_progress\":null,\"meta_title\":null,\"meta_description\":null,\"meta_keys\":null,\"available_time_type\":null,\"available_time_length\":null,\"available_time_unit\":null,\"expire_date\":null,\"library_resource_id\":null,\"max_attendance_type\":null,\"max_attendance_length\":null,\"allowed_emails\":null,\"class_teacher_ids\":null,\"category_ids\":null,\"gallery_media_ids\":null,\"created_at\":null,\"updated_at\":null}", headers: {'Authorization'=>'Token token="token_example"', 'Connection'=>'close', 'Content-Type'=>'application/json; charset=UTF-8', 'Host'=>'core.myedools.info', 'User-Agent'=>'http.rb/2.2.2'}).
      to_return(status: 201, body: "{\"id\":1,\"title\":\"test\"}", headers: {})

    product = EdoolsSdk::Product.new
    product.title = "test"
    response = product.save!(111)

    assert_equal response.id, 1
    assert_equal response.title, "test"
  end
end