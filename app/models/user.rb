class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

# validates :nickname presence: true
# validates :email, presence: true, uniqueness: true, confimation: true, format:{with: VALID_EMAIL}
# validates :encrypted_password, presence: true, confirmation: true, length: { minimum: 7 }
# validates :encrypted_password, password_confirmation: true
# validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
# validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
# validates :first_name_kana, presence: true, format: { with: /\A[ぁ-んー－]+\z/ }
# validates :last_name_kana, presence: true, format: { with: /\A[ぁ-んー－]+\z/ } 
# validates :birthday, presence: true, length: { is: 8 }, format: { with: /\A[0-9]+\z/ }

end
