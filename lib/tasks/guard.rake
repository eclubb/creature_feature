desc 'Run guard'
task :guard do
  sh %{ bundle exec guard --notify false}
end
