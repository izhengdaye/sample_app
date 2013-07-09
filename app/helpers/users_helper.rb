module UsersHelper
 # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user)
  	gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
  	gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
  	# gravatar_url = "https://secure.gravatar.com/avatar/fda192187b6da9c7b254482818093439/avatar/fda192187b6da9c7b254482818093439?s=80"
  	image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
