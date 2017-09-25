require 'minitest/autorun'
require 'edools_sdk'

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
end