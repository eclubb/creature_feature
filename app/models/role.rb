class Role < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true

  has_many :feature_permissions, :dependent => :destroy
  has_many :features, :through => :feature_permissions

  def read_only_features
    list = []

    feature_permissions.each do |fp|
      list << fp.feature if fp.read_only
    end

    list
  end

  def list_features
    list = feature_permissions.map do |fp|
      name = I18n.t("admin.features.#{fp.feature.name}")
      name = fp.feature.name if name.include? 'translation missing'
      name += ' (Read-Only)' if fp.read_only
      name
    end

    list.sort.join(', ')
  end
end
