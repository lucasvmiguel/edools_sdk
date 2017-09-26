require 'minitest/autorun'
require 'edools_sdk'

class EdoolsBaseTest < Minitest::Test
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
end