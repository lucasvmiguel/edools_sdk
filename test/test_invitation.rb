require 'minitest/autorun'
require 'edools_sdk'

class InvitationTest < Minitest::Test
  def test_initialize
    invitation = EdoolsSdk::Invitation.new

    assert_nil invitation.id
    assert_nil invitation.first_name
    assert_nil invitation.last_name
    assert_nil invitation.email
    assert_nil invitation.cpf
    assert_nil invitation.phone
    assert_nil invitation.skype
    assert_nil invitation.twitter
    assert_nil invitation.facebook
    assert_nil invitation.company_name
    assert_nil invitation.company_position
    assert_nil invitation.born_at
    assert_nil invitation.biography
    assert_nil invitation.cover_image_url
  end
end