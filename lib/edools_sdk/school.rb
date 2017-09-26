module EdoolsSdk
  # School class
  class School < EdoolsBase
    attr_accessor(
      :id,
      :credentials,
      :name,
      :password,
      :subdomain,
      :domains,
      :rdstation_token,
      :adroll_adv_id,
      :adroll_pix_id,
      :email,
      :phone,
      :cnpj,
      :samba_key,
      :samba_player_key,
      :samba_access_token,
      :samba_project_id,
      :terms_of_use,
      :facebook,
      :twitter,
      :linkedin,
      :pinterest,
      :google_plus,
      :youtube,
      :instagram,
      :site,
      :address,
      :company_name,
      :seo_title,
      :seo_description,
      :logo,
      :metadata,
      :meta_available_locales,
      :event,
      :created_at,
      :updated_at
    )

    SCHOOL_URL_CREATE = 'https://core.myedools.info/api/schools/wizard'
    SCHOOL_URL_UPDATE = 'https://core.myedools.info/api/schools/'
    private_constant :SCHOOL_URL_CREATE, :SCHOOL_URL_UPDATE

    def initialize
      @id = nil
      @credentials = nil
      @name = nil
      @password = nil
      @subdomain = nil
      @domains = nil
      @rdstation_token = nil
      @adroll_adv_id = nil
      @adroll_pix_id = nil
      @email = nil
      @phone = nil
      @cnpj = nil
      @samba_key = nil
      @samba_player_key = nil
      @samba_access_token = nil
      @samba_project_id = nil
      @terms_of_use = nil
      @adroll_adv_id = nil
      @adroll_pix_id = nil
      @facebook = nil
      @twitter = nil
      @linkedin = nil
      @pinterest = nil
      @google_plus = nil
      @youtube = nil
      @instagram = nil
      @site = nil
      @address = nil
      @company_name = nil
      @seo_title = nil
      @seo_description = nil
      @logo = nil
      @metadata = nil
      @meta_available_locales = nil
      @event = nil
      @created_at = nil
      @updated_at = nil
    end

    # Parse json to School object
    def self.parse_json(props)
      school = School.new

      school.id = props['id']
      school.name = props['name']
      school.password = props['password']
      school.subdomain = props['subdomain']
      school.domains = props['domains']
      school.rdstation_token = props['rdstation_token']
      school.adroll_adv_id = props['adroll_adv_id']
      school.adroll_pix_id = props['adroll_pix_id']
      school.email = props['email']
      school.phone = props['phone']
      school.cnpj = props['cnpj']
      school.samba_key = props['samba_key']
      school.samba_player_key = props['samba_player_key']
      school.samba_access_token = props['samba_access_token']
      school.samba_project_id = props['samba_project_id']
      school.terms_of_use = props['terms_of_use']
      school.adroll_adv_id = props['adroll_adv_id']
      school.adroll_pix_id = props['adroll_pix_id']
      school.facebook = props['facebook']
      school.twitter = props['twitter']
      school.linkedin = props['linkedin']
      school.pinterest = props['pinterest']
      school.google_plus = props['google_plus']
      school.youtube = props['youtube']
      school.instagram = props['instagram']
      school.site = props['site']
      school.address = props['address']
      school.company_name = props['company_name']
      school.seo_title = props['seo_title']
      school.seo_description = props['seo_description']
      school.logo = props['logo']
      school.metadata = props['metadata']
      school.meta_available_locales = props['meta_available_locales']
      school.event = props['event']

      unless props['created_at'].nil?
        school.created_at = Date.parse(props['created_at'])
      end
      unless props['updated_at'].nil?
        school.updated_at = Date.parse(props['updated_at'])
      end

      school
    end

    # Parse created json to School object
    def self.parse_json_created(props)
      school = School.new

      school.id = props['school']['id']
      school.credentials = props['admin']['credentials']

      school
    end

    # Create a School, if anything goes wrong an exception will be raised
    # Just id and name are populated after create
    #
    # Example:
    #   >> School.create!(token, "name" => "test")
    #   => #<EdoolsSdk::School:0x0000000234d350 @id=nil, @credentials=nil, @name="test", @password=nil, @subdomain=nil, @domains=nil, @rdstation_token=nil, @adroll_adv_id=nil, @adroll_pix_id=nil, @email=nil, @phone=nil, @cnpj=nil, @samba_key=nil, @samba_player_key=nil, @samba_access_token=nil, @samba_project_id=nil, @terms_of_use=nil, @facebook=nil, @twitter=nil, @linkedin=nil, @pinterest=nil, @google_plus=nil, @youtube=nil, @instagram=nil, @site=nil, @address=nil, @company_name=nil, @seo_title=nil, @seo_description=nil, @logo=nil, @metadata=nil, @meta_available_locales=nil, @event=nil, @created_at=nil, @updated_at=nil>
    def self.create!(token, props)
      response = HTTP
        .headers('Authorization' => "Token token=\"#{token}\"")
        .post(SCHOOL_URL_CREATE, :json => props)

      raise "invalid status code #{response.status}" if response.status != 201

      body = response.parse(:json)

      School.parse_json_created(body)
    end

    # Create a School
    # Just id and name are populated after create
    #
    # Example:
    #   >> School.create(token, "name" => "test")
    #   => #<EdoolsSdk::School:0x0000000234d350 @id=nil, @credentials=nil, @name="test", @password=nil, @subdomain=nil, @domains=nil, @rdstation_token=nil, @adroll_adv_id=nil, @adroll_pix_id=nil, @email=nil, @phone=nil, @cnpj=nil, @samba_key=nil, @samba_player_key=nil, @samba_access_token=nil, @samba_project_id=nil, @terms_of_use=nil, @facebook=nil, @twitter=nil, @linkedin=nil, @pinterest=nil, @google_plus=nil, @youtube=nil, @instagram=nil, @site=nil, @address=nil, @company_name=nil, @seo_title=nil, @seo_description=nil, @logo=nil, @metadata=nil, @meta_available_locales=nil, @event=nil, @created_at=nil, @updated_at=nil>
    def self.create(token, props)
      response = HTTP
        .headers('Authorization' => "Token token=\"#{token}\"")
        .post(SCHOOL_URL_CREATE, :json => props)

      return response if response.status != 201

      body = response.parse(:json)

      School.parse_json_created(body)
    end

    # Update School by id
    #
    # Example:
    #   >> School.update_by_id(22, "name" => "test")
    #   => #<EdoolsSdk::School:0x0000000234d350 @id=nil, @credentials=nil, @name="test", @password=nil, @subdomain=nil, @domains=nil, @rdstation_token=nil, @adroll_adv_id=nil, @adroll_pix_id=nil, @email=nil, @phone=nil, @cnpj=nil, @samba_key=nil, @samba_player_key=nil, @samba_access_token=nil, @samba_project_id=nil, @terms_of_use=nil, @facebook=nil, @twitter=nil, @linkedin=nil, @pinterest=nil, @google_plus=nil, @youtube=nil, @instagram=nil, @site=nil, @address=nil, @company_name=nil, @seo_title=nil, @seo_description=nil, @logo=nil, @metadata=nil, @meta_available_locales=nil, @event=nil, @created_at=nil, @updated_at=nil>
    def self.update_by_id(id, props)
      response = HTTP
        .headers('Authorization' => "Token token=\"#{ENV['edools_token']}\"")
        .put("#{SCHOOL_URL_UPDATE}#{id}", :json => props)

      return response if response.status != 204
      
      School.parse_json(props)
    end

    # Update School by id, if anything goes wrong an exception will be raised
    #
    # Example:
    #   >> School.update_by_id!(22, "name" => "test")
    #   => #<EdoolsSdk::School:0x0000000234d350 @id=nil, @credentials=nil, @name="test", @password=nil, @subdomain=nil, @domains=nil, @rdstation_token=nil, @adroll_adv_id=nil, @adroll_pix_id=nil, @email=nil, @phone=nil, @cnpj=nil, @samba_key=nil, @samba_player_key=nil, @samba_access_token=nil, @samba_project_id=nil, @terms_of_use=nil, @facebook=nil, @twitter=nil, @linkedin=nil, @pinterest=nil, @google_plus=nil, @youtube=nil, @instagram=nil, @site=nil, @address=nil, @company_name=nil, @seo_title=nil, @seo_description=nil, @logo=nil, @metadata=nil, @meta_available_locales=nil, @event=nil, @created_at=nil, @updated_at=nil>
    def self.update_by_id!(id, props)
      response = HTTP
        .headers('Authorization' => "Token token=\"#{ENV['edools_token']}\"")
        .put("#{SCHOOL_URL_UPDATE}#{id}", :json => props)

      raise "invalid status code #{response.status}" if response.status != 204

      School.parse_json(props)
    end
  end
end