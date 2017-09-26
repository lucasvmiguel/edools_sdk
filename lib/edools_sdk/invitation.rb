module EdoolsSdk
  # Invitation class
  class Invitation < EdoolsBase
    attr_accessor(
      :id,
      :first_name,
      :last_name,
      :email,
      :cpf,
      :phone,
      :skype,
      :twitter,
      :facebook,
      :company_name,
      :company_position,
      :born_at,
      :biography,
      :cover_image_url
    )

    # Parse json to Invitation object
    def self.parse_json(props)
      invitation = Invitation.new

      invitation.id = props['id']
      invitation.first_name = props['first_name']
      invitation.last_name = props['last_name']
      invitation.email = props['email']
      invitation.cpf = props['cpf']
      invitation.phone = props['phone']
      invitation.skype = props['skype']
      invitation.twitter = props['twitter']
      invitation.facebook = props['facebook']
      invitation.company_name = props['company_name']
      invitation.company_position = props['company_position']
      invitation.born_at = props['born_at']
      invitation.biography = props['biography']
      invitation.cover_image_url = props['cover_image_url']

      invitation
    end
  end
end

    
    
    
    
    
    
    
    
    
    
    
    
    
    