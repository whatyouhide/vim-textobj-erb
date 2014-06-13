task ci: [:dump_vim_version, :test]

task :dump_vim_version do
  sh 'vim --version'
end

task :test do
  sh 'bundle exec vim-flavor test'
end
