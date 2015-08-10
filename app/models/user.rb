class User < ActiveRecord::Base
	has_many :blog, dependent: :destroy
	has_secure_password
end
