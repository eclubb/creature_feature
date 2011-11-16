class FeaturePermission < ActiveRecord::Base
  validates_presence_of :role_id
  validates_presence_of :feature_id

  belongs_to :role
  belongs_to :feature
end
