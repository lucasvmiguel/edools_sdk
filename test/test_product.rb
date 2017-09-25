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
end