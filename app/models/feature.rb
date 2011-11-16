class Feature < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true

  has_many :feature_permissions, :dependent => :destroy
  has_many :roles, :through => :feature_permissions

  def list_roles
    roles.map(&:name).sort.join(', ')
  end
end
