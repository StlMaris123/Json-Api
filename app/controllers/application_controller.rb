class ApplicationController < ActionController::API
  before_action :authenticate_tenant!

  rescue_from ::Milia::Control::MaxTenantExceeded, :with => :max_tenants
  rescue_from ::Milia::Control::InvalidTenantAccess, :with => :invalid_tenant
  include Response
  include ExceptionHandler

  def authenticate_tenant!()
  end


end
