require "http"

module EdoolsSdk
  # Course class
  class Course
    attr_accessor(
      :id, 
      :name, 
      :description,
      :image_url, 
      :duration, 
      :ready, 
      :path_ids, 
      :forum_section_ids, 
      :linear_requirements,
      :library_resource,
      :created_at,
      :updated_at
    )

    COURSE_URL = 'https://core.myedools.info/api/courses'
    private_constant :COURSE_URL

    def initialize
      @id = nil
      @name = nil
      @description = nil
      @image_url = nil
      @duration = nil
      @ready = nil
      @path_ids = nil
      @forum_section_ids = nil
      @linear_requirements = nil
      @library_resource = nil
      @created_at = nil
      @updated_at = nil
    end

    # Parse Course object to Hash
    def to_h
      hash = {}
      instance_variables.each {|var| hash[var.to_s.delete("@")] = instance_variable_get(var) }
      hash
    end

    # Parse json to Course object
    def self.parse_json(props)
      course = Course.new
      course.id = props['id']
      course.name = props['name']
      course.description = props['description']
      course.image_url = props['image_url']
      course.duration = props['duration']
      course.ready = props['ready']
      course.path_ids = props['path_ids']
      course.forum_section_ids = props['forum_section_ids']
      course.linear_requirements = props['linear_requirements']
      course.library_resource = props['library_resource']

      unless props['created_at'].nil?
        course.created_at = Date.parse(props['created_at'])
      end
      unless props['updated_at'].nil?
        course.updated_at = Date.parse(props['updated_at'])
      end

      course
    end

    # Get all courses, if anything goes wrong an exception will be raised
    #
    # Example:
    #   >> Course.all!
    #   => [#<EdoolsSdk::Course:0x00000001aef0c8 @id=21530, @name="test 4", @description=nil, @image_url=nil, @duration=nil, @ready=nil, @path_ids=[], @forum_section_ids=[], @linear_requirements=nil, @library_resource={"id"=>1152227, "library"=>{"id"=>572}, "library_tags"=>[], "school_products"=>[]}, @created_at=#<Date: 2017-09-25 ((2458022j,0s,0n),+0s,2299161j)>, @updated_at=#<Date: 2017-09-25 ((2458022j,0s,0n),+0s,2299161j)>>]
    def self.all!
      response = HTTP
        .headers('Authorization' => "Token token=\"#{ENV['edools_token']}\"")
        .get(COURSE_URL)

      raise "invalid status code #{response.status}" if response.status >= 400 && response.status < 600

      body = response.parse(:json)

      body['courses'].map { |c| Course.parse_json(c) }
    end

    # Get all courses
    #
    # Example:
    #   >> Course.all!
    #   => [#<EdoolsSdk::Course:0x00000001aef0c8 @id=21530, @name="test 4", @description=nil, @image_url=nil, @duration=nil, @ready=nil, @path_ids=[], @forum_section_ids=[], @linear_requirements=nil, @library_resource={"id"=>1152227, "library"=>{"id"=>572}, "library_tags"=>[], "school_products"=>[]}, @created_at=#<Date: 2017-09-25 ((2458022j,0s,0n),+0s,2299161j)>, @updated_at=#<Date: 2017-09-25 ((2458022j,0s,0n),+0s,2299161j)>>]
    def self.all
      response = HTTP
        .headers('Authorization' => "Token token=\"#{ENV['edools_token']}\"")
        .get(COURSE_URL)

      return response if response.status >= 400 && response.status < 600

      body = response.parse(:json)

      body['courses'].map { |c| Course.parse_json(c) }
    end

    # Save a course, if anything goes wrong an exception will be raised
    #
    # Example:
    #   >> course_instance.save!
    #   => #<EdoolsSdk::Course:0x00000001aef0c8 @id=21530, @name="test 4", @description=nil, @image_url=nil, @duration=nil, @ready=nil, @path_ids=[], @forum_section_ids=[], @linear_requirements=nil, @library_resource={"id"=>1152227, "library"=>{"id"=>572}, "library_tags"=>[], "school_products"=>[]}, @created_at=#<Date: 2017-09-25 ((2458022j,0s,0n),+0s,2299161j)>, @updated_at=#<Date: 2017-09-25 ((2458022j,0s,0n),+0s,2299161j)>>
    def save!
      response = HTTP
        .headers('Authorization' => "Token token=\"#{ENV['edools_token']}\"")
        .post(COURSE_URL, :json => self.to_h)

      raise "invalid status code #{response.status}" if response.status != 201

      body = response.parse(:json)

      course_saved = Course.parse_json(body)

      change_values(course_saved)

      course_saved
    end

    # Save a course
    #
    # Example:
    #   >> course_instance.save
    #   => #<EdoolsSdk::Course:0x00000001aef0c8 @id=21530, @name="test 4", @description=nil, @image_url=nil, @duration=nil, @ready=nil, @path_ids=[], @forum_section_ids=[], @linear_requirements=nil, @library_resource={"id"=>1152227, "library"=>{"id"=>572}, "library_tags"=>[], "school_products"=>[]}, @created_at=#<Date: 2017-09-25 ((2458022j,0s,0n),+0s,2299161j)>, @updated_at=#<Date: 2017-09-25 ((2458022j,0s,0n),+0s,2299161j)>>
    def save
      response = HTTP
        .headers('Authorization' => "Token token=\"#{ENV['edools_token']}\"")
        .post(COURSE_URL, :json => self.to_h)

      return response if response.status != 201

      body = response.parse(:json)

      course_saved = Course.parse_json(body)

      change_values(course_saved)

      course_saved
    end

    # Create a course, if anything goes wrong an exception will be raised
    #
    # Example:
    #   >> Course.create!("name" => "test")
    #   => #<EdoolsSdk::Course:0x00000001aef0c8 @id=21530, @name="test", @description=nil, @image_url=nil, @duration=nil, @ready=nil, @path_ids=[], @forum_section_ids=[], @linear_requirements=nil, @library_resource={"id"=>1152227, "library"=>{"id"=>572}, "library_tags"=>[], "school_products"=>[]}, @created_at=#<Date: 2017-09-25 ((2458022j,0s,0n),+0s,2299161j)>, @updated_at=#<Date: 2017-09-25 ((2458022j,0s,0n),+0s,2299161j)>>
    def self.create!(props)
      response = HTTP
        .headers('Authorization' => "Token token=\"#{ENV['edools_token']}\"")
        .post(COURSE_URL, :json => props)

      raise "invalid status code #{response.status}" if response.status != 201

      body = response.parse(:json)

      Course.parse_json(body)
    end

    # Create a course
    #
    # Example:
    #   >> Course.create("name" => "test")
    #   => #<EdoolsSdk::Course:0x00000001aef0c8 @id=21530, @name="test", @description=nil, @image_url=nil, @duration=nil, @ready=nil, @path_ids=[], @forum_section_ids=[], @linear_requirements=nil, @library_resource={"id"=>1152227, "library"=>{"id"=>572}, "library_tags"=>[], "school_products"=>[]}, @created_at=#<Date: 2017-09-25 ((2458022j,0s,0n),+0s,2299161j)>, @updated_at=#<Date: 2017-09-25 ((2458022j,0s,0n),+0s,2299161j)>>
    def self.create(props)
      response = HTTP
        .headers('Authorization' => "Token token=\"#{ENV['edools_token']}\"")
        .post(COURSE_URL, :json => props)

      return response if response.status != 201

      body = response.parse(:json)

      Course.parse_json(body)
    end

    private

    def change_values(course)
      @id = course.id
      @name = course.name
      @description = course.description
      @image_url = course.image_url
      @duration = course.duration
      @ready = course.ready
      @path_ids = course.path_ids
      @forum_section_ids = course.forum_section_ids
      @linear_requirements = course.linear_requirements
      @library_resource = course.library_resource
      @created_at = course.created_at
      @updated_at = course.updated_at
    end
  end
end