class User < ApplicationRecord
  include Clearance::User

  attribute :role, :string, default: 'customer'
end
