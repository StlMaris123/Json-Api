class AddReferenceToTenant < ActiveRecord::Migration[5.1]
  def change
    add_reference :tenants, :tenant, foreign_key: true
  end
end
