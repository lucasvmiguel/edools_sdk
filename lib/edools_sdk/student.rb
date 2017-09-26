module EdoolsSdk
  # Student class
  class Student
    attr_accessor(
      :id,
      :first_name,
      :last_name,
      :email,
      :password_digest,
      :cpf,
      :phone,
      :skype,
      :company_name,
      :company_position,
      :born_at,
      :biography,
      :cover_image_url,
      :created_at,
      :updated_at
    )

    STUDENT_URL = 'https://core.myedools.info/api/students'
    INVITATION_URL = 'https://core.myedools.info/api/invitations'
    private_constant :STUDENT_URL, :INVITATION_URL

    # Parse json to Student object
    def self.parse_json(props)
      student = Student.new
      student.id = props['id']
      student.first_name = props['first_name']
      student.last_name = props['last_name']
      student.email = props['email']
      student.password_digest = props['password_digest']
      student.cpf = props['cpf']
      student.phone = props['phone']
      student.skype = props['skype']
      student.company_name = props['company_name']
      student.company_position = props['company_position']
      student.born_at = props['born_at']
      student.biography = props['biography']
      student.cover_image_url = props['cover_image_url']

      unless props['created_at'].nil?
        student.created_at = Date.parse(props['created_at'])
      end
      unless props['updated_at'].nil?
        student.updated_at = Date.parse(props['updated_at'])
      end

      student
    end

    # Get all students
    #
    # Example:
    #   >> Student.all
    #   => [#<EdoolsSdk::Student:0x0000000262e1a0 @id=588417, @first_name="test", @last_name=nil, @email="test@test.com", @password_digest=nil, @cpf=nil, @phone=nil, @skype=nil, @company_name=nil, @company_position=nil, @born_at=nil, @biography=nil, @cover_image_url="https://cdn.edools.com/assets/images/users/default.jpeg", @created_at=#<Date: 2017-09-26 ((2458023j,0s,0n),+0s,2299161j)>, @updated_at=#<Date: 2017-09-26 ((2458023j,0s,0n),+0s,2299161j)>>]
    def self.all
      response = HTTP
        .headers('Authorization' => "Token token=\"#{ENV['edools_token']}\"")
        .get(STUDENT_URL)

      return response if response.status >= 400 && response.status < 600

      body = response.parse(:json)

      body['students'].map { |c| Student.parse_json(c) }
    end

    # Get all students, if anything goes wrong an exception will be raised
    #
    # Example:
    #   >> Student.all
    #   => [#<EdoolsSdk::Student:0x0000000262e1a0 @id=588417, @first_name="test", @last_name=nil, @email="test@test.com", @password_digest=nil, @cpf=nil, @phone=nil, @skype=nil, @company_name=nil, @company_position=nil, @born_at=nil, @biography=nil, @cover_image_url="https://cdn.edools.com/assets/images/users/default.jpeg", @created_at=#<Date: 2017-09-26 ((2458023j,0s,0n),+0s,2299161j)>, @updated_at=#<Date: 2017-09-26 ((2458023j,0s,0n),+0s,2299161j)>>]
    def self.all!
      response = HTTP
        .headers('Authorization' => "Token token=\"#{ENV['edools_token']}\"")
        .get(STUDENT_URL)

      raise "invalid status code #{response.status}" if response.status >= 400 && response.status < 600

      body = response.parse(:json)

      body['students'].map { |c| Student.parse_json(c) }
    end

    # Get all students by Product id
    #
    # Example:
    #   >> Student.all_by_product_id
    #   => [#<EdoolsSdk::Student:0x0000000262e1a0 @id=588417, @first_name="test", @last_name=nil, @email="test@test.com", @password_digest=nil, @cpf=nil, @phone=nil, @skype=nil, @company_name=nil, @company_position=nil, @born_at=nil, @biography=nil, @cover_image_url="https://cdn.edools.com/assets/images/users/default.jpeg", @created_at=#<Date: 2017-09-26 ((2458023j,0s,0n),+0s,2299161j)>, @updated_at=#<Date: 2017-09-26 ((2458023j,0s,0n),+0s,2299161j)>>]
    def self.all_by_product_id(id)
      response = HTTP
        .headers('Authorization' => "Token token=\"#{ENV['edools_token']}\"")
        .get("#{STUDENT_URL}?school_product_id=#{id}")

      return response if response.status >= 400 && response.status < 600

      body = response.parse(:json)

      body['students'].map { |c| Student.parse_json(c) }
    end

    # Get all students by Product id, if anything goes wrong an exception will be raised
    #
    # Example:
    #   >> Student.all_by_product_id
    #   => [#<EdoolsSdk::Student:0x0000000262e1a0 @id=588417, @first_name="test", @last_name=nil, @email="test@test.com", @password_digest=nil, @cpf=nil, @phone=nil, @skype=nil, @company_name=nil, @company_position=nil, @born_at=nil, @biography=nil, @cover_image_url="https://cdn.edools.com/assets/images/users/default.jpeg", @created_at=#<Date: 2017-09-26 ((2458023j,0s,0n),+0s,2299161j)>, @updated_at=#<Date: 2017-09-26 ((2458023j,0s,0n),+0s,2299161j)>>]
    def self.all_by_product_id!(id)
      response = HTTP
        .headers('Authorization' => "Token token=\"#{ENV['edools_token']}\"")
        .get("#{STUDENT_URL}?school_product_id=#{id}")

      raise "invalid status code #{response.status}" if response.status >= 400 && response.status < 600

      body = response.parse(:json)

      body['students'].map { |c| Student.parse_json(c) }
    end

    def self_invite!(password, confirm_password)
      response = HTTP
        .headers('Authorization' => "Token token=\"#{ENV['edools_token']}\"")
        .post(INVITATION_URL, :json => {
          'first_name' => @first_name, 
          'last_name' => @last_name, 
          'email' => @email,
          'password' => password,
          'confirm_password' => confirm_password,
        })

      raise "invalid status code #{response.status}" if response.status >= 400 && response.status < 600

      body = response.parse(:json)

      Invitation.parse_json(body)
    end
  end
end