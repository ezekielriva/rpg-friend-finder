class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  devise :omniauthable, omniauth_providers: [:facebook]

  has_many :groups,         inverse_of: :owner, foreign_key: :owner_id
  has_many :subscriptions,  through: :groups_users
  has_many :groups_users

  scope :not_owner, ->(user) { where.not(id: user.id) }

  class << self
    def from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email    = auth.info.email || "#{auth.uid}@#{auth.provider}.com"
        user.password = Devise.friendly_token[0,20]
        user.name     = auth.info.name   # assuming the user model has a name
        user.avatar   = auth.info.image # assuming the user model has an image
        user.skip_confirmation!
      end
    end

    def new_with_session(params, session)
      super.tap do |user|
        if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
        end
      end
    end

    def not_in_group(group)
      member_ids = group.members.pluck(:id)
      where.not(id: member_ids)
    end
  end
end
