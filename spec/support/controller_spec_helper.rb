module ControllerSpecHelper
  def token_generator(tenant_id)
    JsonWebToken.encode(tenant_id: tenant_id)
  end

  def expired_token_generator(tenant_id)
    JsonWebToken.encode({ tenant_id: tenant_id }, (Time.now.to_i - 10))
  end

  def valid_headers
    {
      "Authorization" => token_generator(tenant.id),
      "Content-Type" => "application/json"
    }
  end

  def invalid_headers
    {
      "Authorization" => nil,
      "Content-Type" => "application/json"
    }
  end
end
