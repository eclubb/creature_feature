cucumber_options = { :cli => "--format progress --no-profile --require features/support --require features/step_definitions",
                     :all_on_start => false, :all_after_pass => false,
                     :notification => false }
guard 'cucumber', cucumber_options do
  watch(%r{^features/.+\.feature$})
  watch(%r{^features/support/.+\.rb$})                  { 'features' }
  watch(%r{^features/step_definitions/(.+)_steps\.rb$}) do |m|
    Dir["**/#{m[1]}.feature"][0]
  end
  watch(%r{^spec/factories/(.+)\.rb$}) do |m|
    grep = `grep -r "Given .* #{m[1]} exists" features/*.feature`
    files = grep.split("\n").map { |l| l[/^[^:]*/] }
    files
  end
end

rspec_options = { :all_on_start => false, :all_after_pass => false,
                  :version => 2,
                  :notification => false }
guard 'rspec', rspec_options do
  watch('spec/spec_helper.rb')                       { 'spec' }
  watch('config/routes.rb')                          { 'spec/routing' }
  watch('app/controllers/application_controller.rb') { 'spec/controllers' }
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^app/(.+)\.rb$})                          { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^lib/(.+)\.rb$})                          { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$}) do |m|
    ["spec/routing/#{m[1]}_routing_spec.rb",
     "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb",
     "spec/acceptance/#{m[1]}_spec.rb"]
  end
  watch(%r{^spec/factories/(.+)\.rb$}) do |m|
    grep = `grep -r Factory.create\\(:#{m[1]}\\) spec/**/**/*_spec.rb`
    files = grep.split("\n").map { |l| l[/^[^:]*/] }
    files
  end
end
