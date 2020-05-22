# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Shortened_Url < ApplicationRecord
    validates :user_id, presence: true
    validates :short_url, :long_url, presence: true, uniqueness: true

    belongs_to :submitter,
        class_name: :User,
        primary_key: :id,
        foreign_key: :user_id

    def self.random_code
        new_url = SecureRandom.urlsafe_base64

         unless Shortened_Url.exists?('short_url': new_url)
            return new_url
         else
            SecureRandom.urlsafe_base64
         end
    end

    def self.create_url(user, l_url)
        s_url = Shortened_Url.random_code
        Shortened_Url.create!('short_url': s_url,  'long_url': l_url, 'user_id': user.id)
    end

    
end
