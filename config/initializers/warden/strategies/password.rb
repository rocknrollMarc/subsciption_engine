Warden::Strategies.add(:password) do
  def subdomain
    ActionDispatch::Http::URL.extract_subdomains(request.host, 1)
  end

  def valid?
    subdomain.present? && params["user"]
  end

  def authenticate!
    return fail! unless account = Subscriber::Account.find_by(subdomain: subdomain)
    return fail! unless user = account.users.find_by(email: params["user"]["email"])
    return fail! unless user.authenticate(params["user"]["password"])


  end
end
