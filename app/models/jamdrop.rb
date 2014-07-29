# == Schema Information
#
# Table name: jamdrops
#
#  id                  :integer          not null, primary key
#  direct_upload_url   :string(255)      not null
#  upload_file_name    :string(255)
#  upload_content_type :string(255)
#  upload_file_size    :integer
#  upload_updated_at   :datetime
#  processed           :boolean          default(FALSE), not null
#  created_at          :datetime
#  updated_at          :datetime
#

class Jamdrop < ActiveRecord::Base

  has_attached_file :attached_file,
    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/aws.yml",
                    :path => ":class/:attachment/:id/:style/:filename",
                    :url => ':s3_domain_url'

end