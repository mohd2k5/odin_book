module ApplicationHelper
  def gravatar_for(user, size: 80)
    email_hash = Digest::MD5.hexdigest(user.email.downcase)
    image_url = "https://www.gravatar.com/avatar/#{email_hash}?s=#{size}&d=identicon"

    image_tag image_url, alt: user.email, class: "gravatar"
  end
end