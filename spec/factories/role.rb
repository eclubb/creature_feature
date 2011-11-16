FactoryGirl.define do

  factory :role do
    sequence(:name) { |n| "Role #{n}" }
  end
end

FactoryGirl.define do
  factory :role_with_a_feature, :parent => :role do
    after_build do |role|
      feature = Feature.where(:name => 'Manage Users').first ||
                Factory.build(:feature, :name => 'Manage Users')
      role.features << feature
    end
  end
end

FactoryGirl.define do
  factory :role_with_two_features, :parent => :role do
    after_build do |role|
      feature1 = Feature.where(:name => 'Manage Users').first ||
                 Factory.build(:feature, :name => 'Manage Users')
      feature2 = Feature.where(:name => 'Manage Roles').first ||
                 Factory.build(:feature, :name => 'Manage Roles')
      role.features << feature1
      role.features << feature2
    end
  end
end

FactoryGirl.define do
  factory "role_with_a_read-only_feature", :parent => :role do
    after_build do |role|
      feature = Feature.where(:name => 'Manage Users').first ||
                Factory.build(:feature, :name => 'Manage Users')
      role.features << feature
      role.save
      role.feature_permissions.first.update_attributes(:read_only => true)
    end
  end
end
