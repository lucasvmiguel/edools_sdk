require "http"

module EdoolsSdk
  # Product class
  class Product
    attr_accessor(
      :id,
      :title,
      :description,
      :subtitle,
      :logo,
      :video_url,
      :video_title,
      :video_description,
      :published,
      :hidden,
      :restricted,
      :certification,
      :classes_auto_generation,
      :certification_min_progress,
      :meta_title,
      :meta_description,
      :meta_keys,
      :available_time_type,
      :available_time_length,
      :available_time_unit,
      :expire_date,
      :library_resource_id,
      :max_attendance_type,
      :max_attendance_length,
      :allowed_emails,
      :class_teacher_ids,
      :category_ids,
      :gallery_media_ids,
      :created_at,
      :updated_at
    )

    PRODUCT_URL = 'https://core.myedools.info/api/schools/'
    PRODUCT_URL_WITHOUT_SCHOOL = 'https://core.myedools.info/api/school_products'
    private_constant :PRODUCT_URL

    def initialize
      @id = nil
      @title = nil
      @description = nil
      @subtitle = nil
      @logo = nil
      @video_url = nil
      @video_title = nil
      @video_description = nil
      @published = nil
      @hidden = nil
      @restricted = nil
      @certification = nil
      @classes_auto_generation = nil
      @certification_min_progress = nil
      @meta_title = nil
      @meta_description = nil
      @meta_keys = nil
      @available_time_type = nil
      @available_time_length = nil
      @available_time_unit = nil
      @expire_date = nil
      @library_resource_id = nil
      @max_attendance_type = nil
      @max_attendance_length = nil
      @allowed_emails = nil
      @class_teacher_ids = nil
      @category_ids = nil
      @gallery_media_ids = nil
      @created_at = nil
      @updated_at = nil
    end

    # Parse Product object to Hash
    def to_h
      hash = {}
      instance_variables.each {|var| hash[var.to_s.delete("@")] = instance_variable_get(var) }
      hash
    end

    # Parse json to Product object
    def self.parse_json(props)
      product = Product.new

      product.id = props['id']
      product.title = props['title']
      product.description = props['description']
      product.subtitle = props['subtitle']
      product.logo = props['logo']
      product.video_url = props['video_url']
      product.video_title = props['video_title']
      product.video_description = props['video_description']
      product.published = props['published']
      product.hidden = props['hidden']
      product.restricted = props['restricted']
      product.certification = props['certification']
      product.classes_auto_generation = props['classes_auto_generation']
      product.certification_min_progress = props['certification_min_progress']
      product.meta_title = props['meta_title']
      product.meta_description = props['meta_description']
      product.meta_keys = props['meta_keys']
      product.available_time_type = props['available_time_type']
      product.available_time_length = props['available_time_length']
      product.available_time_unit = props['available_time_unit']
      product.expire_date = props['expire_date']
      product.library_resource_id = props['library_resource_id']
      product.max_attendance_type = props['max_attendance_type']
      product.max_attendance_length = props['max_attendance_length']
      product.allowed_emails = props['allowed_emails']
      product.class_teacher_ids = props['class_teacher_ids']
      product.category_ids = props['category_ids']
      product.gallery_media_ids = props['gallery_media_ids']

      unless props['created_at'].nil?
        product.created_at = Date.parse(props['created_at'])
      end
      unless props['updated_at'].nil?
        product.updated_at = Date.parse(props['updated_at'])
      end

      product
    end

    # Get all products, if anything goes wrong an exception will be raised
    #
    # Example:
    #   >> Product.all!
    #   => [#<EdoolsSdk::Product:0x00000002bc4a88 @id=22395, @title="test product 1", @description=nil, @subtitle=nil, @logo=nil, @video_url=nil, @video_title=nil, @video_description=nil, @published=false, @hidden=false, @restricted=false, @certification=false, @classes_auto_generation=false, @certification_min_progress=nil, @meta_title=nil, @meta_description=nil, @meta_keys=nil, @available_time_type="indeterminate", @available_time_length=nil, @available_time_unit=nil, @expire_date=nil, @library_resource_id=nil, @max_attendance_type="indeterminate", @max_attendance_length=nil, @allowed_emails=[], @class_teacher_ids=nil, @category_ids=nil, @gallery_media_ids=nil, @created_at=#<Date: 2017-09-25 ((2458022j,0s,0n),+0s,2299161j)>, @updated_at=#<Date: 2017-09-25 ((2458022j,0s,0n),+0s,2299161j)>>] 
    def self.all!
      response = HTTP
        .headers('Authorization' => "Token token=\"#{ENV['edools_token']}\"")
        .get(PRODUCT_URL_WITHOUT_SCHOOL)

      raise "invalid status code #{response.status}" if response.status >= 400 && response.status < 600

      body = response.parse(:json)

      body['school_products'].map { |c| Product.parse_json(c) }
    end

    # Get all products
    #
    # Example:
    #   >> Product.all!
    #   => [#<EdoolsSdk::Product:0x00000002bc4a88 @id=22395, @title="test product 1", @description=nil, @subtitle=nil, @logo=nil, @video_url=nil, @video_title=nil, @video_description=nil, @published=false, @hidden=false, @restricted=false, @certification=false, @classes_auto_generation=false, @certification_min_progress=nil, @meta_title=nil, @meta_description=nil, @meta_keys=nil, @available_time_type="indeterminate", @available_time_length=nil, @available_time_unit=nil, @expire_date=nil, @library_resource_id=nil, @max_attendance_type="indeterminate", @max_attendance_length=nil, @allowed_emails=[], @class_teacher_ids=nil, @category_ids=nil, @gallery_media_ids=nil, @created_at=#<Date: 2017-09-25 ((2458022j,0s,0n),+0s,2299161j)>, @updated_at=#<Date: 2017-09-25 ((2458022j,0s,0n),+0s,2299161j)>>] 
    def self.all
      response = HTTP
        .headers('Authorization' => "Token token=\"#{ENV['edools_token']}\"")
        .get(PRODUCT_URL_WITHOUT_SCHOOL)

      return response if response.status >= 400 && response.status < 600

      body = response.parse(:json)

      body['school_products'].map { |c| Product.parse_json(c) }
    end

    # Save a product, if anything goes wrong an exception will be raised
    #
    # Example:
    #   >> product_instance.save(222)!
    #   => #<EdoolsSdk::Product:0x00000002bc4a88 @id=22395, @title="test product 1", @description=nil, @subtitle=nil, @logo=nil, @video_url=nil, @video_title=nil, @video_description=nil, @published=false, @hidden=false, @restricted=false, @certification=false, @classes_auto_generation=false, @certification_min_progress=nil, @meta_title=nil, @meta_description=nil, @meta_keys=nil, @available_time_type="indeterminate", @available_time_length=nil, @available_time_unit=nil, @expire_date=nil, @library_resource_id=nil, @max_attendance_type="indeterminate", @max_attendance_length=nil, @allowed_emails=[], @class_teacher_ids=nil, @category_ids=nil, @gallery_media_ids=nil, @created_at=#<Date: 2017-09-25 ((2458022j,0s,0n),+0s,2299161j)>, @updated_at=#<Date: 2017-09-25 ((2458022j,0s,0n),+0s,2299161j)>>
    def save!(school_id)
      response = HTTP
        .headers('Authorization' => "Token token=\"#{ENV['edools_token']}\"")
        .post("#{PRODUCT_URL}#{school_id}/school_products", :json => self.to_h)

      raise "invalid status code #{response.status}" if response.status != 201

      body = response.parse(:json)

      product_saved = Product.parse_json(body)

      change_values(product_saved)

      product_saved
    end

    # Save a product
    #
    # Example:
    #   >> product_instance.save(222)
    #   => #<EdoolsSdk::Product:0x00000002bc4a88 @id=22395, @title="test product 1", @description=nil, @subtitle=nil, @logo=nil, @video_url=nil, @video_title=nil, @video_description=nil, @published=false, @hidden=false, @restricted=false, @certification=false, @classes_auto_generation=false, @certification_min_progress=nil, @meta_title=nil, @meta_description=nil, @meta_keys=nil, @available_time_type="indeterminate", @available_time_length=nil, @available_time_unit=nil, @expire_date=nil, @library_resource_id=nil, @max_attendance_type="indeterminate", @max_attendance_length=nil, @allowed_emails=[], @class_teacher_ids=nil, @category_ids=nil, @gallery_media_ids=nil, @created_at=#<Date: 2017-09-25 ((2458022j,0s,0n),+0s,2299161j)>, @updated_at=#<Date: 2017-09-25 ((2458022j,0s,0n),+0s,2299161j)>>
    def save(school_id)
      response = HTTP
        .headers('Authorization' => "Token token=\"#{ENV['edools_token']}\"")
        .post("#{PRODUCT_URL}#{school_id}/school_products", :json => self.to_h)

      return response if response.status != 201

      body = response.parse(:json)

      product_saved = Product.parse_json(body)

      change_values(product_saved)

      product_saved
    end

    # Create a product, if anything goes wrong an exception will be raised
    #
    # Example:
    #   >> Product.create!(222, "title" => "test")
    #   => #<EdoolsSdk::Product:0x00000002bc4a88 @id=22395, @title="test product 1", @description=nil, @subtitle=nil, @logo=nil, @video_url=nil, @video_title=nil, @video_description=nil, @published=false, @hidden=false, @restricted=false, @certification=false, @classes_auto_generation=false, @certification_min_progress=nil, @meta_title=nil, @meta_description=nil, @meta_keys=nil, @available_time_type="indeterminate", @available_time_length=nil, @available_time_unit=nil, @expire_date=nil, @library_resource_id=nil, @max_attendance_type="indeterminate", @max_attendance_length=nil, @allowed_emails=[], @class_teacher_ids=nil, @category_ids=nil, @gallery_media_ids=nil, @created_at=#<Date: 2017-09-25 ((2458022j,0s,0n),+0s,2299161j)>, @updated_at=#<Date: 2017-09-25 ((2458022j,0s,0n),+0s,2299161j)>>
    def self.create!(school_id, props)
      response = HTTP
        .headers('Authorization' => "Token token=\"#{ENV['edools_token']}\"")
        .post("#{PRODUCT_URL}#{school_id}/school_products", :json => props)

      raise "invalid status code #{response.status}" if response.status != 201

      body = response.parse(:json)

      Product.parse_json(body)
    end

    # Create a product
    #
    # Example:
    #   >> Product.create(222, "title" => "test")
    #   => #<EdoolsSdk::Product:0x00000002bc4a88 @id=22395, @title="test product 1", @description=nil, @subtitle=nil, @logo=nil, @video_url=nil, @video_title=nil, @video_description=nil, @published=false, @hidden=false, @restricted=false, @certification=false, @classes_auto_generation=false, @certification_min_progress=nil, @meta_title=nil, @meta_description=nil, @meta_keys=nil, @available_time_type="indeterminate", @available_time_length=nil, @available_time_unit=nil, @expire_date=nil, @library_resource_id=nil, @max_attendance_type="indeterminate", @max_attendance_length=nil, @allowed_emails=[], @class_teacher_ids=nil, @category_ids=nil, @gallery_media_ids=nil, @created_at=#<Date: 2017-09-25 ((2458022j,0s,0n),+0s,2299161j)>, @updated_at=#<Date: 2017-09-25 ((2458022j,0s,0n),+0s,2299161j)>>
    def self.create(school_id, props)
      response = HTTP
        .headers('Authorization' => "Token token=\"#{ENV['edools_token']}\"")
        .post("#{PRODUCT_URL}#{school_id}/school_products", :json => props)

      return response if response.status != 201

      body = response.parse(:json)

      Product.parse_json(body)
    end

    private

    def change_values(product)
      @id = product.id
      @title = product.title
      @description = product.description
      @subtitle = product.subtitle
      @logo = product.logo
      @video_url = product.video_url
      @video_title = product.video_title
      @video_description = product.video_description
      @published = product.published
      @hidden = product.hidden
      @restricted = product.restricted
      @certification = product.certification
      @classes_auto_generation = product.classes_auto_generation
      @certification_min_progress = product.certification_min_progress
      @meta_title = product.meta_title
      @meta_description = product.meta_description
      @meta_keys = product.meta_keys
      @available_time_type = product.available_time_type
      @available_time_length = product.available_time_length
      @available_time_unit = product.available_time_unit
      @expire_date = product.expire_date
      @library_resource_id = product.library_resource_id
      @max_attendance_type = product.max_attendance_type
      @max_attendance_length = product.max_attendance_length
      @allowed_emails = product.allowed_emails
      @class_teacher_ids = product.class_teacher_ids
      @category_ids = product.category_ids
      @gallery_media_ids = product.gallery_media_ids
      @created_at = product.created_at
      @updated_at = product.updated_at
    end
  end
end