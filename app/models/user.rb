class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    attr_accessor :age
    
    has_secure_password

    has_many :posts, dependent: :destroy
    validates :name, presence: true

end
