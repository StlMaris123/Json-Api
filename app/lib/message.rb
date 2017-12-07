class Message
  def self.not_foundi(record = 'record')
    "sorry, #{record} not found."
  end

  def self.invalid_credentials
    'Invalid credentials'
  end

  def self.invalid_token
    'Invalid token'
  end

  def self.missing_token
    'Missing token'
  end

  def self.authorized
    'Unauthorized request'
  end

  def self.account_created
    'Account could not be created'
  end

  def self.expired_token
    'Sorry yout token has expired. Please log in to continue.'
  end
end
