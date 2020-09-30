class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:twitter]

  has_many :stacks, dependent: :destroy

  def self.find_for_oauth(auth)
   user = User.where(uid: auth.uid, provider: auth.provider).first

   unless user
     user = User.create(
       uid:      auth.uid,
       provider: auth.provider,
       email:    User.dummy_email(auth),
       password: Devise.friendly_token[0, 20],
       image: auth.info.image.insert(4,"s"),
       name: auth.info.name,
       nickname: auth.info.nickname,
       location: auth.info.location
     )
   end

   if user.nickname != auth.info.nickname
     user.update(nickname: auth.info.nickname)
   end

   if user.image != auth.info.image
     user.update(image: auth.info.image)
   end

   if user.name != auth.info.name
     user.update(name: auth.info.name)
   end

   user
  end

  private

  def self.dummy_email(auth)
   "#{auth.uid}-#{auth.provider}@example.com"
  end

  def make_https(auth)
    http = auth.info.image
    http.insert(4,"s")
  end
end
